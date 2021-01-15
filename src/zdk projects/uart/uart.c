#include "uart.h"

//I know that there are premade library functions
//for I/O but they don't seem to work and there is 
//no documentation to help me troubleshoot

//plus, these are faster

void UART_CLEAR_LSR(){
	__asm
    PUSH AF
    IN A, (UART_LSR)
    POP AF
    RET
	__endasm
}

void UART_SET_BAUD(){
	__asm
    PUSH AF
    LD A, BAUD_DIV_LOW
    OUT (UART_DHR), A
    LD A, BAUD_DIV_HIGH
    OUT (UART_IER), A
    POP AF
    RET
	__endasm
}

void UART_DISABLE_FIFO(){
	__asm
    PUSH AF
    LD A, 0x6
    OUT (UART_IFR), A
    POP AF
    RET
	__endasm
}

void UART_SET_LINE_CONTROL(){
	__asm
    PUSH AF
    LD A, 0x3         //8 Bit word, 1 stop, no parity
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_CLEAR_DLAB(){
	__asm
	push AF
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_SET_DLAB(){
	
	__asm
	PUSH AF
    IN A, (UART_LCR)
    OR 0x80
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_TOGGLE_OUT1(){
	__asm
	PUSH AF
    IN A, (UART_MCR)
    XOR 0x4
    OUT (UART_MCR), A
    POP AF
    RET
	__endasm
}

void UART_TOGGLE_OUT2(){
	__asm
	PUSH AF
    IN A, (UART_MCR)
    XOR 0x8
    OUT (UART_MCR), A
    POP AF
    RET
	__endasm
}

void UART_INIT(){
	
	UART_CLEAR_DLAB();
    UART_DISABLE_FIFO();
    UART_SET_LINE_CONTROL();
    UART_TOGGLE_OUT1();
    UART_TOGGLE_OUT2();
    UART_CLEAR_LSR();
    UART_SET_DLAB();
    UART_SET_BAUD();
    UART_CLEAR_DLAB();
	
}

