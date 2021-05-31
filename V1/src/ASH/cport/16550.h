#ifndef 16550_H_
#define 16550_H_

//////////////////
//UART Registers
//////////////////

#define UART_DHR 0x0 //UART Data R/W register
#define UART_IER 0x1 //Interrupt Enable Register
#define UART_IFR 0x2 //Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
#define UART_LCR 0x3 //Line Control Register
#define UART_MCR 0x4 //Modem Control
#define UART_LSR 0x5 //Line Status Register
#define UART_MSR 0x6 //Modem Status (Unused)
#define UART_SCR 0x7 //Arbitrary data can be stored here

//////////////////////////////////////
//UART Functions
//////////////////////////////////////
void UART_INIT();
void UART_CLEAR_DLAB();
	
#endif