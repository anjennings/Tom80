;ASH - Aidan's SHell
;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

;TODO:
;Change most DE to HL
;Change eror to check for non-zero values
;Finish Tokenizer
;Start Parser
;Start Execution Function
;A lot of the JP could probably be replaced with JR (which is faster I think)

STACK_H equ 0xFF
STACK_L equ 0xFF

;First byte of term buf is the size of the term buf
TERM_BUF equ 0x8000
;Maximum size of the buffer
TERM_BUF_MAX  equ 256

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

;///////////
;Charactars
;///////////

NEWLINE equ 0xA
RETURN equ 0xD
EOF equ 0x0
SPACE equ 0x20

NUM0 equ 0x30
NUM1 equ 0x31
NUM2 equ 0x32
NUM3 equ 0x33
NUM4 equ 0x34
NUM5 equ 0x35
NUM6 equ 0x36
NUM7 equ 0x37
NUM8 equ 0x38
NUM9 equ 0x39

SYM_READ equ ":"
SYM_WRITE equ "<"
SYM_EXE equ "@"
SYM_HELP equ "?"

;/////////////////
;Code Starts HERE
;/////////////////
org 0000h
BOOT:
    ;Wait a few clocks
    NOP
    NOP
    NOP
    NOP
    ;Set up Stack
    LD H, STACK_H
    LD L, STACK_L
    LD SP, HL
    ;Set up UART
    CALL UART_INIT
    ;Disable interrupt
    IM 1
    DI
    ;Boot Sequence Complete
    JP MAIN

    ;//////////////////
    ;Interrupt Routine
    ;//////////////////
    org 0038h
    NOP
    NOP
    RETI

MAIN:
    ;Print Boot Screen
    LD HL, BOOT_MSG
    CALL WRITE_STR

    ;Print Ready Message
    LD HL, READY_MSG
    CALL WRITE_STR

    ;Set Terminal buffer to 0 
    LD BC, TERM_BUF
    LD A, 0
    LD (BC), A

    JP MAIN

;MAIN_LOOP:
    ;CALL GETCH
;    CALL EVALUATE_STMT
;    JP MAIN_LOOP

;    HALT

;//////////////////////
;//////Functions///////
;//////////////////////

;//////////////////////////////////////
;Set up UART
;//////////////////////////////////////
UART_INIT:
    PUSH AF
    ;Set DLAB=0, just in case
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
    ;Return
    POP AF
    RET


;//////////////////////////////////////
;Get a character from the FIFO, add to write buffer and echo to screen
;//////////////////////////////////////
GETCH:
    PUSH AF
    PUSH BC
    ;Set DLAB 0
    IN A, UART_LCR
    AND 7Fh
    OUT UART_LCR, A
    GETCH_LOOP:
    ;Read Line Status Reg
    IN A, UART_LSR
    ;Only care about bit 0
    AND 1
    ;If bit 0 is a 1 then FIFO has new data
    CP 1
    ;Jump to end if bit 0 was a 0
    JP NZ, GETCH_END
    ;Get next char from data holding register
    IN A, UART_DHR
    CALL WRITE_BUFFER
    JP GETCH_LOOP

    GETCH_END:
    POP BC
    POP AF
    RET


;///////////////////////////////////////
;Write a charactar to the terminal buffer, and echo to screen
;expects A to be the character
;//////////////////////////////////////
WRITE_BUFFER:
    PUSH AF
    PUSH BC
    PUSH DE

    ;Save character in D
    LD D, A
    ;Load address of terminal buffer
    LD BC, TERM_BUF
    ;Get size of terminal buffer
    LD A, (BC)
    ;Add 1
    INC A
    ;Write new length to start of buffer
    LD (BC), A
    ;Add A and C for new offset (C should be 0 but just in case)
    ADD A, C
    ;Put A into C
    LD C, A
    ;Put char back into A
    LD A, D
    ;Write to buffer
    LD (BC), A

    CALL PRINTCH

    POP DE
    POP BC
    POP AF
    RET

;/////////////////////////////////////////
;Assumes that A is the charactar to write
;/////////////////////////////////////////
PRINTCH:
    PUSH AF
    ;Set DLAB 0
    IN A, UART_LCR
    AND 7Fh
    OUT UART_LCR, A
    ;TODO: read transmit register status? Page 22
    ;Write Char to UART
    OUT UART_DHR, A
    POP AF
    RET


;////////////////////////////////////////
;Writes a string via IO 
;Disables Interrupts
;Expects HL to be the address of a string
;////////////////////////////////////////
WRITE_STR:
    DI
    PUSH AF
    PUSH HL
    ;Set DLAB 0
    IN A, UART_LCR
    AND 7Fh
    OUT UART_LCR, A
    WRITE_START:
    LD A, (HL)
    CP 0
    JP Z, WRITE_CLOSE
    ;OUT UART_DHR, A
    CALL PRINTCH
    INC HL
    JP WRITE_START
    WRITE_CLOSE:
    POP HL
    POP AF
    ;EI
    ret


;//////////////////////
;/////////DATA/////////
;//////////////////////

BOOT_MSG:
.db NEWLINE, RETURN, "ASH v0.03", NEWLINE, RETURN, "(C) 2020 by Aidan Jennings"
.db NEWLINE, RETURN, "ZILOG Z80 32k EEPROM, 32k SRAM", NEWLINE, RETURN, "TEXT ONLY", NEWLINE, RETURN, EOF

READY_MSG:
.db NEWLINE, RETURN, "BOOT PROCESS COMPLETE!", NEWLINE, RETURN, EOF

SYNTAX_ERROR:
.db NEWLINE, RETURN, "SYNTAX ERROR", NEWLINE, RETURN, EOF

TOKEN_ERROR:
.db NEWLINE, RETURN, "INVALID TOKEN", NEWLINE, RETURN, EOF

EXE_ERROR:
.db NEWLINE, RETURN, "EXECUTION ERROR", NEWLINE, RETURN, EOF

HELP_TEXT:
.db NEWLINE, RETURN, "INSTRUCTIONS : ", NEWLINE, RETURN, "1FFF : 10 - READ 16 BYTES STARTING AT LOCATION 0x1FFF", NEWLINE, RETURN, "1FFF < 10 - WRITE 0x10 TO LOCAITON 0x1FFF", NEWLINE, RETURN, "@1FFF - BEGIN EXECUTION AT LOCATION 0x1FFF", NEWLINE, RETURN, "? - DISPLAY HELP MESSAGE", NEWLINE, RETURN, EOF

PROMPT:
.db RETURN, ">>>:", EOF
