#include <stdio.h>
#include "xparameters.h"
#include "platform.h"
#include "xil_printf.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xil_exception.h"
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
#define FRAME_SIZE (SIZE_X * SIZE_Y / 5 + 1)

XAxiDma AxiDma; /* Instance of the XAxiDma */
INTC Intc; /* Instance of the Interrupt Controller */

int new_frame_ready = 0;
u8 current_frame = 1;

int SetupIntrSystem(INTC * IntcInstancePtr,XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 RxIntrId);
void TxIntrHandler(void *Callback);
void Data_requestIntrHandler(void *Callback);
//=====================================================================================
// frame functions

//add first-finish markers to the frame
void markFrame(u16 *frame) {
	frame[0] = 0x8000;
	frame[FRAME_SIZE - 1] |= 0x4000;
}

//sets all frame (including to 0, but prepares "first"
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

int main()
{
	XAxiDma_Config *CfgPtr;
	int 	status;
	u16* 	frameBaseAddr;
	u16 	*frame0 = (u16*)FRAME_0_BASE,
			*frame1 = (u16*)FRAME_1_BASE;
	char 	key;
	int 	shift = 0;


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
		while(new_frame_ready);
		frameBaseAddr = !current_frame ? frame1 : frame0;
		testFrame(frameBaseAddr, shift);
		Xil_DCacheFlushRange((UINTPTR)frameBaseAddr, FRAME_SIZE * 2);
		new_frame_ready = 1;
		//get key and move stuff - placeholder
		key = inbyte();
		switch(key){
		case 'w':
			--shift;
			break;
		case 'a':
			++shift;
			break;
		case 'd':
			--shift;
			break;
		case 's':
			++shift;
			break;
		}
		xil_printf("%c",key);
	}
	cleanup_platform();
	return 0;
}

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
	if (new_frame_ready == 1) {
		current_frame = !current_frame;
		new_frame_ready = 0;
	}
}

void Data_requestIntrHandler(void *Callback)
{
	//maybe it's unitptr from the start and conversion isn't needed?
	UINTPTR frameBaseAddr = current_frame ? FRAME_1_BASE : FRAME_0_BASE;
	XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)frameBaseAddr,
			FRAME_SIZE * 2, XAXIDMA_DMA_TO_DEVICE); //BYTES
	XScuGic_Disable(&Intc, VGA_INTR_ID);
}
