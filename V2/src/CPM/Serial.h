;Baud Rate Divisor (115200)
BAUD_DIV_HIGH equ 0
BAUD_DIV_LOW equ 8

;////////////////
;UART Registers
;////////////////

UART_DHR equ        0x10 ;UART Data R/W register
UART_IER equ        0x11 ;Interrupt Enable Register
UART_IFR equ        0x12 ;Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
UART_LCR equ        0x13 ;Line Control Register
UART_MCR equ        0x14 ;Modem Control
UART_LSR equ        0x15 ;Line Status Register
UART_MSR equ        0x16 ;Modem Status (Unused)
UART_SCR equ        0x17 ;Arbitrary data can be stored here