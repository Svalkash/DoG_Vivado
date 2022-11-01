#include <stdio.h>
#include "xorwow.h"
#include <time.h>
#include <curses.h>
#include <malloc.h>
#include <stdlib.h>
// 640/16, 480/16
#define SIZE_X 40
#define SIZE_Y 30
// Frame size in WORDS; 5 - transaction size, +1 because of "start" transaction and "some space after"
#define FRAME_SIZE (SIZE_X * SIZE_Y / 5 + 1)
#define FRAME_SIZE_REAL (SIZE_X * SIZE_Y / 5 + 1)
//Time interval for advancement
#define GAME_SPEED_SECONDS 1.0

#define u8 uint8_t
#define u16 uint16_t
#define u32 uint32_t

int new_frame_ready = 0;
u8 current_frame = 1;

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

void BLYAT() {
    endwin();
    exit(1);
}

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
	//EDITED: not 7!!!
	gameState->map[xbi][pos.y] = (gameState->map[xbi][pos.y] & (~(0xF << xbs))) | (block.val << xbs) | (block.dir << (xbs+2));
}

//EDITED: wrong range calculation
//adds a random food on the screen
void addFood(gameState_t *gameState, int cnt) {
	int x_min, y_min, x_max, y_max, x_range, y_range;
    x_min = 0, y_min = 0;
    x_max = SIZE_X, y_max = SIZE_Y; //not inclusive!!
    u8 tooBig = gameState->snakeLen > (x_max-x_min)*(y_max-y_min) * 3/4;
    if (tooBig) {
        //low chance to place randomly, find place around the tail
        x_min = gameState->tail.x - 5;
        if (x_min < 0) x_min = 0;
        y_min = gameState->tail.y - 5;
        if (y_min < 0) y_min = 0;
        x_max = gameState->tail.x + 5;
        if (x_max >= SIZE_X) x_max = SIZE_X;
        y_max = gameState->tail.y + 5;
        if (y_max >= SIZE_Y) x_max = SIZE_Y;
        if (cnt < SIZE_X * SIZE_Y - gameState->snakeLen) cnt = SIZE_X * SIZE_Y - gameState->snakeLen;
    }
    x_range = x_max - x_min;
    y_range = y_max - y_min;
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

//WHERE THESE SHOULD BE?!
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

//EDITED: head movement, head/body blocks
void advanceGame(gameState_t *gameState) {
	if (gameState->freeze) return;
    //get next head position
    u8 headDir = getBlock(gameState, gameState->head).dir;
    pos_t newHead = moveDir(gameState->head, headDir);
    block_t nb_head = {B_HEAD, headDir}; //head
    block_t nb_snake = {B_SNAKE, headDir}; //body
    //check gameover events
    if ((!pos_eq(newHead, gameState->tail) && getBlock(gameState, newHead).val == B_SNAKE) //exception for the tail - it moves too!
        	|| newHead.x == -1 || newHead.x == SIZE_X || newHead.y == -1 || newHead.y == SIZE_Y) {
        gameState->freeze = 1; //just freeze the game and return
        return;
    }
    //move body, check food
    if (getBlock(gameState, newHead).val == B_FOOD) {
        //move head only
        setBlock(gameState, gameState->head, nb_snake); //change old head to body
        setBlock(gameState, newHead, nb_head); //set new head
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
        //New tail position is already body, so no problems... or maybe it's the head? Same.
        gameState->tail = newTail; //change tail "pointer"
        //now can move head
        setBlock(gameState, gameState->head, nb_snake); //change old head to body
        setBlock(gameState, newHead, nb_head); //set new head
        gameState->head = newHead; //change head "pointer"
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

char ascii(uint8_t b) {
    return b == B_EMPTY ? '.'
        : b == B_SNAKE ? 'o'
        : b == B_HEAD ? 'O'
        : b == B_FOOD ? 'X' : 'm';
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
		    printw("%c", ascii(d));
		}
		printw("\n\r");
	}
	markFrame(frame);
	printw("\n\r");
	printw("\n\r");
}

void gameFrame(u16 *frame, gameState_t *gameState) {
	emptyFrame(frame); //set to zeros first
    for (int y = 0; y < SIZE_Y; ++y) {
		for (int x = 0; x < SIZE_X; ++x) {
			int bi = y * SIZE_X + x; //block index
			int wi = bi / 5 + 1; //word index; 1 for "first"
			int ws = (bi % 5) * 2; //(inside) word shift
			pos_t p = {x, y};
			u8 tmp = ((gameState->freeze &&
					(x == 0 || x == SIZE_X - 1
					|| y == 0 || y == SIZE_Y - 1)) ?
					B_FOOD : getBlock(gameState, p).val);
			frame[wi] |= tmp << ws;
		    printw("%c", ascii(tmp));
		}
		printw("\n\r");
	}
	markFrame(frame);
	printw("\n\r");
	printw("\n\r");
}

//=====================================================================================
// main func

int main()
{
	int 	status;
	u16* 	frameBaseAddr;
	u16 	*frame0 = (u16*)calloc(FRAME_SIZE, sizeof(u16)),
			*frame1 = (u16*)calloc(FRAME_SIZE, sizeof(u16));
	int32_t 	key;

	clock_t t_last;
	clock_t t_cur;

	gameState_t gameState;
	
	initscr();
	clear();
	noecho();
	cbreak();	/* Line buffering disabled. pass on everything */
	refresh();

	// init random stuff
	printw("Start\n\r");
	//init memory with 0; "first" - not 0 (yeah, first frame will be trash, deal with it?)
	emptyFrame(frame0);
	emptyFrame(frame1);
	/* Disable all interrupts before setup */

	while(1){
	    clear();
		frameBaseAddr = !current_frame ? frame1 : frame0;
		if (firstGame) testFrame(frameBaseAddr, 0);
		else gameFrame(frameBaseAddr, &gameState);
		refresh();
		//record current time
		t_last = clock();
		t_cur = t_last;
		//EDITED: note that clocks-per-sec might cause trouble
		while ((double)(t_cur - t_last) / (CLOCKS_PER_SEC/100) < 1.0) {
		    timeout(1);
			key = getch(); //try to get inbyte
			if (key != ERR) handleKey(&gameState, (char)key);
			t_cur = clock();
			//clear();
			//printw("%f", (double)(t_cur - t_last) / (CLOCKS_PER_SEC/20));
			//printw("%d - %d = %d / %d", t_cur, t_last, t_cur - t_last, CLOCKS_PER_SEC);
		}
        printw("aboba");
        refresh();
		//advance game state
		advanceGame(&gameState);
		//ready to output a new frame!
	}
	return 0;
}
