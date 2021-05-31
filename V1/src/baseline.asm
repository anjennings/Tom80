;Absolute Baseline Test
;This is just to get the board running and to see if it does anything
;Dont use RAM/Stack, just try to get the UART to react to input

;////////////////
;UART Registers
;////////////////

UART_DHR equ        0x0 ;UART Data R/W register
UART_IER equ        0x1 ;Interrupt Enable Register
UART_IFR equ        0x2 ;Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
UART_LCR equ        0x3 ;Line Control Register
UART_MCR equ        0x4 ;Modem Control 
UART_LSR equ        0x5 ;Line Status Register
UART_MSR equ        0x6 ;Modem Status (Unused)
UART_SCR equ        0x7 ;Arbitrary data can be stored here

;According to the datasheet:
;8 Databits, No parity, 1 Stop

;Stack Pointer
STACK_H equ 0xFF
STACK_L equ 0xFF

org 0h
BOOT:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    JP MAIN

org 0038h
INT:
    NOP
    NOP
    RETI

MAIN:

    IN A, UART_LCR
    AND 7Fh
    OUT UART_LCR, A

    ;Disable All Interrupts
    LD A, 0 
    OUT UART_IER, A

    ;FIFO Enable
    LD A, 1
    OUT UART_IFR, A

    ;Line Control
    LD A, 03h         ;8 Bit word, 1 stop, no parity
    OUT UART_LCR, A

    ;Set OUT pins Low (as an indicator)
    LD A, 0Ch      
    OUT UART_MCR, A
    ;Set DLAB=1
    IN A, UART_LCR
    OR 80h
    OUT UART_LCR, A

    ;Divide Clock by 96 for 9600 baud (Assuming 14.7456 MHz clock)
    LD A, 96
    OUT UART_DHR, A
    LD A, 0
    OUT UART_IER, A

    HALT
