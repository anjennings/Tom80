;ASH - Aidan's SHell
;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

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
    LD BC, BOOT_MSG
    CALL WRITE_STR

    ;Print Ready Message
    LD BC, READY_MSG
    CALL WRITE_STR

    ;Set Terminal buffer to 0 
    LD BC, TERM_BUF
    LD A, 0
    LD (BC), A

MAIN_LOOP:
    ;CALL GETCH
    CALL EVALUATE_STMT
    JP MAIN_LOOP

    HALT

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
    ;Divide Clock by 6 for 19200 baud (Assuming 1.7MHz clock)
    LD A, 6
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
;Disables Interrupts while running
;Expects BC to be the address of a string
;////////////////////////////////////////
WRITE_STR:
    DI
    PUSH AF
    PUSH BC
    ;Set DLAB 0
    IN A, UART_LCR
    AND 7Fh
    OUT UART_LCR, A
    WRITE_START:
    LD A, (BC)
    CP 0
    JP Z, WRITE_CLOSE
    ;OUT UART_DHR, A
    CALL PRINTCH
    INC BC
    JP WRITE_START
    WRITE_CLOSE:
    POP BC
    POP AF
    EI
    ret

;Main function to tokenize, parse, and execute user entered expressions
;Assume AF has return values
EVALUATE_STMT:
    PUSH AF

    CALL TOKENIZE_BUFFER
    CP 0xFF
    JP Z, EVALUATE_STMT_TOKEN_FAIL

    CALL PARSE_BUFFER
    CP 0xFF
    JP Z, EVALUATE_STMT_SYNTAX_FAIL

    ;Call some final function here?

    EVALUATE_STMT_TOKEN_FAIL:
        ;Print the invalid token string
        LD BC, TOKEN_ERROR
        CALL WRITE_STR
        JP EVALUATE_STMT_RETURN

    EVALUATE_STMT_SYNTAX_FAIL:
        ;Print syntax error token
        LD BC, SYNTAX_ERROR
        CALL WRITE_STR

    EVALUATE_STMT_RETURN:

    POP AF
    RET

;////////////////////////////////////////////////////////////////
;There are 5 types of symbols - LITERAL, @, :, <, ?
;Returns status in register A
;0x00 - Good
;0xFF - Bad
;////////////////////////////////////////////////////////////////
;Current and next token for parser
PARSE_CUR equ 0x8100
PARSE_NEXT equ 0x8102
;Buffer for tokens, first byte is size of buffer
TOKEN_BUF equ 0x8110
;Token Symbols in token buffer
TOKEN_EF equ 0   ;End of buffer
TOKEN_LT equ 1   ;ABCDEF0123456789 size 3
TOKEN_EX equ 2   ;@ size 1
TOKEN_RD equ 3   ;: size 1
TOKEN_WR equ 4   ;< size 1
TOKEN_HE equ 5   ;? size 1
;////////////////////////////////////////////////////////////////

TOKENIZE_BUFFER:
    PUSH BC
    PUSH DE

    ;Clear parse buffer
    LD DE, TOKEN_BUF
    LD A, 0
    LD (DE), A

    ;Get start of terminal buffer
    LD DE, TERM_BUF

    TOKENIZE_BUFFER_LOOP:
        ;Get next character
        INC DE
        LD A, (DE)
        ;Save character
        LD B, A

        ;/////////////////////
        ;Check if return
        ;/////////////////////
        CP NEWLINE
        CALL C, TOKENIZE_NEWLINE
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_RETURN_SUCCESS

        ;/////////////////////
        ;Check if a number
        ;/////////////////////
        SUB 0x30
        CP 0xA
        CALL C, TOKENIZE_NUMBERS
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a hex character
        ;/////////////////////
        SUB 0x41
        CP 0x6
        CALL C, TOKENIZE_CHAR
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a ?
        ;/////////////////////
        CP SYM_HELP
        CALL Z, TOKENIZE_HELP
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a :
        ;/////////////////////
        CP SYM_READ
        CALL Z, TOKENIZE_READ
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a <
        ;/////////////////////
        CP SYM_WRITE
        CALL Z, TOKENIZE_WRITE
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a @
        ;/////////////////////
        CP SYM_EXE
        CALL Z, TOKENIZE_EXE
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP


        ;If the program gets to this point there is an error
        LD A, 0xFF
        JP TOKENIZE_BUFFER_RETURN
        ;Return


    TOKENIZE_BUFFER_RETURN_SUCCESS:
        ;Signal that the program returned successful!
        LD A, 00
    TOKENIZE_BUFFER_RETURN:
    POP DE
    POP BC
    RET



;Each of these should return 0xFF in A before exiting
TOKENIZE_NEWLINE:
    LD A, 0xFF
    RET

;B should contain the character value, not A
;Write token symbol and value (if needed) to TOKEN_BUF
TOKENIZE_NUMBERS:
    LD A, 0xFF
    RET

TOKENIZE_CHAR:
    LD A, 0xFF
    RET

TOKENIZE_READ:
    LD A, 0xFF
    RET
    
TOKENIZE_WRITE:
    LD A, 0xFF
    RET
    
TOKENIZE_EXE:
    LD A, 0xFF
    RET

TOKENIZE_HELP:
    LD A, 0xFF
    RET


;Return 0xFF on fail, 0x00 on success
PARSE_BUFFER:
    RET

;//////////////////////
;/////////DATA/////////
;//////////////////////

BOOT_MSG:
.db NEWLINE, RETURN, "ASH v0.03", NEWLINE, RETURN, "(C) 2020 by Aidan Jennings"
.db NEWLINE, RETURN, "ZILOG Z80 32k EEPROM, 32k SRAM", NEWLINE, RETURN, "TEXT ONLY", EOF

READY_MSG:
.db NEWLINE, RETURN, "BOOT PROCESS COMPLETE!", NEWLINE, RETURN, EOF

SYNTAX_ERROR:
.db NEWLINE, RETURN, "SYNTAX ERROR", NEWLINE, RETURN, EOF

TOKEN_ERROR:
.db NEWLINE, RETURN, "INVALID TOKEN", NEWLINE, RETURN, EOF

PROMPT:
.db RETURN, ">>>:", EOF

org 8001h
.db "A0:7F", NEWLINE
;.db "8000<7B", NEWLINE
;.db "@B800"