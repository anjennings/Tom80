;;////////////////
;;//;UART Registers
;;////////////////

UART_DHR equ        0x0 ;;UART Data R/W register
UART_IER equ        0x1 ;;Interrupt Enable Register
UART_IFR equ        0x2 ;;Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
UART_LCR equ        0x3 ;;Line Control Register
UART_MCR equ        0x4 ;;Modem Control
UART_LSR equ        0x5 ;;Line Status Register
UART_MSR equ        0x6 ;;Modem Status (Unused)
UART_SCR equ        0x7 ;;Arbitrary data can be stored here

UART_CLEAR_DLAB:
    PUSH AF
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A
    POP AF
    RET