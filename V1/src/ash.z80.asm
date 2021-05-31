;ASH - Aidan's SHell
;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

;TODO:
;Change most DE to HL
;Change eror to check for non-zero values
;conway's game of life?
;Arrow Key and Backspace Handling

STACK_PTR equ 0x0000

;First byte of term buf is the size of the term buf
TERM_BUF equ 0x8000
;Maximum size of the buffer
TERM_BUF_MAX  equ 256

;Baud Rate Divisor (115200)
BAUD_DIV_HIGH equ 0
BAUD_DIV_LOW equ 8

;///////////////////////////////
;UART Registers
;///////////////////////////////

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

;///////////////////////////////
;Charactars
;///////////////////////////////

CHAR_NEWLINE equ 0xA
CHAR_RETURN equ 0xD
CHAR_EOT equ 0x3
CHAR_SPACE equ 0x20
CHAR_NULL equ 0x0

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

LETTER_W equ 0x57
LETTER_S equ 0x53
LETTER_A equ 0x41
LETTER_D equ 0x44

SYM_READ equ ":"
SYM_WRITE equ "<"
SYM_EXE equ "@"
SYM_HELP equ "?"

;///////////////////////////////
;Ascii Escape Code Stuff
;///////////////////////////////

ASCII_ESC equ 0x1B
ASCII_LBR equ "["
ASCII_SEMI equ ";"
ASCII_TER equ "m"

ASCII_FG equ "3"
ASCII_BG equ "4"

COLOR_BLACK equ "0"
COLOR_RED equ "1"
COLOR_GREEN equ "2"
COLOR_YELLOW equ "3"
COLOR_BLUE equ "4"
COLOR_PURPLE equ "5"
COLOR_CYAN equ "6"
COLOR_WHITE equ "7"


;///////////////////////////////////////////////
;Ram locations exclusive to the heap
HEAPRAM EQU 0x8F00
HEAP_INITIALIZED EQU 0x8F00
LASTBLOCK_PTR EQU 0x8F02

;Locations used by alloc
ALLOC_SIZE_REQ EQU 0x8F14
ALLOC_CUR_HEAD EQU 0x8F16
ALLOC_START_PT EQU 0x8F18

;Locations used by trim
TRIM_START_PTR EQU 0x8F30
TRIM_REQ_AMNT EQU 0x8F32
TRIM_START_AMT EQU 0x8F34
TRIM_NEW_PTR EQU 0x8F36

;Locations used by merge
MERGE_START_PTR EQU 0x8F30
MERGE_REQ_AMNT EQU 0x8F32
;///////////////////////////////////////////////

;///////////////////////////////////////////////
;Completely arbitrary, first 4k is used for other kernel stuff
HEAPSTART EQU 0x9000
HEAPSIZE EQU 0x1000 ;4k, Ideally this can change with no effect on code
HEAPEND EQU (HEAPSTART + HEAPSIZE)
;///////////////////////////////////////////////


;/////////////////
;Code Starts HERE
;/////////////////
org 0000h
BOOT:
    NOP
    NOP
    NOP
    NOP
    ;Set up Stack
    LD HL, STACK_PTR
    LD SP, HL
    ;Set up UART
    CALL UART_INIT
    ;Disable interrupt
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

    ;Reset Colors
    LD HL, COLOR_NORMAL
    CALL WRITE_STR

    ;Clear the terminal
    LD HL, CLEAR_DISPLAY
    CALL WRITE_STR

    ;Print Boot Screen
    LD HL, BOOT_MSG
    CALL WRITE_STR

    ;Print Ready Message
    LD HL, READY_MSG
    CALL WRITE_STR

MAIN_LOOP:
    ;CALL MONITOR
    CALL GAME_MAIN
    JP MAIN_LOOP

MONITOR:
    PUSH AF
    PUSH HL

    ;Clear Terminal Buffer
    LD HL, TERM_BUF
    LD A, 0
    LD (HL), A

    ;Print Prompt
    LD HL, PROMPT
    CALL WRITE_STR

    ;Get the user input and evaluate
    CALL GETSTR
    CALL EVALUATE_STMT

    POP HL
    POP AF
    RET

;//////////////////////
;//////Functions///////
;//////////////////////

;//////////////////////////////////////
;UART Functions
;//////////////////////////////////////
UART_INIT:
    PUSH AF
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
    RET

UART_CLEAR_DLAB:
    PUSH AF
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A
    POP AF
    RET

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
    LD A, BAUD_DIV_LOW
    OUT (UART_DHR), A
    LD A, BAUD_DIV_HIGH
    OUT (UART_IER), A

    POP AF
    RET

UART_CLEAR_LSR:
    PUSH AF
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

;//////////////////////////////////////
;Get a character from the FIFO, add to write buffer and echo to screen
;Value is returned in A
;//////////////////////////////////////
GETCH:
    PUSH BC

    CALL UART_CLEAR_DLAB

    GETCH_LOOP:
        ;Read Line Status Reg
        IN A, (UART_LSR)
        ;If only bit 1 is set then FIFO has new data
        AND 0x1F
        CP 1
        JP NZ, GETCH_LOOP

    ;Get next char from data holding register
    IN A, (UART_DHR)
    CALL WRITE_BUFFER
    CALL UART_TOGGLE_OUT2

    GETCH_END:
    POP BC
    RET

;//////////////////////////////////////
;Get a line of text from the FIFO, until a return or newline is recieved
;//////////////////////////////////////
GETSTR:
    PUSH AF

    GETSTR_LOOP:
        CALL GETCH
        CP CHAR_RETURN
        JP NZ, GETSTR_LOOP

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
;Print Character
;Assumes that A is the charactar to write
;/////////////////////////////////////////
PRINTCH:
    PUSH AF

    CALL UART_CLEAR_DLAB

    PRINTCH_LOOP:
        ;Read transmit register status in line status register
        IN A, (UART_LSR)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    ;Write Char to UART
    POP AF
    OUT (UART_DHR), A
    RET


;////////////////////////////////////////
;Write String
;Expects HL to be the address of a string
;////////////////////////////////////////
WRITE_STR:
    PUSH AF
    PUSH HL

    WRITE_START:
        LD A, (HL)
        CP CHAR_EOT
        JP Z, WRITE_CLOSE
        CALL PRINTCH
        INC HL
        JP WRITE_START

    WRITE_CLOSE:
    CALL UART_TOGGLE_OUT1
    POP HL
    POP AF
    RET

;Main function to tokenize, parse, and execute user entered expressions
;Assume AF has return values
EVALUATE_STMT:
    PUSH AF
    PUSH HL

    ;Tokenizes and checks for invalid characters
    CALL TOKENIZE_BUFFER
    CP 0xFF
    JP Z, EVALUATE_STMT_TOKEN_FAIL

    ;Checks syntax and prepares for execution
    CALL PARSE_BUFFER
    CP 0xFF
    JP Z, EVALUATE_STMT_SYNTAX_FAIL

    ;Execute the commands found in the buffer
    CALL EXECUTE_BUFFER
    CP 0xFF
    JP Z, EVALUATE_STMT_EXE_FAIL

    ;If all three functions return then jump to end
    JP EVALUATE_STMT_RETURN

    EVALUATE_STMT_TOKEN_FAIL:
        ;Print invalid token string
        LD HL, COLOR_ERR
        CALL WRITE_STR

        LD HL, TOKEN_ERROR
        CALL WRITE_STR

        LD HL, COLOR_NORMAL
        CALL WRITE_STR

        JP EVALUATE_STMT_RETURN

    EVALUATE_STMT_SYNTAX_FAIL:
        ;Print syntax error string
        LD HL, COLOR_ERR
        CALL WRITE_STR

        LD HL, SYNTAX_ERROR
        CALL WRITE_STR

        LD HL, COLOR_NORMAL
        CALL WRITE_STR

        JP EVALUATE_STMT_RETURN

    EVALUATE_STMT_EXE_FAIL:
        ;Print error string
        LD HL, COLOR_ERR
        CALL WRITE_STR

        LD HL, EXE_ERROR
        CALL WRITE_STR

        LD HL, COLOR_NORMAL
        CALL WRITE_STR

    EVALUATE_STMT_RETURN:

    POP HL
    POP AF
    RET

;////////////////////////////////////////////////////////////////
;There are 5 types of symbols - LITERAL, @, :, <, ?
;Returns status in register A
;0x00 - Success
;0xFF - Fail
;////////////////////////////////////////////////////////////////
;Buffer for tokens, first byte is size of buffer
TOKEN_BUF equ 0x8100
;Token Symbols in token buffer
TOKEN_EF equ 0   ;End of buffer size 1
TOKEN_LT equ 1   ;ABCDEF0123456789 size 2
TOKEN_EX equ 2   ;@ size 1
TOKEN_RD equ 3   ;: size 1
TOKEN_WR equ 4   ;< size 1
TOKEN_HE equ 5   ;? size 1
TOKEN_WD equ 6   ;Full Word, size 3
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

    ;For instruction tokens or newlines
    ;Load the token code into C and pass that to the tokenize function
    ;If its a hex letter or number
    ;The value is in B already and the tokenize function expects that

    ;Basically, for every byte in the buffer:
        ;is it a newline? if so then exit
        ;is it a number? if so then convert to hex and tokenize
        ;is it a a hex char? convert to hex and tokenize
        ;is it an instruction? put the propper token
        ;is it whitespace? ignore

    TOKENIZE_BUFFER_LOOP:
        ;Get next character
        INC DE
        LD A, (DE)
        ;Save character
        LD B, A

        ;/////////////////////
        ;Check if return
        ;/////////////////////
        LD C, TOKEN_EF
        CP CHAR_RETURN
        CALL Z, TOKENIZE_INSTR
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
        CP 0xF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a ?
        ;/////////////////////
        LD C, TOKEN_HE
        CP SYM_HELP
        CALL Z, TOKENIZE_INSTR
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a :
        ;/////////////////////
        LD C, TOKEN_RD
        CP SYM_READ
        CALL Z, TOKENIZE_INSTR
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a <
        ;/////////////////////
        LD C, TOKEN_WR
        CP SYM_WRITE
        CALL Z, TOKENIZE_INSTR
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP
        ;Return original character
        LD A, B

        ;/////////////////////
        ;Check if a @
        ;/////////////////////
        LD C, TOKEN_EX
        CP SYM_EXE
        CALL Z, TOKENIZE_INSTR
        ;Return to start of loop if return is FF
        CP 0xFF
        JP Z, TOKENIZE_BUFFER_LOOP

        ;/////////////////////
        ;Check if whitespace (ignore) (maybe shouldn't ignore?)
        ;/////////////////////
        CP 0x20
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

;Expects C to be the token value
;Return 0xFF in A when complete
TOKENIZE_INSTR:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Get size of token buffer
    LD HL, TOKEN_BUF
    LD A, (HL)
    ;Save in D
    LD D, A
    ;Increment token buffer size
    INC A
    LD (HL), A
    ;Add the new size to the pointer so that it points to the next open spot
    LD A, D
    ADD A, L
    INC A
    LD L, A
    ;Put Instruction Token at the next open spot
    LD (HL), C

    POP HL
    POP DE
    POP BC
    LD A, 0xFF
    RET

;Expects B to hold next char value
;Write token symbol and value (if needed) to TOKEN_BUF
TOKENIZE_NUMBERS:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Get size of token buffer
    LD HL, TOKEN_BUF
    LD A, (HL)
    ;Save in C
    LD C, A
    ;Increment by 2
    ADD A, 2
    LD (HL), A
    ;Add size to the buffer pointer to get the next available spot
    LD A, C
    ADD A, L
    INC A
    LD L, A
    ;Put Number Token
    LD (HL), TOKEN_LT
    INC L
    ;Put Token Value
    LD A, B
    SUB 0x30
    LD (HL), A

    POP HL
    POP DE
    POP BC
    LD A, 0xFF
    RET

;Expects B to be the Char value
;Write token symbol and value to TOKEN_BUF
;Returns an F instead of FF because of an error with @
TOKENIZE_CHAR:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Get size of token buffer
    LD HL, TOKEN_BUF
    LD A, (HL)
    ;Save in C
    LD C, A
    ;Increment by 2
    ADD A, 2
    LD (HL), A
    ;Goto next free spot
    LD A, C
    ADD A, L
    INC A
    LD L, A
    ;Put Number Token
    LD (HL), TOKEN_LT
    INC L
    ;Put Token Value
    LD A, B
    SUB 0x37
    LD (HL), A

    POP HL
    POP DE
    POP BC
    LD A, 0xF
    RET

;////////////////////////////
;Parse over each token in the buffer
;Really just coalesces each literal token into larger 16 bit words
;I'm using the term 'Parse' very loosely
;Return 0 on success
;////////////////////////////
;Current and next token for parser
;PARSE_CUR equ 0x8200
;PARSE_NEXT equ 0x8201
;Location of state for FSM
;PARSE_STATE equ 0x8202
;Incrementor location for parser
PARSE_INC equ 0x8200
;High and low values for literals
PARSE_LIT_H equ 0x8201
PARSE_LIT_L equ 0x8202

PARSE_BUF equ 0x8210

PARSE_BUFFER:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Get start of token buffer
    LD HL, TOKEN_BUF
    ;Get size of buffer
    LD A, (HL)
    ;Return if its empty
    CP 0
    JP Z, PARSE_BUFFER_RETUN_SUCCESS

    ;Clear literal storage
    LD HL, PARSE_LIT_L
    LD (HL), 0
    LD HL, PARSE_LIT_H
    LD (HL), 0

    ;Set size of buffer to be 0
    LD HL, PARSE_BUF
    LD (HL), 0

    ;Set incrementor
    LD HL, PARSE_INC
    LD (HL), 1

    PARSE_BUFFER_LOOP:

        ;Get incrementor
        LD HL, PARSE_INC
        LD A, (HL)

        ;Go to next location in token buffer
        LD HL, TOKEN_BUF
        ADD A, L
        LD L, A

        ;Get Token, save to A and B
        LD A, (HL)
        LD B, A

        ;Check if its the end of the buffer
        CP TOKEN_EF
        CALL Z, PARSE_INST
        CP 0xFF
        JP Z, PARSE_BUFFER_RETUN_SUCCESS

        ;Check if current token is a single literal value
        CP TOKEN_LT
        CALL Z, PARSE_LITERAL
        CP 0xFF
        JP Z, PARSE_BUFFER_LOOP

        ;Check if current token is an @ symbol
        CP TOKEN_EX
        CALL Z, PARSE_INST
        CP 0xFF
        JP Z, PARSE_BUFFER_LOOP

        ;Check if current token is an : symbol
        CP TOKEN_RD
        CALL Z, PARSE_INST
        CP 0xFF
        JP Z, PARSE_BUFFER_LOOP

        ;Check if current token is an < symbol
        CP TOKEN_WR
        CALL Z, PARSE_INST
        CP 0xFF
        JP Z, PARSE_BUFFER_LOOP

        ;Check if current token is an ? symbol
        CP TOKEN_HE
        CALL Z, PARSE_INST
        CP 0xFF
        JP Z, PARSE_BUFFER_LOOP

        ;If parser reaches this point there is an invalid token
        LD A, 0xFF
        JP PARSE_BUFFER_RETURN


    PARSE_BUFFER_RETUN_SUCCESS:
        LD A, 0x00
    PARSE_BUFFER_RETURN:
    POP HL
    POP DE
    POP BC
    RET

;HL should be location of next token
;A should be the token
PARSE_LITERAL:
    PUSH BC
    PUSH DE
    PUSH HL

    PARSE_LITERAL_LOOP:
        ;Check if this is a literal token
        ;TODO jump to an error state, not save
        CP TOKEN_LT
        JP NZ, PARSE_LITERAL_SAVE

        ;The goal of this next section is to shift the current token into two 8 bit values to create a single 16 bit value
        ;This is horrible and ugly but im too tired to make it better right now

        ;Get value
        INC L
        LD A, (HL)

        ;Save HL for later
        PUSH HL

        ;Save value into E
        LD E, A
        ;Get high literal value
        LD HL, PARSE_LIT_H
        LD A, (HL)
        ;Rotate A by 4 to the left (may have to rotate 5 times?) so now low bytes are high
        RLCA
        RLCA
        RLCA
        RLCA
        ;Zero out lower bytes
        AND 0xF0
        ;Save rotated high byte into B
        LD B, A
        ;Get Low literal value
        LD HL, PARSE_LIT_L
        LD A, (HL)
        ;Rotate A by 4 to the left (so now low and high bytes are swapped)
        RLCA
        RLCA
        RLCA
        RLCA
        ;Save into C
        LD C, A
        ;Zero out high bytes
        AND 0x0F
        ;Now A should contain the HIGH byte
        OR B
        LD HL, PARSE_LIT_H
        LD (HL), A
        ;Now get the value of the token
        LD A, C
        ;Put the new token (stored in E) into the low bytes of A
        AND 0xF0
        OR E
        ;Save
        LD HL, PARSE_LIT_L
        LD (HL), A

        ;Get TOKEN incrementor
        LD HL, PARSE_INC
        LD A, (HL)
        ADD A, 2
        LD (HL), A

        ;Increment pointer and return to start
        POP HL
        INC L
        LD A, (HL)
        JP PARSE_LITERAL_LOOP


    PARSE_LITERAL_SAVE:
        ;First, save this token and the full value
        ;Get size of parse buffer

        ;HL Holds the location of the next (non literal) token
        PUSH HL

        LD HL, PARSE_BUF
        LD A, (HL)

        ;Go to next empty spot
        ADD A, L
        INC A
        LD L, A

        ;First put word token
        LD (HL), TOKEN_WD
        INC L
        ;Next Put High Byte
        LD DE, PARSE_LIT_H
        LD A, (DE)
        LD (HL), A
        INC L
        ;Next put low byte
        LD DE, PARSE_LIT_L
        LD A, (DE)
        LD (HL), A
        INC L

        ;Clear literal storage NEWNEWNEW
        LD HL, PARSE_LIT_L
        LD (HL), 0
        LD HL, PARSE_LIT_H
        LD (HL), 0

        ;Go back to start of buffer, get size
        LD HL, PARSE_BUF
        LD A, (HL)
        ;Increment by size of token
        ADD A, 0x3
        LD (HL), A

        POP HL

    PARSE_LITERAL_RETURN_SUCCESS:

        LD A, 0xFF

    PARSE_LITERAL_RETURN:
    POP HL
    POP DE
    POP BC
    RET

;A should just be the instruciton token, no additional work needed
PARSE_INST:

    PUSH BC
    PUSH DE
    PUSH HL

    ;Save token into B
    LD B, A

    LD HL, PARSE_BUF
    LD A, (HL)

    ;Go to next empty spot
    ADD A, L
    INC A
    LD L, A

    ;Put token
    LD (HL), B

    ;Go back to start of buffer, get size
    LD HL, PARSE_BUF
    LD A, (HL)
    ;Increment by size of token
    INC A
    LD (HL), A

    ;Update TOKEN incrementor
    LD HL, PARSE_INC
    LD A, (HL)
    INC A
    LD (HL), A

    ;Set return value
    LD A, 0xFF

    POP HL
    POP DE
    POP BC
    RET

;/////////////////////////
;Execute buffer
;This is just a case statement depending on the first token in the parse buffer
;Each case has a corresponding subroutine
;/////////////////////////

EXECUTE_BUFFER:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Go to first token in parse buffer
    LD HL, PARSE_BUF
    INC HL

    ;Get token
    LD A, (HL)

    EXECUTE_BUFFER_EF:
        ;Check if its the end of the buffer (no instruction)
        CP TOKEN_EF
        JP Z, EXECUTE_BUFFER_RETURN_SUCCESS

    EXECUTE_BUFFER_WD:
        ;Check if current token is a Word Value
        CP TOKEN_WD
        JP NZ, EXECUTE_BUFFER_EXE                   ;If not, jump to the next
        CALL EVAL_LITERAL
        CP 0                                        ;Expect a return value of 0
        JP Z, EXECUTE_BUFFER_RETURN_SUCCESS

    EXECUTE_BUFFER_EXE:
        ;Check if current token is an @ symbol
        CP TOKEN_EX
        JP NZ, EXECUTE_BUFFER_HE
        CALL EVAL_EXE
        CP 0
        JP Z, EXECUTE_BUFFER_RETURN_SUCCESS

    EXECUTE_BUFFER_HE:
        ;Check if current token is an ? symbol
        CP TOKEN_HE
        CALL Z, EVAL_HELP
        CP 0
        JP Z, EXECUTE_BUFFER_RETURN_SUCCESS

    ;More actions could be added here

    EXECUTE_BUFFER_FAIL:
        ;If parser reaches this point then there is an invalid instruction
        LD A, 0xFF
        JP EXECUTE_BUFFER_RETURN

    EXECUTE_BUFFER_RETURN_SUCCESS:
        ;I don't think this is needed because A should already be 0
        ;LD A, 0x00

    EXECUTE_BUFFER_RETURN:
    POP HL
    POP DE
    POP BC
    RET

EVAL_LITERAL:
    PUSH HL
    PUSH DE

    ;Get First Two Bytes
    LD HL, PARSE_BUF
    LD A, L
    ADD A, 2
    LD L, A

    ;Get the top byte
    LD A, (HL)

    ;Store into D
    LD D, A

    ;Get the bottom byte
    INC HL
    LD A, (HL)

    ;Store into E
    LD E, A

    ;Get the instruction token
    INC HL
    LD A, (HL)

    ;See if A is a read instruction
    EVAL_LITERAL_READ:
        CP TOKEN_RD
        JP NZ, EVAL_LITERAL_WRITE
        CALL EVAL_READ
        CP 0     ;Check for error
        JP Z, EVAL_LITERAL_SUCCESS

    EVAL_LITERAL_WRITE:
        CP TOKEN_WR
        JP NZ, EVAL_LITERAL_FAIL
        CALL EVAL_WRITE
        CP 0     ;Check for error
        JP Z, EVAL_LITERAL_SUCCESS

    ;Other instrucitons could be added here...

    EVAL_LITERAL_FAIL:
    LD A, 0xFF

    EVAL_LITERAL_SUCCESS:
    POP DE
    POP HL
    RET

EVAL_EXE:
    PUSH HL
    PUSH DE

    ;Clear DE
    LD D, 0
    LD E, 0

    ;Get look at the location of the second token in the buffer
    LD HL, PARSE_BUF
    LD A, L
    ADD A, 2
    LD L, A

    ;Get the token
    LD A, (HL)

    ;Make sure its a WORD token
    CP TOKEN_WD
    JP NZ, EVAL_EXE_FAILURE

    ;Get the literal
    INC HL
    LD A, (HL)

    ;Assume 1 Byte at first
    LD D, A

    ;Get next token
    INC HL
    LD A, (HL)

    LD E, A

    ;Set Up Return Address so that RET can be called
    LD HL, EVAL_EXE_SUCCESS
    PUSH HL
    LD H, D
    LD L, E
    ;Jump to new, arbitrary location
    JP (HL)


    EVAL_EXE_FAILURE:
    LD A, 0xFF
    JP EVAL_EXE_EXIT

    EVAL_EXE_SUCCESS:
    LD HL, CLEAR_DISPLAY
    CALL WRITE_STR

    LD A, 0

    EVAL_EXE_EXIT:
    POP DE
    POP HL
    RET

EVAL_READ:
    ;DE is the literal value
    ;HL should be pointing to the read token
    PUSH HL
    PUSH DE
    PUSH BC

    ;get next token
    INC HL
    LD A, (HL)

    ;check that it is a word
    CP TOKEN_WD
    JP NZ, EVAL_READ_FAIL

    ;Get the 8 bit value
    INC HL
    INC HL
    LD A, (HL)

    ;Put the target address in HL
    LD H, D
    LD L, E

    ;Use B to count when a newline is needed
    LD B, 0

    ;Loop over each value at the location
    EVAL_READ_LOOP:
        ;Save the pointer, and the incrementor
        PUSH AF
        PUSH HL

        ;Is a newline needed?
        LD A, B
        AND 0x0F
        CP 0
        JP NZ, EVAL_READ_LOOP_L1
        LD A, CHAR_NEWLINE
        CALL PRINTCH
        LD A, CHAR_RETURN
        CALL PRINTCH

        EVAL_READ_LOOP_L1:
        ;Convert the hex to ascii
        LD A, (HL)
        CALL HTOA

        ;Print the first char
        LD A, H
        CALL PRINTCH

        ;Print the second char
        LD A, L
        CALL PRINTCH

        ;Print a space
        LD A, CHAR_SPACE
        CALL PRINTCH

        ;Get the pointer and the incrementor back
        POP HL
        POP AF

        ;Decrement counter and return if A is not 0
        INC HL
        INC B
        DEC A
        CP 0
        JP NZ, EVAL_READ_LOOP

        ;A is already 0, just jump to end
        JP EVAL_READ_EXIT

    EVAL_READ_FAIL:
    LD A, 0xFF

    EVAL_READ_EXIT:
    POP BC
    POP DE
    POP HL
    RET

EVAL_WRITE:
    ;DE is the literal value
    ;HL should not have been modified from before
    PUSH HL
    PUSH DE

    ;Look now for the final Literal
    INC HL
    LD A, (HL)

    ;Check that next token is a word, even though we only use the lower byte
    CP TOKEN_WD
    JP NZ, EVAL_WRITE_FAIL

    ;Get value to write
    INC HL
    INC HL
    LD A, (HL)

    ;Write the value
    LD H, D
    LD L, E
    LD (HL), A

    ;SUCCESS!
    LD A, 0
    JP EVAL_WRITE_RETURN

    EVAL_WRITE_FAIL:
    LD A, 0xFF

    EVAL_WRITE_RETURN:
    POP DE
    POP HL
    RET

EVAL_HELP:
    PUSH HL

    ;Just print out the help text
    LD HL, HELP_TEXT
    CALL WRITE_STR
    LD A, 0

    POP HL
    RET

;HEX to ASCII
;Convert hex value to 2 ascii characters
;Expects A to be the hex value
;Returns 2 chars in HL
HTOA:

    PUSH AF
    PUSH BC

    ;High Nibble First, save into H

    ;Copy A into B
    LD B, A

    HTOA_HIGH:
    ;Rotate right
    RR A
    RR A
    RR A
    RR A

    ;Clear high bits
    AND 0x0F

    ;Is this A-F?
    HTOA_HEX_1:
    CP 0xA
    JP C, HTOA_INT_1
    ADD A, 0x37
    LD H, A
    JP HTOA_LOW

    ;Is this 0-9?
    HTOA_INT_1:
    ADD A, 0x30
    LD H, A

    ;Next do the low nibble, save into E
    HTOA_LOW:
    ;Copy B back into A
    LD A, B
    AND 0x0F

    ;Is this A-F?
    HTOA_HEX_2:
    CP 0xA
    JP C, HTOA_INT_2
    ADD A, 0x37
    LD L, A
    JP HTOA_EXIT

    ;Is this 0-9?
    HTOA_INT_2:
    ADD A, 0x30
    LD L, A

    HTOA_EXIT:
    POP BC
    POP AF
    RET

;//////////////////////
;String Comparison
;Expects HL and DE to be pointers to two strings
;Returns 0 in A if strings match
;//////////////////////
STRCMP:
        PUSH HL
        PUSH DE
    
    STRCMP_LOOP:
        LD A, (HL)          ;Get first char into A
        EX DE, HL           ;Swap HL and DE
        LD B, (HL)          ;Get second char into B
        CP B                ;Compare A and B
        JP NZ, STRCMP_FAIL  ;If they don't match then jump to fail
        
        CP CHAR_EOT         ;Check if End of Text
        JP NZ, STRCMP_LOOP  ;Jump back to start if not
        
        LD A, 0             ;If end of text, return 0
        JP STRCMP_END
        
    STRCMP_FAIL:
        LD A, 0xFF          ;Return -1 if failure
        JP STRCMP_END
        
    STRCMP_END:
        POP DE
        POP HL
        RET

;//////////////////////
;/////////DATA/////////
;//////////////////////

BOOT_MSG:
db CHAR_NEWLINE, CHAR_RETURN, "ASH v0.3", CHAR_NEWLINE, CHAR_RETURN, "(C) 2020 by Aidan Jennings"
db CHAR_NEWLINE, CHAR_RETURN, "ZILOG Z80 32k EEPROM, 32k SRAM",  CHAR_NEWLINE, CHAR_RETURN,  "TEXT ONLY", CHAR_EOT

READY_MSG:
db CHAR_NEWLINE, CHAR_NEWLINE, CHAR_RETURN, "BOOT PROCESS COMPLETE!", CHAR_NEWLINE, CHAR_EOT

SYNTAX_ERROR:
db CHAR_NEWLINE, CHAR_RETURN, "SYNTAX ERROR", CHAR_NEWLINE, CHAR_EOT

TOKEN_ERROR:
db CHAR_NEWLINE, CHAR_RETURN, "INVALID TOKEN", CHAR_NEWLINE, CHAR_EOT

EXE_ERROR:
db CHAR_NEWLINE, CHAR_RETURN, "EXECUTION ERROR", CHAR_NEWLINE, CHAR_EOT

HELP_TEXT:
db CHAR_NEWLINE, CHAR_RETURN, "INSTRUCTIONS : ", CHAR_NEWLINE, CHAR_RETURN, "1FFF : 10 - READ 16 BYTES STARTING AT LOCATION 0x1FFF", CHAR_NEWLINE, CHAR_RETURN, "1FFF < 10 - WRITE 0x10 TO LOCAITON 0x1FFF", CHAR_NEWLINE, CHAR_RETURN, "@1FFF - BEGIN EXECUTION AT LOCATION 0x1FFF", CHAR_NEWLINE, CHAR_RETURN, "? - DISPLAY HELP MESSAGE", CHAR_NEWLINE, CHAR_EOT

PROMPT:
db CHAR_NEWLINE, CHAR_RETURN, ">>>:", CHAR_EOT


;////////////////////////////////////////////////////////
;Text Color Change
;////////////////////////////////////////////////////////
COLOR_NORMAL:
db ASCII_ESC, ASCII_LBR, ASCII_FG, COLOR_WHITE, ASCII_SEMI, ASCII_BG, COLOR_BLACK, ASCII_TER, CHAR_EOT

COLOR_WARN:
db ASCII_ESC, ASCII_LBR, ASCII_FG, COLOR_YELLOW, ASCII_SEMI, ASCII_BG, COLOR_BLACK, ASCII_TER, CHAR_EOT

COLOR_ERR:
db ASCII_ESC, ASCII_LBR, ASCII_FG, COLOR_RED, ASCII_SEMI, ASCII_BG, COLOR_BLACK, ASCII_TER, CHAR_EOT

CLEAR_DISPLAY:
db ASCII_ESC, ASCII_LBR, "2J", CHAR_EOT




;//////////////////////////////////////////
;Memory Allocation (heap)
;//////////////////////////////////////////


;//////////////////////////////////////
;Heap Init
;Initilize the heap, should only be run once
;//////////////////////////////////////
heapInit:
        PUSH DE
        PUSH HL

        ;Set Lastblock pointer to the start of the heap
        LD HL, LASTBLOCK_PTR        
        LD DE, HEAPSTART
        LD A, D
        LD (HL), A
        INC HL
        LD A, E
        LD (HL), A
        
        ;Get set up head of the first block with the size
        LD HL, HEAPSTART
        LD DE, HEAPSIZE
        LD (HL), D
        INC HL
        LD (HL), E
        
        ;Set the foot of the first block as well
        LD HL, HEAPSTART
        LD DE, HEAPSIZE
        ADD HL, DE
        DEC HL
        LD (HL), E
        DEC HL
        LD (HL), D
        
        ;Return 0 for success
        LD A, 0

        heapInit_exit:
        POP HL
        POP DE
        RET
    
    
;//////////////////////////////////////
;Alloc
;Request a heap block of a given size
;Expects:
;   -HL to be a block size
;Returns:
;   -Pointer in HL on success
;       if HL is NULL then failure
;//////////////////////////////////////
alloc:
        PUSH BC
        PUSH DE
        
    alloc_size_check:
        ;Take size in HL and add 4 for headers and 1 for padding if needed
        LD BC, 4
        ADD HL, BC
        LD A, L
        AND 1
        CP 1
        JP C, alloc_save_request
        INC HL
        
    alloc_save_request:
        ;Save the requested size to ram
        LD A, H
        LD (ALLOC_SIZE_REQ), A
        LD A, L
        LD (ALLOC_SIZE_REQ+1), A
        
    alloc_set_start:
        ;Set the starting point
        LD A, (LASTBLOCK_PTR)
        LD (ALLOC_START_PT), A
        LD B, A
        LD A, (LASTBLOCK_PTR+1)
        LD (ALLOC_START_PT), A
        LD C, A
        
    ;Loop starts here 
    alloc_find_loop: 
        ;Get the pointer to the last block in BC
        LD A, (LASTBLOCK_PTR)
        LD B, A
        LD A, (LASTBLOCK_PTR+1)
        LD C, A
        
        ;Get the header of the last block in DE
        LD A, (BC)
        LD D, A
        INC BC
        LD A, (BC)
        LD E, A
        
        ;Save Header to ram
        LD A, D
        LD (ALLOC_CUR_HEAD), A
        LD A, E
        LD (ALLOC_CUR_HEAD+1), A
        
        ;Check the free bit
        LD A, D
        AND 0x80
        CP 0
        JP NZ, alloc_find_next
        
        ;The block is free, but is it large enough?
        
        ;Get the requested size back into HL
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Compare high byte
        LD A, D
        AND 0x7F
        CP H
        JP C, alloc_find_merge      ;H > D, try merge
        JP NZ, alloc_find_current   ;D > H, use this block 
        
        ;Compare low byte since D == H
        LD A, E
        CP L
        JP C, alloc_find_merge      ;L > E, try merge
                                    ;E > L, that means current block works
        
        ;If merge fails, go right to alloc_find_next
    
    alloc_find_current:
        ;The block pointed to by LASTBLOCK_PTR is free but is big enough
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Set HL to requested size
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Trim the current block to the requested size
        CALL alloc_trimm
        CP 0
        JP Z, alloc_success
        JP alloc_fail
        
    alloc_find_merge:
        ;The block pointed to by LASTBLOCK_PTR is free but is too small, try merge
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Set HL to requested size
        LD A, (ALLOC_SIZE_REQ)
        LD H, A
        LD A, (ALLOC_SIZE_REQ+1)
        LD L, A
        
        ;Call merge and attempt to create a block of the requested size
        CALL merge
        CP 0
        JP Z, alloc_success
        ;If unsuccessful, go to next block
    
    alloc_find_next:
        ;The block pointed to at LASTBLOCK_PTR is allocated or is too small, jump to next block
        
        ;Set DE to current Block
        LD A, (LASTBLOCK_PTR)
        LD D, A
        LD A, (LASTBLOCK_PTR+1)
        LD E, A
        
        ;Get header (may have been updated)
        LD A, (DE)
        LD H, A
        INC DE
        LD A, (DE)
        LD L, A
        DEC DE
        
        ;Get size of current block
        LD A, H
        AND 0x7F
        LD H, A
        
        ;Jump to next block (now pointed to by HL)
        ADD HL, DE
        
        ;Save new block for next iteration
        LD A, H
        LD (LASTBLOCK_PTR), A
        LD A, L
        LD (LASTBLOCK_PTR+1), A
        
        ;Check the starting point
        LD A, (ALLOC_START_PT)
        LD D, A
        LD A, (Alloc_START_PT+1)
        LD E, A
        
        ;Todo: compare HL and DE to see if the entire heap has been checked
        ;Todo: alternatively, just always start at the begining of the heap
        
        JP alloc_find_loop
    ;Loop ends here  
    alloc_success:
        ;Set set the alloc bit
        LD A, (HL)
        OR 0x80
        LD (HL), A
        ;Point the user to the payload, not the header
        INC HL
        INC HL
        JP alloc_end
    
    alloc_fail:
        LD HL, 0
        
    alloc_end:
        POP DE
        POP BC
        RET
        

;//////////////////////////////////////
;Free
;Free up an allocated block
;Will attempt to merge with any proceeding blocks
;Expects:
;   -HL to be a pointer to an allocated block
;Returns:
;   -0 if successful
;//////////////////////////////////////
free:
        PUSH BC
        PUSH DE
    free_start:
        ;Pointer is to start of payload, not header
        DEC HL
        DEC HL
        
        ;Check that pointer is 2 byte aligned
        LD A, L
        AND 1
        CP 1
        JP Z, free_fail
        
        ;Clear alloc bit
        LD A, (HL)
        AND 0x7F
        LD (HL), A
        
        ;Put pointer into DE
        EX DE, HL
        
        ;If size is 0, merge will always be successful
        LD HL, 0
        
        CALL merge
        CP 0
        JP Z, free_exit
        
    free_fail:
        LD A, 0xFF
        JP free_exit
        
    free_exit:
        POP DE
        POP BC
        RET
        

;//////////////////////////////////////
;Trim Block
;Given the pointer to an empty block and the desired size, trim the block to be that size
;Expects:
;   -HL is the desired size
;   -DE is the pointer to the empty block
;Returns:
;   -0 in A if successful
;   -HL is pointer to block of requested size
;//////////////////////////////////////
alloc_trimm:
        PUSH BC
        PUSH DE
        
    ;TODO: check if HL is divisible by 2?
        
    trim_save_ptr:
        ;Save Pointer to first block
        LD A, D
        LD (TRIM_START_PTR), A
        LD A, E
        LD (TRIM_START_PTR+1), A
        
    trim_save_req_size:
        ;Save requested size
        LD A, H
        LD (TRIM_REQ_AMNT), A
        LD A, L
        LD (TRIM_REQ_AMNT+1), A
        
    trim_save_old_size:
        ;Save original size of block
        LD A, (DE)
        LD (TRIM_START_AMT), A
        INC DE
        LD A, (DE)
        LD (TRIM_START_AMT+1), A
        DEC DE
        
    trim_check_free:
        ;Check that first block is empty
        LD A, (DE)
        AND 0x80
        CP 0x80
        JP Z, trim_fail
        
    trim_check_size:
        ;Get the header in BC
        LD A, (DE)
        LD B, A
        INC DE
        LD A, (DE)
        LD C, A
        DEC DE
        
        ;Save the pointer in HL
        LD HL, DE
        
        ;Get the requested amount in HL
        LD A, (TRIM_REQ_AMNT)
        LD H, A
        LD A, (TRIM_REQ_AMNT+1)
        LD L, A
        
        ;Now that the block size is in BC and the requested amount is in HL
        ;Compare High bytes
        LD A, B
        AND 0x7F
        CP H
        JP C, trim_fail             ;Request > Block, fail
        JP NZ, trim_use_current     ;Block > Request, its good
        
        ;Compare low byte since Request == Block
        LD A, C
        CP L
        JP C, trim_fail      ;Request > Block, fail
                                    ;Block => Request, its good
    trim_use_current:
    
    trim_head_old:
        ;Change current block header
        LD A, (TRIM_START_PTR)
        LD D, A
        LD A, (TRIM_START_PTR+1)
        LD E, A
        
        LD A, (TRIM_REQ_AMNT)
        LD (DE), A
        INC DE
        LD A, (TRIM_REQ_AMNT+1)
        LD (DE), A
        DEC DE
        
    trim_foot_old:
        ;Go to new footer
        LD A, (TRIM_REQ_AMNT)
        LD H, A
        LD A, (TRIM_REQ_AMNT+1)
        LD L, A
        
        
        ADD HL, DE
        DEC HL
        DEC HL
        
        ;Change current block footer
        LD A, (TRIM_REQ_AMNT)
        LD (HL), A
        INC HL
        LD A, (TRIM_REQ_AMNT+1)
        LD (HL), A
        DEC HL
        
        ;Save pointer to new block in BC
        LD BC, HL
        INC BC
        INC BC
        
        
        ;Now calculate the size of the remaining block
    
    trim_new_size:    
        ;Put og size into HL
        LD A, (TRIM_START_AMT)
        LD H, A
        LD A, (TRIM_START_AMT+1)
        LD L, A
        
        ;Put requested size into DE
        LD A, (TRIM_REQ_AMNT)
        LD D, A
        LD A, (TRIM_REQ_AMNT+1)
        LD E, A
        
        ;Subtract DE from HL, HL = (HL + (NOT(DE)+1))
        LD A, D
        XOR 0xFF
        LD D, A
        LD A, E
        XOR 0xFF
        LD E, A
        INC DE
        ADD HL, DE
        
        ;Save new size in DE
        LD DE, HL
      
    trim_head_new:  
        ;Now put the new size into the new header pointed to by BC
        LD A, H
        LD (BC), A
        INC BC
        LD A, L
        LD (BC), A
        DEC BC
        
    trim_foot_new:
        ;go to the footer of the new block (now pointed to by HL)
        ADD HL, BC
        DEC HL
        DEC HL
        LD A, D
        LD (HL), A
        INC HL
        LD A, E
        LD (HL), A
        
        ;Now the blocks should be split
    trim_success:
        LD A, (TRIM_START_PTR)
        LD H, A
        LD A, (TRIM_START_PTR+1)
        LD L, A
        
        LD A, 0
        JP trim_exit
        
    trim_fail:
        LD A, 0xFF
        
    trim_exit:
        POP BC
        POP DE
        RET
    
    
;//////////////////////////////////////
;Merge Block
;Given the pointer to an empty block try to merge it with surrounding empty blocks
;Expects:
;   -HL is the desired size
;   -DE is the pointer to the empty block
;Returns:
;   -0 in A if successful
;   -HL is pointer to block of requested size
;//////////////////////////////////////
merge:


;/////////////////////////////////////////
;Game
;/////////////////////////////////////////

org 0x700

;These hard coded data values are going to need some work
GAME_RAM EQU 0xA000
COLOR_TEXT_TEMPLATE EQU GAME_RAM

GAME_MAIN:
    CALL heapInit
    CALL PRINT_TITLE_SCREEN
    RET

;////////////////////
;Check User Input
;Similar to GETCH, check for available char, if none then return 0
;////////////////////
CHECK_INPUT:
    CALL UART_CLEAR_DLAB

    ;Read Line Status Reg
    IN A, (UART_LSR)
    ;If only bit 1 is set then FIFO has new data
    AND 0x1F
    CP 1
    JP NZ, CHECK_INPUT_NULL

    ;Get next char from data holding register
    IN A, (UART_DHR)
    CALL UART_TOGGLE_OUT2
    JP CHECK_INPUT_END
    
    CHECK_INPUT_NULL:
    LD A, 0

    CHECK_INPUT_END:
    RET

PRINT_TITLE_SCREEN:
    PUSH HL
    
    LD HL, CLEAR_DISPLAY
    CALL WRITE_STR
    
    LD HL, GAME_TITLE_SCREEN
    CALL WRITE_STR
    
    CALL PRINT_MAP
    
    POP HL
    RET
   
PRINT_MAP:
    PUSH HL
    PUSH AF
    
    PRINT_MAP_INIT:
        ;Load Color Text Template into RAM
        ;NULL is used after EOT for when the loop should end
        LD DE, COLOR_TEXT

        ;Alloc 10 bytes on the heap to use, store pointer in HL
        ;LD HL, 10
        ;CALL alloc
        ;LD A, H
        ;LD (COLOR_TEXT_TEMPLATE), A
        ;LD A, L
        ;LD (COLOR_TEXT_TEMPLATE), A
        LD HL, GAME_RAM
    
    PRINT_MAP_INIT_LOOP:

        ;Copy the escape sequence into ram
        LD A, (DE)
        LD (HL), A
        
        INC DE
        INC HL
        
        CP CHAR_NULL
        JP NZ, PRINT_MAP_INIT_LOOP
    
        ;Load the pointer to the map and the size into memory
        LD HL, MAP_00
        LD B, 64    ;MAP IS 8x8
    
    PRINT_MAP_LOOP:
    
        ;Print the current map block
        LD A, (HL)
        CALL PRINT_BLOCK
        
        ;Decrement counter
        DEC B
        
        ;If B is 0 then exit
        LD A, B
        CP 0
        JP Z, PRINT_MAP_END
        
        ;If B is a multiple of 8 then print a newline
        AND 7
        CP 0
        CALL Z, PRINT_NEWLINE
        INC HL
        
        JP PRINT_MAP_LOOP
        
    
    PRINT_MAP_END:
    
    LD HL, COLOR_NORMAL
    CALL WRITE_STR
    
    POP AF
    POP HL
    RET

PRINT_BLOCK:
    PUSH AF
    PUSH HL
    
    ;Go to location in RAM
    LD HL, COLOR_TEXT_TEMPLATE
    INC HL
    INC HL
    INC HL
    
    ;Put color value in the open spot
    LD (HL), A
    
    ;Print color escape sequence
    LD HL, COLOR_TEXT_TEMPLATE
    CALL WRITE_STR
    
    LD A, " "
    CALL PRINTCH

    LD HL, COLOR_NORMAL
    CALL WRITE_STR
    
    POP HL
    POP AF
    RET
    
PRINT_NEWLINE:
    PUSH AF
    
    ;Don't want colors being carried over
    ;LD HL, COLOR_NORMAL
    ;CALL WRITE_STR
    
    LD A, CHAR_NEWLINE
    CALL PRINTCH
    LD A, CHAR_RETURN
    CALL PRINTCH
    POP AF
    RET

;/////////////////
;Game Data
;/////////////////
GAME_TITLE_SCREEN:
db CHAR_NEWLINE, CHAR_RETURN, "█████████████████████████████████████████████████████████"
db CHAR_NEWLINE, CHAR_RETURN, "█                                                       █"
db CHAR_NEWLINE, CHAR_RETURN, "█                       Adventure                       █"
db CHAR_NEWLINE, CHAR_RETURN, "█                                                       █"
db CHAR_NEWLINE, CHAR_RETURN, "█████████████████████████████████████████████████████████"
db CHAR_NEWLINE, CHAR_RETURN, CHAR_EOT

;Space 
COLOR_TEXT:
db ASCII_ESC, ASCII_LBR, ASCII_BG, " ", ASCII_TER, CHAR_EOT, CHAR_NULL

;COLOR_BLACK equ "0"
;COLOR_RED equ "1"
;COLOR_GREEN equ "2"
;COLOR_YELLOW equ "3"
;COLOR_BLUE equ "4"
;COLOR_PURPLE equ "5"
;COLOR_CYAN equ "6"
;COLOR_WHITE equ "7"

MAP_00:
db "22222222"
db "62222322"
db "66222222"
db "46622222"
db "44666222"
db "44446666"
db "44444444"
db "44444444", CHAR_EOT

MAP_00_DESC:
db CHAR_RETURN, CHAR_NEWLINE, "You see the river begin to bend toward the east.", CHAR_EOT