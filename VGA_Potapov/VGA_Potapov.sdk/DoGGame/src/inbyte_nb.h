#include "xparameters.h"
#include "xuartps_hw.h"
int8_t inbyte_nb (void) {
	u32 ReceivedByte;
	/* Check if there is data */
    if (!XUartPs_IsReceiveData(STDIN_BASEADDRESS)) {
    	return -1;
    }
    /* Read a byte from the input buffer */
    ReceivedByte = XUartPs_ReadReg(STDIN_BASEADDRESS, XUARTPS_FIFO_OFFSET);
    /* Return the byte received */
    return (int8_t) ReceivedByte;
}
