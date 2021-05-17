/*void UART_INIT() {
	__asm
    __asm__("push af");
    CALL UART_CLEAR_DLAB
    CALL UART_DISABLE_FIFO
    CALL UART_SET_LINE_CONTROL
    CALL UART_TOGGLE_OUT1
    CALL UART_TOGGLE_OUT2
    CALL UART_CLEAR_LSR
    CALL UART_SET_DLAB
    CALL UART_SET_BAUD
    CALL UART_CLEAR_DLAB
    POP AF
	ret
	__endasm;
}*/

void UART_CLEAR_DLAB() {
    __asm__("PUSH AF");
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A
    POP AF
	__endasm;
}

/*
UART_SET_DLAB:
    PUSH AF
    IN A, (UART_LCR)
    OR 0x80
    OUT (UART_LCR), A
    POP AF
    RET

UART_SET_LINE_CONTROL:
    PUSH AF
    LD A, 0x3         ;8 Bit word, 1 stop, no parity
    OUT (UART_LCR), A
    POP AF
    RET

UART_DISABLE_FIFO:
    PUSH AF
    LD A, 0x6
    OUT (UART_IFR), A
    POP AF
    RET

UART_SET_BAUD:
    PUSH AF

    ;115200
    LD A, BAUD_DIV_LOW
    OUT (UART_DHR), A
    LD A, BAUD_DIV_HIGH
    OUT (UART_IER), A

    POP AF
    RET

UART_CLEAR_LSR:
    PUSH AF
    ;Clear Line Status Reg Errors (Page 21)
    IN A, (UART_LSR)
    POP AF
    RET

UART_TOGGLE_OUT1:
    PUSH AF
    IN A, (UART_MCR)
    XOR 0x4
    OUT (UART_MCR), A
    POP AF
    RET

UART_TOGGLE_OUT2:
    PUSH AF
    IN A, (UART_MCR)
    XOR 0x8
    OUT (UART_MCR), A
    POP AF
    RET
	*/