#ifndef UART_H_
#define UART_H_

#include <stdlib.h>
#include <string.h>
#include <z80.h>

#define UART_DHR 0 		//UART Data R/W register
#define UART_IER 1 		//Interrupt Enable Register
#define UART_IFR 2 		//Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
#define UART_LCR 3 		//Line Control Register
#define UART_MCR 4 		//Modem Control
#define UART_LSR 5 		//Line Status Register
#define UART_MSR 6 		//Modem Status (Unused)
#define UART_SCR 7 		//Arbitrary data can be stored here

#define BAUD_DIV_HIGH 0
#define BAUD_DIV_LOW 8

///////////////////////////////////////
//UART Functions
///////////////////////////////////////

void UART_INIT();
void UART_CLEAR_DLAB();
void UART_SET_DLAB();
void UART_SET_LINE_CONTROL();
void UART_DISABLE_FIFO();
void UART_SET_BAUD();
void UART_CLEAR_LSR();
void UART_TOGGLE_OUT1();
void UART_TOGGLE_OUT2();

#endif // UART_H_