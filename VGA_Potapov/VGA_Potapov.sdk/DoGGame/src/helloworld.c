#include <stdio.h>
#include "xparameters.h"
#include "platform.h"
#include "xil_printf.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xorwow.h"
#include "xtime_l.h"
#include "inbyte_nb.h"
#define DMA_DEV_ID XPAR_AXIDMA_0_DEVICE_ID
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define INTC XScuGic
#define INTC_HANDLER XScuGic_InterruptHandler
#define TX_INTR_ID XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR
#define VGA_INTR_ID 62
#define FRAME_0_BASE (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x00100000)
#define FRAME_1_BASE (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x00101000)
// 640/16, 480/16
#define SIZE_X 40
#define SIZE_Y 30
// Frame size in WORDS; 5 - transaction size, +1 because of "start" transaction and "some space after"
#define FRAME_SIZE (SIZE_X * SIZE_Y / 5 + 2)
#define FRAME_SIZE_REAL (SIZE_X * SIZE_Y / 5 + 1)
//Time interval for advancement
#define GAME_SPEED_SECONDS 1.0

XAxiDma AxiDma; /* Instance of the XAxiDma */
INTC Intc; /* Instance of the Interrupt Controller */

int new_frame_ready = 0;
u8 current_frame = 1;

int SetupIntrSystem(INTC * IntcInstancePtr,XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 RxIntrId);
void TxIntrHandler(void *Callback);
void Data_requestIntrHandler(void *Callback);

//=====================================================================================
// game types and constants

// some constants from HDL
const u8 B_EMPTY = 0;
const u8 B_SNAKE = 1;
const u8 B_HEAD = 2;
const u8 B_FOOD = 3;
// new constants for directions
const u8 D_UP = 0; // Up is Y negative!!!
const u8 D_LEFT = 1;
const u8 D_DOWN = 2;
const u8 D_RIGHT = 3;
// starting food count
const int FOOD_CNT = 3;

typedef struct pos_s {
    int x;
    int y;
} pos_t;

u8 pos_eq(pos_t a, pos_t b) { return a.x == b.x && a.y == b.y; }

//get next position for anything, no checks
pos_t moveDir(pos_t pos, u8 dir) {
	pos_t np = pos;
    if (dir == D_UP) np.y -= 1;
    if (dir == D_LEFT) np.x -= 1;
    if (dir == D_DOWN) np.y += 1;
    if (dir == D_RIGHT) np.x += 1;
    return np;
}

typedef struct block_s {
    u8 val;
    u8 dir;
} block_t;

//let's store data efficiently!
typedef struct gameState_s {
    u8 map[SIZE_X/2][SIZE_Y]; //block map. Each byte - 2 blocks, each block stores its type and direction - (DIR)(VAL).
    pos_t head; // head to move forward
    pos_t tail; // tail to disappear or not (other tiles don't change)
    int snakeLen; // almost never used
    u8 freeze; // start or finish, doesn't matter
    u8 lastHeadDir; //to avoid 180 turns
} gameState_t;

u8 firstGame = 1; //reset after the first game

//=====================================================================================
// gamestate functions

//get/set block at specific position
block_t getBlock(gameState_t *gameState, pos_t pos) {
	block_t b;
	int xbi = pos.x / 2; //byte index; 1 for "first"
	int xbs = (pos.x % 2) * 4; //(inside) byte shift
	b.val = (gameState->map[xbi][pos.y] >> xbs) & 3;
	b.dir = (gameState->map[xbi][pos.y] >> (xbs+2)) & 3;
	return b;
}

void setBlock(gameState_t *gameState, pos_t pos, block_t block) {
	int xbi = pos.x / 2; //byte index; 1 for "first"
	int xbs = (pos.x % 2) * 4; //(inside) byte shift
	gameState->map[xbi][pos.y] = (gameState->map[xbi][pos.y] & (~(7 << xbs))) | (block.val << xbs) | (block.dir << (xbs+2));
}

//adds a random food on the screen
void addFood(gameState_t *gameState, int cnt) {
	int x_min, y_min, x_max, y_max, x_range, y_range;
    x_min = 0, y_min = 0;
    x_max = SIZE_X, y_max = SIZE_Y;
    u8 tooBig = gameState->snakeLen > (x_max-x_min)*(y_max-y_min) * 3/4;
    if (tooBig) {
        //low chance to place randomly, find place around the tail
        x_min = gameState->tail.x - 5;
        if (x_min < 0) x_min = 0;
        y_min = gameState->tail.y - 5;
        if (y_min < 0) y_min = 0;
        x_range = y_range = 10;
        if (x_min + x_range > x_max) x_range = x_max - x_min;
        if (y_min + y_range > y_max) y_range = y_max - y_min;
        if (cnt < x_max * y_max - gameState->snakeLen) cnt = x_max * y_max - gameState->snakeLen;
    }
    u8 placed = 0;
    pos_t pos;
    do {
        pos.x = x_min + xrand() % x_range;
        pos.y = y_min + xrand() % y_range;
        if (getBlock(gameState, pos).val == B_EMPTY) {
        	block_t bn = {B_FOOD, D_UP};
            setBlock(gameState, pos, bn);
            ++placed;
        }
    } while (placed < cnt);
}

void resetState(gameState_t *gameState) {
    //fill map with EMPTY
    for (int x = 0; x < SIZE_X / 2; ++x)
        for (int y = 0; y < SIZE_Y; ++y)
            gameState->map[x][y] = 0x00;
    //init snake
	pos_t np_h = {SIZE_X/2, SIZE_Y/2};
	block_t nb_h = {B_HEAD, D_UP};
    setBlock(gameState, np_h, nb_h);
    gameState->head = np_h;
	pos_t np_t = {SIZE_X/2, SIZE_Y/2 + 1};
	block_t nb_t = {B_SNAKE, D_UP};
    setBlock(gameState, np_t, nb_t);
    gameState->tail = np_t;
    gameState->snakeLen = 2;
    gameState->lastHeadDir = D_UP;
    //place food on the screen
    addFood(gameState, FOOD_CNT);
    //start the game
    gameState->freeze = 0;
    //reset the first game flag
    firstGame = 0;
}

void setHeadDir(gameState_t *gameState, u8 dir) {
	block_t nb = {B_HEAD, dir};
    if (dir != (gameState->lastHeadDir + 2) % 4) //avoid 180 turns
        setBlock(gameState, gameState->head, nb);
}

void handleKey(gameState_t *gameState, char key) {
	xil_printf("%c",key);
	if (gameState->freeze) resetState(gameState); //start the game after any key is pressed
    else {
		switch(key) {
		case 'w':
			setHeadDir(gameState, D_UP);
			break;
		case 'a':
			setHeadDir(gameState, D_LEFT);
			break;
		case 's':
			setHeadDir(gameState, D_DOWN);
			break;
		case 'd':
			setHeadDir(gameState, D_RIGHT);
			break;
		}
    }
}

void advanceGame(gameState_t *gameState) {
	if (gameState->freeze) return;
    //get next head position
    u8 headDir = getBlock(gameState, gameState->head).dir;
    pos_t newHead = moveDir(gameState->head, headDir);
    block_t nb_h = {B_SNAKE, headDir};
    //check gameover events
    if ((!pos_eq(newHead, gameState->tail) && getBlock(gameState, newHead).val == B_SNAKE) //exception for the tail - it moves too!
        	|| newHead.x == -1 || newHead.x == SIZE_X || newHead.y == -1 || newHead.y == SIZE_Y) {
        gameState->freeze = 1; //just freeze the game and return
        return;
    }
    //move body, check food
    if (getBlock(gameState, newHead).val == B_FOOD) {
        //move head only
        setBlock(gameState, gameState->head, nb_h); //change old head to body
        setBlock(gameState, newHead, nb_h); //set new head
        gameState->head = newHead; //change head "pointer"
        //inc length, check if max
        if (++gameState->snakeLen == SIZE_X * SIZE_Y) {
            gameState->freeze = 1; //gameover (win)
            return;
        }
        //add food if possible
        if (gameState->snakeLen < SIZE_X * SIZE_Y - FOOD_CNT)
            addFood(gameState, 1);
    } else {
        //get next tail position
        u8 tailDir = getBlock(gameState, gameState->tail).dir;
        pos_t newTail = moveDir(gameState->tail, tailDir);
        //move tail first to avoid Uroboros
        block_t nb_empty = {B_EMPTY, D_UP};
        setBlock(gameState, gameState->tail, nb_empty); //change old tail to emptiness
        gameState->tail = newTail; //change tail "pointer"
        //now can move head
        setBlock(gameState, gameState->head, nb_h); //change old head to body
        setBlock(gameState, newHead, nb_h); //set new head
    }
    //update last head dir to current
    gameState->lastHeadDir = headDir;
}

//=====================================================================================
// frame functions

//add first-finish markers to the frame
void markFrame(u16 *frame) {
	frame[0] = 0x8000;
	frame[FRAME_SIZE_REAL - 1] |= 0x4000;
}

//sets all frame to 0, but prepares "first"
void emptyFrame(u16 *frame) {
	for (int i = 0; i < FRAME_SIZE; ++i)
		frame[i] = 0x0000;
	markFrame(frame);
}

void testFrame(u16 *frame, int shift) {
	emptyFrame(frame); //set to zeros first
	for (int y = 0; y < SIZE_Y; ++y) {
		for (int x = 0; x < SIZE_X; ++x) {
			int bi = y * SIZE_X + x; //block index
			int wi = bi / 5 + 1; //word index; 1 for "first"
			int ws = (bi % 5) * 2; //(inside) word shift
			int d = (x + shift) % SIZE_Y - y;
			if (d < 0) d = -d;
			if (d > 3) d = 0;
			frame[wi] |= d << ws;
		}
	}
	markFrame(frame);
}

void gameFrame(u16 *frame, gameState_t *gameState) {
	emptyFrame(frame); //set to zeros first
    for (int y = 0; y < SIZE_Y; ++y) {
		for (int x = 0; x < SIZE_X; ++x) {
			int bi = y * SIZE_X + x; //block index
			int wi = bi / 5 + 1; //word index; 1 for "first"
			int ws = (bi % 5) * 2; //(inside) word shift
			pos_t p = {x, y};
			frame[wi] |= ((gameState->freeze &&
					(x == 0 || x == SIZE_X - 1
					|| y == 0 || y == SIZE_Y - 1)) ?
					B_FOOD : getBlock(gameState, p).val) << ws;
		}
	}
	markFrame(frame);
}

//=====================================================================================
// main func

int main()
{
	XAxiDma_Config *CfgPtr;
	int 	status;
	u16* 	frameBaseAddr;
	u16 	*frame0 = (u16*)FRAME_0_BASE,
			*frame1 = (u16*)FRAME_1_BASE;
	int8_t 	key;

	XTime t_last;
	XTime t_cur;

	gameState_t gameState;

	// init random stuff
	init_platform();
	xil_printf("Start\n\r");
	CfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DMA_DEV_ID);
		return XST_FAILURE;
	}
	status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", status);
		return XST_FAILURE;
	}
	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}
	//disable interrupts for some important reason
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);

	//init memory with 0; "first" - not 0 (yeah, first frame will be trash, deal with it?)
	emptyFrame(frame0);
	emptyFrame(frame1);
	//start system, I guess?
	Xil_DCacheFlushRange((UINTPTR)frame0, FRAME_SIZE * 2); //in BYTES!!!
	Xil_DCacheFlushRange((UINTPTR)frame1, FRAME_SIZE * 2);
	status = SetupIntrSystem(&Intc, &AxiDma, TX_INTR_ID, VGA_INTR_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Failed intr setup\r\n");
		return XST_FAILURE;
	}
	/* Disable all interrupts before setup */
	//TODO: do I really need it? I think not
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	/* Enable all interrupts */
	XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	while(1){
		while(new_frame_ready)
		    ;
		frameBaseAddr = !current_frame ? frame1 : frame0;
		if (firstGame) testFrame(frameBaseAddr, 0);
		else gameFrame(frameBaseAddr, &gameState);
		Xil_DCacheFlushRange((UINTPTR)frameBaseAddr, FRAME_SIZE * 2);
		new_frame_ready = 1;
		//record current time
		XTime_GetTime(&t_last);
		t_cur = t_last;
		while (t_cur - t_last <= GAME_SPEED_SECONDS * COUNTS_PER_SECOND/4) {
			key = inbyte_nb(); //try to get inbyte
			if (key != -1) handleKey(&gameState, (char)key);
			XTime_GetTime(&t_cur);
		}
		//advance game state
		advanceGame(&gameState);
		//ready to output a new frame!
	}
	cleanup_platform();
	return 0;
}

//=====================================================================================
// random interrupt stuff I'm too afraid to touch

int SetupIntrSystem(INTC * IntcInstancePtr,
			XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 Data_requestIntrId)
{
	int status;
	XScuGic_Config *IntcConfig;

	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
				IntcConfig->CpuBaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, TxIntrId, 0xA0, 0x3);
	XScuGic_SetPriorityTriggerType(IntcInstancePtr, Data_requestIntrId, 0xA0, 0x0);

	status = XScuGic_Connect(IntcInstancePtr, TxIntrId,
				(Xil_InterruptHandler)TxIntrHandler,
				AxiDmaPtr);
	if (status != XST_SUCCESS) {
		return status;
	}
	status = XScuGic_Connect(IntcInstancePtr, Data_requestIntrId,
				(Xil_InterruptHandler)Data_requestIntrHandler,
				AxiDmaPtr);
	if (status != XST_SUCCESS) {
		return status;
	}

	XScuGic_Enable(IntcInstancePtr, TxIntrId);
	XScuGic_Enable(IntcInstancePtr, Data_requestIntrId);

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)INTC_HANDLER,
				(void *)IntcInstancePtr);

	Xil_ExceptionEnable();
	return 0;
}

void TxIntrHandler(void *Callback)
{
	XScuGic_Enable(&Intc, VGA_INTR_ID);
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;
	u32 Irqstatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrAckIrq(AxiDmaInst, Irqstatus, XAXIDMA_DMA_TO_DEVICE);
	if (new_frame_ready) {
		current_frame = !current_frame;
		new_frame_ready = 0;
	}
}

void Data_requestIntrHandler(void *Callback)
{
	//maybe it's unitptr from the start and conversion isn't needed?
	UINTPTR frameBaseAddr = current_frame ? FRAME_1_BASE : FRAME_0_BASE;
	XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)frameBaseAddr,
			FRAME_SIZE * 2, XAXIDMA_DMA_TO_DEVICE);
	XScuGic_Disable(&Intc, VGA_INTR_ID);
}
