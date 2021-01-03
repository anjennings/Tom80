;ASH - Aidan's SHell
;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

;TODO:
;Change most DE to HL
;Change eror to check for non-zero values
;Write doesn't seem to write correctly
;Read doesn't read correctly at non-0 values
;conway's game of life?

STACK_H equ 0xFF
STACK_L equ 0xFF

;First byte of term buf is the size of the term buf
TERM_BUF equ 0x8000
;Maximum size of the buffer
TERM_BUF_MAX  equ 256

;Baud Rate Divisor (115200)
BAUD_DIV_HIGH equ 0
BAUD_DIV_LOW equ 8

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
    CALL MONITOR
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
;Assumes that A is the charactar to write
;/////////////////////////////////////////
PRINTCH:
    PUSH AF

    CALL UART_CLEAR_DLAB

    PRINTCH_LOOP:
        ;Read transmit register status in line status register (LSR) See page 22
        ;Wait if not empty
        IN A, (UART_LSR)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    ;Write Char to UART
    POP AF
    OUT (UART_DHR), A
    RET


;////////////////////////////////////////
;Writes a string via IO
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
;0x00 - Good
;0xFF - Bad
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
    INC L   ;TODO: ???

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

;TODO: Can this just write over the other buffers?
;Buffer for Parser
PARSE_RAM equ 0x8200
;Current and next token for parser
PARSE_CUR equ 0x8200
PARSE_NEXT equ 0x8201
;Location of state for FSM
PARSE_STATE equ 0x8202
;Incrementor location for parser
PARSE_INC equ 0x8203
;High and low values for literals
PARSE_LIT_H equ 0x8204
PARSE_LIT_L equ 0x8205

PARSE_BUF equ 0x8210

;This should organize each token into a fully readable form
;I'm using the term 'Parse' very loosely
;Return 0x00 on success
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

    ;Set state to be start
    ;LD HL, PARSE_STATE
    ;LD (HL), STATE_START

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

;This is essentially a big case statement depending on which token appears
;first in the parse buffer, each case has a corresponding subroutine
;it shouldn't be hard to add extra functions later if needed

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
;/////////DATA/////////
;//////////////////////

BOOT_MSG:
db CHAR_NEWLINE, CHAR_RETURN, "ASH v0.2", CHAR_NEWLINE, CHAR_RETURN, "(C) 2020 by Aidan Jennings"
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


;END OF MONITOR












;*************************************************************
;
;                 TINY BASIC FOR ZILOG Z80
;                       VERSION 2.5g
;
;		       ORIGINAL v2.0
;                     BY LI-CHEN WANG
;
;                  MODIFIED AND TRANSLATED
;                    TO INTEL MNEMONICS
;                     BY ROGER RAUSKOLB
;                      10 OCTOBER,1976
;
;                  MODIFIED AND TRANSLATED
;                    TO ZILOG MNEMONICS
;                      BY DOUG GABBARD
;		     www.retrodepot.net
;
;		    RELEASED TO THE PUBLIC
;                      10 OCTOBER,2017
;                  YEAH, 41 YEARS LATER....
;
;		       UPDATED TO V2.5g
;		       9 DECEMBER, 2017
;		       BY DOUG GABBARD
;		      www.retrodepot.net
;
;                         @COPYLEFT
;                   ALL WRONGS RESERVED
;
;*************************************************************
; This code is derived from the original 8080 Tiny Basic.
; It was first compiled in 8080 Mnemonics, then disassembled
; into Zilog Mnemonics.  And then checked against the original
; to ensure accuracy.  It was then partially enhanced with z80
; specific code. And once done, it was then modified to work
; with the G80-S Micro Computer. However, that portion of the
; code has been left out in order to make this code a little
; more portable.  There are only three routines that one needs
; to write, and specifing the serial port's I/O address, in
; order to make this version work with your own DIY computer.
; Those routines can be found at the end of the source code.
;
; I hope you find good use for this relic. However, I would
; ask that if you do find use for it, please put a reference
; to me in your work. And please, distribute freely.
;*************************************************************



;*************************************************************
; *** ROUTINES TO MODIFY ***
;
; The routines that need modified for this to work with your
; particular computer are at the bottom of this file.  They
; are: SERIAL_INIT, RX_RDY, and TX_RDY.  SERIAL_INIT is a
; routine to intialize the Serial Port that will be used.
; RX_RDY is a routine to check if the Serial Port has a
; character available.  And TX_RDY checks to see if the Serial
; Port is ready to send a character, and then sends it.
;
; You will also need to define the location of your serial
; port.  It's is the next line below this block of text.
;*************************************************************




SerialPort	EQU	UART_DHR	;This is for your I/0


SPACE           EQU     020H            ; Space
TAB             EQU     09H             ; HORIZONTAL TAB
CTRLC           EQU     03H             ; Control "C"
CTRLG           EQU     07H             ; Control "G"
BKSP            EQU     08H             ; Back space
LF              EQU     0AH             ; Line feed
CS              EQU     0CH             ; Clear screen
CR              EQU     0DH             ; Carriage return
CTRLO           EQU     0FH             ; Control "O"
CTRLQ	        EQU     011H            ; Control "Q"
CTRLR           EQU     012H            ; Control "R"
CTRLS           EQU     013H            ; Control "S"
CTRLU           EQU     015H            ; Control "U"
ESC             EQU     01BH            ; Escape
DEL             EQU     07FH            ; Delete

STACK           EQU     0FFFFH          ; STACKB
OCSW            EQU     08000H          ;SWITCH FOR OUTPUT
CURRNT          EQU     OCSW+1          ;POINTS FOR OUTPUT
STKGOS          EQU     OCSW+3          ;SAVES SP IN 'GOSUB'
VARNXT          EQU     OCSW+5          ;TEMP STORAGE
STKINP          EQU     OCSW+7          ;SAVES SP IN 'INPUT'
LOPVAR          EQU     OCSW+9          ;'FOR' LOOP SAVE AREA
LOPINC          EQU     OCSW+11         ;INCREMENT
LOPLMT          EQU     OCSW+13         ;LIMIT
LOPLN           EQU     OCSW+15         ;LINE NUMBER
LOPPT           EQU     OCSW+17         ;TEXT POINTER
RANPNT          EQU     OCSW+19         ;RANDOM NUMBER POINTER
TXTUNF          EQU     OCSW+21         ;->UNFILLED TEXT AREA
TXTBGN          EQU     OCSW+23         ;TEXT SAVE AREA BEGINS

TXTEND          EQU     0FF00H          ;TEXT SAVE AREA ENDS


;*************************************************************
; *** ZERO PAGE SUBROUTINES ***
;
; THE Z80 INSTRUCTION SET ALLOWS FOR 8 ROUTINES IN LOW MEMORY
; THAT MAY BE CALLED BY RST 00H, 08H, 10H, 18H, 20H, 28H, 30H,
; AND 38H.  THIS IS A ONE BYTE INSTRUCTION, AND IS FUNCTIONALLY
; SIMILAR TO THE THREE BYTE INSTRUCTION 'CALL XXXX'. TINY BASIC
; WILL USE THE RST INSTRUCTION FOR THE 7 MOST FREQUENTLY USED
; SUBROUTINES. TWO OTHER SUBROUTINES (CRLF & TSTNUM) ARE ALSO
; IN THIS SECTION. THEY CAN BE REACHED WITH 'CALL'.
;*************************************************************
DWA     MACRO WHERE
        DB   (WHERE SHR 8) + 128
        DB   WHERE AND 0FFH
        ENDM

        ORG  0800H

START:
        LD SP,STACK                      ;*** COLD START ***
        LD A,0FFH
        JP INIT

RST08:  EX (SP),HL                      ;*** TSTC OR RST 08H ***
        RST 28H                         ;IGNORE BLANKS AND
        CP (HL)                         ;TEST CHARACTER
        JP TC1                          ;REST OF THIS IS AT TC1

CRLF:
        LD A,CR                         ;*** CRLF ***

RST10:  PUSH AF                         ;*** OUTC OR RST 10H ***
        LD A,(OCSW)                     ;PRINT CHARACTER ONLY
        OR A                            ;IF OCSW SWITCH IS ON
        JP OUTC                         ;REST OF THIS AT OUTC

RST18:  CALL EXPR2                      ;*** EXPR OR RST 18H ***
        PUSH HL                         ;EVALUATE AN EXPRESSION
        JP EXPR1                        ;REST OF IT AT EXPR1
        DB 'W'

RST20:  LD A,H                          ;*** COMP OR RST 20H ***
        CP D                            ;COMPARE HL WITH DE
        RET NZ                          ;RETURN CORRECT C AND
        LD A,L                          ;Z FLAGS
        CP E                            ;BUT OLD A IS LOST
        RET
        DB 'AN'

SS1:
RST28:  LD A,(DE)                       ;*** IGNBLK/RST 28H ***
        CP 20H                          ;IGNORE BLANKS
        RET NZ                          ;IN TEXT (WHERE DE->)
        INC DE                          ;AND RETURN THE FIRST
        JP SS1                          ;NON-BLANK CHAR. IN A

RST30:  POP AF                          ;*** FINISH/RST 30H ***
        CALL FIN                        ;CHECK END OF COMMAND
        JP QWHAT                        ;PRINT "WHAT?" IF WRONG
        DB 'G'

RST38:  RST 28H                         ;*** TSTV OR RST 38H ***
        SUB 40H                         ;TEST VARIABLES
        RET C                           ;C:NOT A VARIABLE
        JR NZ,TV1                       ;NOT "@" ARRAY
        INC DE                          ;IT IS THE "@" ARRAY
        CALL PARN                       ;@ SHOULD BE FOLLOWED
        ADD HL,HL                       ;BY (EXPR) AS ITS INDEX
        JR C,QHOW                       ;IS INDEX TOO BIG?
        PUSH DE                         ;WILL IT OVERWRITE
        EX DE,HL                        ;TEXT?
        CALL SIZE                       ;FIND SIZE OF FREE
        RST 20H                         ;AND CHECK THAT
        JP C,ASORRY                     ;IF SO, SAY "SORRY"
        LD HL,VARBGN                    ;IF NOT GET ADDRESS
        CALL SUBDE                      ;OF @(EXPR) AND PUT IT
        POP DE                          ;IN HL
        RET                             ;C FLAG IS CLEARED

TV1:
        CP 1BH                          ;NOT @, IS IT A TO Z?
        CCF                             ;IF NOT RETURN C FLAG
        RET C
        INC DE                          ;IF A THROUGH Z
        LD HL,VARBGN                    ;COMPUTE ADDRESS OF
        RLCA                            ;THAT VARIABLE
        ADD A,L                         ;AND RETURN IT IN HL
        LD L,A                          ;WITH C FLAG CLEARED
        LD A,00H
        ADC A,H
        LD H,A
        RET

TC1:
        INC HL                          ;COMPARE THE BYTE THAT
        JR Z,TC2                        ;FOLLOWS THE RST INST.
        PUSH BC                         ;WITH THE TEXT (DE->)
        LD C,(HL)                       ;IF NOT =, ADD THE 2ND
        LD B,00H                        ;BYTE THAT FOLLOWS THE
        ADD HL,BC                       ;RST TO THE OLD PC
        POP BC                          ;I.E., DO A RELATIVE
        DEC DE                          ;JUMP IF NOT =

TC2:
        INC DE                          ;IF =, SKIP THOSE BYTES
        INC HL                          ;AND CONTINUE
        EX (SP),HL
        RET

TSTNUM:
        LD HL,0000H                     ;*** TSTNUM ***
        LD B,H                          ;TEST IF THE TEXT IS
        RST 28H                         ;A NUMBER

TN1:
        CP 30H                          ;IF NOT, RETURN 0 IN
        RET C                           ;B AND HL
        CP 3AH                          ;IF NUMBERS, CONVERT
        RET NC                          ;TO BINARY IN HL AND
        LD A,0F0H                       ;SET B TO # OF DIGITS
        AND H                           ;IF H>255, THERE IS NO
        JR NZ,QHOW                      ;ROOM FOR NEXT DIGIT
        INC B                           ;B COUNTS # OF DIGITS
        PUSH BC
        LD B,H                          ;HL=10*HL+(NEW DIGIT)
        LD C,L
        ADD HL,HL                       ;WHERE 10* IS DONE BY
        ADD HL,HL                       ;SHIFT AND ADD
        ADD HL,BC
        ADD HL,HL
        LD A,(DE)                       ;AND (DIGIT) IS FROM
        INC DE                          ;STRIPPING THE ASCII
        AND 0FH                         ;CODE
        ADD A,L
        LD L,A
        LD A,00H
        ADC A,H
        LD H,A
        POP BC
        LD A,(DE)                       ;DO THIS DIGIT AFTER
        JP P,TN1                        ;DIGIT. S SAYS OVERFLOW

QHOW:
        PUSH DE                         ;*** ERROR "HOW?" ***
AHOW:
        LD DE,HOW
        JP ERROR_ROUTINE


HOW:    DB "HOW?",CR
OK:     DB "OK",CR
WHAT:   DB "WHAT?",CR
SORRY:  DB "SORRY",CR
;*************************************************************
;
; *** MAIN ***
;
; THIS IS THE MAIN LOOP THAT COLLECTS THE TINY BASIC PROGRAM
; AND STORES IT IN THE MEMORY.
;
; AT START, IT PRINTS OUT "(CR)OK(CR)", AND INITIALIZES THE
; STACKB AND SOME OTHER INTERNAL VARIABLES.  THEN IT PROMPTS
; ">" AND READS A LINE.  IF THE LINE STARTS WITH A NON-ZERO
; NUMBER, THIS NUMBER IS THE LINE NUMBER.  THE LINE NUMBER
; (IN 16 BIT BINARY) AND THE REST OF THE LINE (INCLUDING CR)
; IS STORED IN THE MEMORY.  IF A LINE WITH THE SAME LINE
; NUMBER IS ALREADY THERE, IT IS REPLACED BY THE NEW ONE.  IF
; THE REST OF THE LINE CONSISTS OF A CR ONLY, IT IS NOT STORED
; AND ANY EXISTING LINE WITH THE SAME LINE NUMBER IS DELETED.
;
; AFTER A LINE IS INSERTED, REPLACED, OR DELETED, THE PROGRAM
; LOOPS BACK AND ASKS FOR ANOTHER LINE.  THIS LOOP WILL BE
; TERMINATED WHEN IT READS A LINE WITH ZERO OR NO LINE
; NUMBER; AND CONTROL IS TRANSFERED TO "DIRECT".
;
; TINY BASIC PROGRAM SAVE AREA STARTS AT THE MEMORY LOCATION
; LABELED "TXTBGN" AND ENDS AT "TXTEND".  WE ALWAYS FILL THIS
; AREA STARTING AT "TXTBGN", THE UNFILLED PORTION IS POINTED
; BY THE CONTENT OF A MEMORY LOCATION LABELED "TXTUNF".
;
; THE MEMORY LOCATION "CURRNT" POINTS TO THE LINE NUMBER
; THAT IS CURRENTLY BEING INTERPRETED.  WHILE WE ARE IN
; THIS LOOP OR WHILE WE ARE INTERPRETING A DIRECT COMMAND
; (SEE NEXT SECTION). "CURRNT" SHOULD POINT TO A 0.
;*************************************************************

RSTART:
        LD SP,STACK

ST1:
        CALL CRLF                       ;AND JUMP TO HERE
        LD DE,OK                        ;DE->STRING
        SUB A                           ;A=0
        CALL PRTSTG                     ;PRINT STRING UNTIL CR
        LD HL,ST2+1                     ;LITERAL 0
        LD (CURRNT),HL                  ;CURRENT->LINE # = 0

ST2:
        LD HL,0000H
        LD (LOPVAR),HL
        LD (STKGOS),HL

ST3:
        LD A,'>'                        ;PROMPT '>' AND
        CALL GETLN                      ;READ A LINE
        PUSH DE                         ;DE->END OF LINE
        LD DE,BUFFER                    ;DE->BEGINNING OF LINE
        CALL TSTNUM                     ;TEST IF IT IS A NUMBER
        RST 28H
        LD A,H                          ;HL=VALUE OF THE # OR
        OR L                            ;0 IF NO # WAS FOUND
        POP BC                          ;BC->END OF LINE
        JP Z,DIRECT
        DEC DE                          ;BACKUP DE AND SAVE
        LD A,H                          ;VALUE OF LINE # THERE
        LD (DE),A
        DEC DE
        LD A,L
        LD (DE),A
        PUSH BC                         ;BC,DE->BEGIN, END
        PUSH DE
        LD A,C
        SUB E

        PUSH AF                         ;A=# OF BYTES IN LINE
        CALL FNDLN                      ;FIND THIS LINE IN SAVE
        PUSH DE                         ;AREA, DE->SAVE AREA
        JR NZ,ST4                       ;NZ:NOT FOUND, INSERT
        PUSH DE                         ;Z:FOUND, DELETE IT
        CALL FNDNXT                     ;FIND NEXT LINE
                                        ;DE->NEXT LINE
        POP BC                          ;BC->LINE TO BE DELETED
        LD HL,(TXTUNF)                  ;HL->UNFILLED SAVE AREA
        CALL MVUP                       ;MOVE UP TO DELETE
        LD H,B                          ;TXTUNF->UNFILLED ARA
        LD L,C
        LD (TXTUNF),HL                  ;UPDATE

ST4:
        POP BC                          ;GET READY TO INSERT
        LD HL,(TXTUNF)                  ;BUT FIRST CHECK IF
        POP AF                          ;THE LENGTH OF NEW LINE
        PUSH HL                         ;IS 3 (LINE # AND CR)
        CP 03H                          ;THEN DO NOT INSERT
        JR Z,RSTART                     ;MUST CLEAR THE STACKB
        ADD A,L                         ;COMPUTE NEW TXTUNF
        LD L,A
        LD A,00H
        ADC A,H
        LD H,A                          ;HL->NEW UNFILLED AREA
        LD DE,TXTEND                    ;CHECK TO SEE IF THERE
        RST 20H                         ;IS ENOUGH SPACE
        JP NC,QSORRY                    ;SORRY, NO ROOM FOR IT
        LD (TXTUNF),HL                  ;OK, UPDATE TXTUNF
        POP DE                          ;DE->OLD UNFILLED AREA
        CALL MVDOWN
        POP DE                          ;DE->BEGIN, HL->END
        POP HL
        CALL MVUP                       ;MOVE NEW LINE TO SAVE
        JR ST3                          ;AREA

;*************************************************************
;
; WHAT FOLLOWS IS THE CODE TO EXECUTE DIRECT AND STATEMENT
; COMMANDS.  CONTROL IS TRANSFERED TO THESE POINTS VIA THE
; COMMAND TABLE LOOKUP CODE OF 'DIRECT' AND 'EXEC' IN LAST
; SECTION.  AFTER THE COMMAND IS EXECUTED, CONTROL IS
; TRANSFERED TO OTHERS SECTIONS AS FOLLOWS:
;
; FOR 'LIST', 'NEW', AND 'STOP': GO BACK TO 'RSTART'
; FOR 'RUN': GO EXECUTE THE FIRST STORED LINE IF ANY, ELSE
; GO BACK TO 'RSTART'.
; FOR 'GOTO' AND 'GOSUB': GO EXECUTE THE TARGET LINE.
; FOR 'RETURN' AND 'NEXT': GO BACK TO SAVED RETURN LINE.
; FOR ALL OTHERS: IF 'CURRENT' -> 0, GO TO 'RSTART', ELSE
; GO EXECUTE NEXT COMMAND.  (THIS IS DONE IN 'FINISH'.)
;*************************************************************
;
; *** NEW *** STOP *** RUN (& FRIENDS) *** & GOTO ***
;
; 'NEW(CR)' SETS 'TXTUNF' TO POINT TO 'TXTBGN'
;
; 'STOP(CR)' GOES BACK TO 'RSTART'
;
; 'RUN(CR)' FINDS THE FIRST STORED LINE, STORE ITS ADDRESS (IN
; 'CURRENT'), AND START EXECUTE IT.  NOTE THAT ONLY THOSE
; COMMANDS IN TAB2 ARE LEGAL FOR STORED PROGRAM.
;
; THERE ARE 3 MORE ENTRIES IN 'RUN':
; 'RUNNXL' FINDS NEXT LINE, STORES ITS ADDR. AND EXECUTES IT.
; 'RUNTSL' STORES THE ADDRESS OF THIS LINE AND EXECUTES IT.
; 'RUNSML' CONTINUES THE EXECUTION ON SAME LINE.
;
; 'GOTO EXPR(CR)' EVALUATES THE EXPRESSION, FIND THE TARGET
; LINE, AND JUMP TO 'RUNTSL' TO DO IT.
;*************************************************************

NEW:
        CALL ENDCHK                     ;*** NEW(CR) ***
        LD HL,TXTBGN
        LD (TXTUNF),HL
STOP:
        CALL ENDCHK                     ;*** STOP(CR) ***
        JP RSTART
RUN:
        CALL ENDCHK                     ;*** RUN(CR) ***
        LD DE,TXTBGN                    ;FIRST SAVED LINE
RUNNXL:
        LD HL,00H                       ;*** RUNNXL ***
        CALL FNDLP                      ;FIND WHATEVER LINE #
        JP C,RSTART                     ;C:PASSED TXTUNF, QUIT
RUNTSL:
        EX DE,HL                        ;*** RUNTSL ***
        LD (CURRNT),HL                  ;SET 'CURRENT'->LINE #
        EX DE,HL
        INC DE                          ;BUMP PASS LINE #
        INC DE
RUNSML:
        CALL CHKIO                      ;*** RUNSML ***
        LD HL,TAB2-1                    ;FIND COMMAND IN TAB2
        JP EXEC                         ;AND EXECUTE IT
GOTO:
        RST 18H                         ;*** GOTO EXPR ***
        PUSH DE                         ;SAVE FOR ERROR ROUTINE
        CALL ENDCHK                     ;MUST FIND A CR
        CALL FNDLN                      ;FIND THE TARGET LINE
        JP NZ,AHOW                      ;NO SUCH LINE #
        POP AF                          ;CLEAR THE PUSH DE
        JR RUNTSL                       ;GO DO IT

;*************************************************************
;
; *** LIST *** & PRINT ***
;
; LIST HAS TWO FORMS:
; 'LIST(CR)' LISTS ALL SAVED LINES
; 'LIST #(CR)' START LIST AT THIS LINE #
; YOU CAN STOP THE LISTING BY CONTROL C KEY
;
; PRINT COMMAND IS 'PRINT ....;' OR 'PRINT ....(CR)'
; WHERE '....' IS A LIST OF EXPRESIONS, FORMATS, BACK-
; ARROWS, AND STRINGS.  THESE ITEMS ARE SEPERATED BY COMMAS.
;
; A FORMAT IS A POUND SIGN FOLLOWED BY A NUMBER.  IT CONTROLS
; THE NUMBER OF SPACES THE VALUE OF A EXPRESION IS GOING TO
; BE PRINTED.  IT STAYS EFFECTIVE FOR THE REST OF THE PRINT
; COMMAND UNLESS CHANGED BY ANOTHER FORMAT.  IF NO FORMAT IS
; SPECIFIED, 6 POSITIONS WILL BE USED.
;
; A STRING IS QUOTED IN A PAIR OF SINGLE QUOTES OR A PAIR OF
; DOUBLE QUOTES.
;
; A BACK-ARROW MEANS GENERATE A (CR) WITHOUT (LF)
;
; A (CRLF) IS GENERATED AFTER THE ENTIRE LIST HAS BEEN
; PRINTED OR IF THE LIST IS A NULL LIST.  HOWEVER IF THE LIST
; ENDED WITH A COMMA, NO (CRLF) IS GENERATED.
;*************************************************************

LIST:
        CALL TSTNUM                     ;TEST IF THERE IS A #
        CALL ENDCHK                     ;IF NO # WE GET A 0
        CALL FNDLN                      ;FIND THIS OR NEXT LINE
LS1:
        JP C,RSTART                     ;C:PASSED TXTUNF
        CALL PRTLN                      ;PRINT THE LINE
        CALL CHKIO                      ;STOP IF HIT CONTROL-C
        CALL FNDLP                      ;FIND NEXT LINE
        JR LS1                          ;AND LOOP BACK
PRINT:
        LD C,06H                        ;C = # OF SPACES
        RST 08H                         ;F NULL LIST & ";"
        DB 3BH
        DB PR2-$-1
        CALL CRLF                       ;GIVE CR-LF AND
        JR RUNSML                       ;CONTINUE SAME LINE
PR2:
        RST 08H                         ;IF NULL LIST (CR)
        DB CR
        DB PR0-$-1
        CALL CRLF                       ;ALSO GIVE CR-LF AND
        JR RUNNXL                       ;GO TO NEXT LINE
PR0:
        RST 08H                         ;ELSE IS IT FORMAT?
        DB '#'
        DB PR1-$-1
        RST 18H                         ;YES, EVALUATE EXPR.
        LD C,L                          ;AND SAVE IT IN C
        JR PR3                          ;LOOK FOR MORE TO PRINT
PR1:
        CALL QTSTG                      ;OR IS IT A STRING?
        JR PR8                          ;IF NOT, MUST BE EXPR.
PR3:
        RST 08H                         ;IF ",", GO FIND NEXT
        DB ','
        DB PR6-$-1
        CALL FIN                        ;IN THE LIST.
        JR PR0                          ;LIST CONTINUES
PR6:
        CALL CRLF                       ;LIST ENDS
        RST 30H
PR8:
        RST 18H                         ;EVALUATE THE EXPR
        PUSH BC
        CALL PRTNUM                     ;PRINT THE VALUE
        POP BC
        JR PR3                          ;MORE TO PRINT?
;
;*************************************************************
;
; *** GOSUB *** & RETURN ***
;
; 'GOSUB EXPR;' OR 'GOSUB EXPR (CR)' IS LIKE THE 'GOTO'
; COMMAND, EXCEPT THAT THE CURRENT TEXT POINTER, STACKB POINTER
; ETC. ARE SAVE SO THAT EXECUTION CAN BE CONTINUED AFTER THE
; SUBROUTINE 'RETURN'.  IN ORDER THAT 'GOSUB' CAN BE NESTED
; (AND EVEN RECURSIVE), THE SAVE AREA MUST BE STACKBED.
; THE STACKB POINTER IS SAVED IN 'STKGOS', THE OLD 'STKGOS' IS
; SAVED IN THE STACKB.  IF WE ARE IN THE MAIN ROUTINE, 'STKGOS'
; IS ZERO (THIS WAS DONE BY THE "MAIN" SECTION OF THE CODE),
; BUT WE STILL SAVE IT AS A FLAG FOR NO FURTHER 'RETURN'S.
;
; 'RETURN(CR)' UNDOS EVERYTHING THAT 'GOSUB' DID, AND THUS
; RETURN THE EXECUTION TO THE COMMAND AFTER THE MOST RECENT
; 'GOSUB'.  IF 'STKGOS' IS ZERO, IT INDICATES THAT WE
; NEVER HAD A 'GOSUB' AND IS THUS AN ERROR.
;*************************************************************

GOSUB:
        CALL PUSHA                      ;SAVE THE CURRENT "FOR"
        RST 18H                         ;PARAMETERS
        PUSH DE                         ;AND TEXT POINTER
        CALL FNDLN                      ;FIND THE TARGET LINE
        JP NZ,AHOW                      ;NOT THERE. SAY "HOW?"
        LD HL,(CURRNT)                  ;FOUND IT, SAVE OLD.
        PUSH HL                         ;'CURRNT' OLD 'STKGOS'
        LD HL,(STKGOS)
        PUSH HL
        LD HL,0000H                     ;AND LOAD NEW ONES
        LD (LOPVAR),HL
        ADD HL,SP
        LD (STKGOS),HL
        JP RUNTSL                       ;THEN RUN THAT LINE
RETURN:
        CALL ENDCHK                     ;THERE MUST BE A CR
        LD HL,(STKGOS)                  ;OLD STACKB POINTER
        LD A,H                          ;0 MEANS NOT EXIST
        OR L
        JP Z,QWHAT                      ;SO, WE SAY: "WHAT?"
        LD SP,HL                        ;ELSE, RESTORE IT
        POP HL
        LD (STKGOS),HL                  ;AND THE OLD "STKGOS"
        POP HL
        LD (CURRNT),HL                  ;AND THE OLD 'CURRNT'
        POP DE                          ;OLD TEXT POINTER
        CALL POPA                       ;OLD "FOR" PARAMETERS
        RST 30H                         ;AND WE ARE BACK HOME

;*************************************************************
;
; *** FOR *** & NEXT ***
;
; 'FOR' HAS TWO FORMS:
; 'FOR VAR=EXP1 TO EXP2 STEP EXP3' AND 'FOR VAR=EXP1 TO EXP2'
; THE SECOND FORM MEANS THE SAME THING AS THE FIRST FORM WITH
; EXP3=1.  (I.E., WITH A STEP OF +1.)
; TBI WILL FIND THE VARIABLE VAR, AND SET ITS VALUE TO THE
; CURRENT VALUE OF EXP1.  IT ALSO EVALUATES EXP2 AND EXP3
; AND SAVE ALL THESE TOGETHER WITH THE TEXT POINTER ETC. IN
; THE 'FOR' SAVE AREA, WHICH CONSISTS OF 'LOPVAR', 'LOPINC',
; 'LOPLMT', 'LOPLN', AND 'LOPPT'.  IF THERE IS ALREADY SOME-
; THING IN THE SAVE AREA (THIS IS INDICATED BY A NON-ZERO
; 'LOPVAR'), THEN THE OLD SAVE AREA IS SAVED IN THE STACKB
; BEFORE THE NEW ONE OVERWRITES IT.
; TBI WILL THEN DIG IN THE STACKB AND FIND OUT IF THIS SAME
; VARIABLE WAS USED IN ANOTHER CURRENTLY ACTIVE 'FOR' LOOP.
; IF THAT IS THE CASE, THEN THE OLD 'FOR' LOOP IS DEACTIVATED.
; (PURGED FROM THE STACKB..)
;
; 'NEXT VAR' SERVES AS THE LOGICAL (NOT NECESSARILLY PHYSICAL)
; END OF THE 'FOR' LOOP.  THE CONTROL VARIABLE VAR. IS CHECKED
; WITH THE 'LOPVAR'.  IF THEY ARE NOT THE SAME, TBI DIGS IN
; THE STACKB TO FIND THE RIGHT ONE AND PURGES ALL THOSE THAT
; DID NOT MATCH.  EITHER WAY, TBI THEN ADDS THE 'STEP' TO
; THAT VARIABLE AND CHECK THE RESULT WITH THE LIMIT.  IF IT
; IS WITHIN THE LIMIT, CONTROL LOOPS BACK TO THE COMMAND
; FOLLOWING THE 'FOR'.  IF OUTSIDE THE LIMIT, THE SAVE AREA
; IS PURGED AND EXECUTION CONTINUES.
;*************************************************************

FOR:
        CALL PUSHA                      ;SAVE THE OLD SAVE AREA
        CALL SETVAL                     ;SET THE CONTROL VAR.
        DEC HL                          ;HL IS ITS ADDRESS
        LD (LOPVAR),HL                  ;SAVE THAT
        LD HL,TAB5-1                    ;USE 'EXEC' TO LOOK
        JP EXEC                         ;FOR THE WORK 'TO'
FR1:
        RST 18H                         ;EVALUATE THE LIMITE
        LD (LOPLMT),HL                  ;SAVE THAT
        LD HL,TAB6-1                    ;USE 'EXEC' TO LOOK
        JP EXEC                         ;FOR THE WORD 'STEP'
FR2:
        RST 18H                         ;FOUND IT, GET STEP
        JR FR4
FR3:
        LD HL,0001H                     ;NOT FOUND, SET TO 1
FR4:
        LD (LOPINC),HL                  ;SAVE THAT TOO
FR5:
        LD HL,(CURRNT)                  ;SAVE CURRENT LINE #
        LD (LOPLN),HL
        EX DE,HL                        ;AND TEXT POINTER
        LD (LOPPT),HL
        LD BC,0AH                       ;DIG INTO STACKB TO
        LD HL,(LOPVAR)                  ;FIND 'LOPVAR'
        EX DE,HL
        LD H,B
        LD L,B                          ;HL=0 NOW
        ADD HL,SP                       ;HERE IS THE STACKB
        DB 3EH                          ;DISASSEMBLY SAID "ld a,09h"
FR7:
        ADD HL,BC                       ;EACH LEVEL IS 10 DEEP - DIS = 09
        LD A,(HL)                       ;GET THAT OLD 'LOPVAR'
        INC HL
        OR (HL)
        JR Z,FR8                        ;0 SAYS NO MORE IN IT
        LD A,(HL)
        DEC HL
        CP D                            ;SAME AS THIS ONE?
        JR NZ,FR7
        LD A,(HL)                       ;THE OTHER HALF?
        CP E
        JR NZ,FR7
        EX DE,HL                        ;YES, FOUND ONE
        LD HL,0000H
        ADD HL,SP                       ;TRY TO MOVE SP
        LD B,H
        LD C,L
        LD HL,000AH
        ADD HL,DE
        CALL MVDOWN                     ;AND PURGE 10 WORDS
        LD SP,HL                        ;IN THE STACKB
FR8:
        LD HL,(LOPPT)                   ;JOB DONE, RESTORE DE
        EX DE,HL
        RST 30H                         ;AND CONTINUE
;
NEXT:
        RST 38H                         ;GET ADDRESS OF VAR.
        JP C,QWHAT                      ;NO VARIABLE, "WHAT?"
        LD (VARNXT),HL                  ;YES, SAVE IT
NX0:
        PUSH DE                         ;SAVE TEXT POINTER
        EX DE,HL
        LD HL,(LOPVAR)                  ;GET VAR. IN 'FOR'
        LD A,H
        OR L                            ;0 SAYS NEVER HAD ONE
        JP Z,AWHAT                      ;SO WE ASK: "WHAT?"
        RST 20H                         ;ELSE WE CHECK THEM
        JR Z,NX3                        ;OK, THEY AGREE
        POP DE                          ;NO, LET'S SEE
        CALL POPA                       ;PURGE CURRENT LOOP
        LD HL,(VARNXT)                  ;AND POP ONE LEVEL
        JR NX0                          ;GO CHECK AGAIN
NX3:
        LD E,(HL)                       ;COME HERE WHEN AGREED
        INC HL
        LD D,(HL)                       ;DE=VALUE OF VAR.
        LD HL,(LOPINC)
        PUSH HL
        LD A,H
        XOR D
        LD A,D
        ADD HL,DE                       ;ADD ONE STEP
        JP M,NX4
        XOR H
        JP M,NX5
NX4:
        EX DE,HL
        LD HL,(LOPVAR)                  ;PUT IT BACK
        LD (HL),E
        INC HL
        LD (HL),D
        LD HL,(LOPLMT)                  ;HL->LIMIT
        POP AF                          ;OLD HL
        OR A
        JP P,NX1                        ;STEP > 0
        EX DE,HL                        ;STEP < 0
NX1:
        CALL CKHLDE                     ;COMPARE WITH LIMIT
        POP DE                          ;RESTORE TEXT POINTER
        JR C,NX2                        ;OUTSIDE LIMIT
        LD HL,(LOPLN)                   ;WITHIN LIMIT, GO
        LD (CURRNT),HL                  ;BACK TO THE SAVED
        LD HL,(LOPPT)                   ;'CURRNT' AND TEXT
        EX DE,HL                        ;POINTER
        RST 30H
NX5:
        POP HL
        POP DE
NX2:
        CALL POPA                       ;PURGE THIS LOOP
        RST 30H
;
;*************************************************************
;
; *** REM *** IF *** INPUT *** & LET (& DEFLT) ***
;
; 'REM' CAN BE FOLLOWED BY ANYTHING AND IS IGNORED BY TBI.
; TBI TREATS IT LIKE AN 'IF' WITH A FALSE CONDITION.
;
; 'IF' IS FOLLOWED BY AN EXPR. AS A CONDITION AND ONE OR MORE
; COMMANDS (INCLUDING OTHER 'IF'S) SEPERATED BY SEMI-COLONS.
; NOTE THAT THE WORD 'THEN' IS NOT USED.  TBI EVALUATES THE
; EXPR. IF IT IS NON-ZERO, EXECUTION CONTINUES.  IF THE
; EXPR. IS ZERO, THE COMMANDS THAT FOLLOWS ARE IGNORED AND
; EXECUTION CONTINUES AT THE NEXT LINE.
;
; 'INPUT' COMMAND IS LIKE THE 'PRINT' COMMAND, AND IS FOLLOWED
; BY A LIST OF ITEMS.  IF THE ITEM IS A STRING IN SINGLE OR
; DOUBLE QUOTES, OR IS A BACK-ARROW, IT HAS THE SAME EFFECT AS
; IN 'PRINT'.  IF AN ITEM IS A VARIABLE, THIS VARIABLE NAME IS
; PRINTED OUT FOLLOWED BY A COLON.  THEN TBI WAITS FOR AN
; EXPR. TO BE TYPED IN.  THE VARIABLE IS THEN SET TO THE
; VALUE OF THIS EXPR.  IF THE VARIABLE IS PROCEDED BY A STRING
; (AGAIN IN SINGLE OR DOUBLE QUOTES), THE STRING WILL BE
; PRINTED FOLLOWED BY A COLON.  TBI THEN WAITS FOR INPUT EXPR.
; AND SET THE VARIABLE TO THE VALUE OF THE EXPR.
;
; IF THE INPUT EXPR. IS INVALID, TBI WILL PRINT "WHAT?",
; "HOW?" OR "SORRY" AND REPRINT THE PROMPT AND REDO THE INPUT.
; THE EXECUTION WILL NOT TERMINATE UNLESS YOU TYPE CONTROL-C.
; THIS IS HANDLED IN 'INPERR'.
;
; 'LET' IS FOLLOWED BY A LIST OF ITEMS SEPERATED BY COMMAS.
; EACH ITEM CONSISTS OF A VARIABLE, AN EQUAL SIGN, AND AN EXPR.
; TBI EVALUATES THE EXPR. AND SET THE VARIABLE TO THAT VALUE.
; TBI WILL ALSO HANDLE 'LET' COMMAND WITHOUT THE WORD 'LET'.
; THIS IS DONE BY 'DEFLT'.
;*************************************************************

REM:
        LD HL,0000H                     ;*** REM ***
        DB 3EH                          ;THIS IS LIKE 'IF 0'
IFF:
        RST 18H                         ;*** IF ***
        LD A,H                          ;IS THE EXPR.=0?
        OR L
        JP NZ,RUNSML                    ;NO, CONTINUE
        CALL FNDSKP                     ;YES, SKIP REST OF LINE
        JP NC,RUNTSL                    ;AND RUN THE NEXT LINE
        JP RSTART                       ;IF NO NEXT, RE-START
INPERR:
        LD HL,(STKINP)                  ;*** INPERR ***
        LD SP,HL                        ;RESTORE OLD SP
        POP HL                          ;AND OLD 'CURRNT'
        LD (CURRNT),HL
        POP DE                          ;AND OLD TEXT POINTER
        POP DE                          ;REDO INPUT
INPUT:                                  ;*** INPUT ***
IP1:
        PUSH DE                         ;SAVE IN CASE OF ERROR
        CALL QTSTG                      ;IS NEXT ITEM A STRING?
        JR IP2                          ;NO
        RST 38H                         ;YES, BUT FOLLOWED BY A
        JR C,IP4                        ;VARIABLE? NO.
        JR IP3                          ;YES. INPUT VARIABLE
IP2:
        PUSH DE                         ;SAVE FOR 'PRTSTG'
        RST 38H                         ;MUST BE VARIABLE NOW
        JP C,QWHAT                      ;"WHAT?" IT IS NOT?
        LD A,(DE)                       ;GET READY FOR 'PRTSTR'
        LD C,A
        SUB A
        LD (DE),A
        POP DE
        CALL PRTSTG                     ;PRINT STRING AS PROMPT
        LD A,C                          ;RESTORE TEXT
        DEC DE
        LD (DE),A
IP3:
        PUSH DE                         ;SAVE TEXT POINTER
        EX DE,HL
        LD HL,(CURRNT)                  ;ALSO SAVE 'CURRNT'
        PUSH HL
        LD HL,IP1                       ;A NEGATIVE NUMBER
        LD (CURRNT),HL                  ;AS A FLAG
        LD HL,0000H                     ;SAVE SP TOO
        ADD HL,SP
        LD (STKINP),HL
        PUSH DE                         ;OLD HL
        LD A,3AH                        ;PRINT THIS TOO
        CALL GETLN                      ;AND GET A LINE
        LD DE,BUFFER                    ;POINTS TO BUFFER
        RST 18H                         ;EVALUATE INPUT
        NOP                             ;CAN BE 'CALL ENDCHK'
        NOP
        NOP
        POP DE                          ;OK,GET OLD HL
        EX DE,HL
        LD (HL),E                       ;SAVE VALUE IN VAR.
        INC HL
        LD (HL),D
        POP HL                          ;GET OLD 'CURRNT'
        LD (CURRNT),HL
        POP DE                          ;AND OLD TEXT POINTER
IP4:
        POP AF                          ;PURGE JUNK IN STACKB
        RST 08H                         ;IS NEXT CH. ','?
        DB ','
        DB IP5-$-1
        JR IP1                          ;YES, MORE ITEMS.
IP5:
        RST 30H
DEFLT:
        LD A,(DE)                       ;***  DEFLT ***
        CP CR                           ;EMPTY LINE IS OK
        JR Z,LT1                        ;ELSE IT IS 'LET'
LET:
        CALL SETVAL                     ;*** LET ***
        RST 08H                         ;SET VALUE TO VAR
        DB ','                          ;---DISASSEMBLE = INC L
        DB LT1-$-1                      ;---DISASSEMBLE = INC BC
        JR LET                          ;ITEM BY ITEM
LT1:
        RST 30H                         ;UNTIL FINISH
;*************************************************************
;
; *** EXPR ***
;
; 'EXPR' EVALUATES ARITHMETICAL OR LOGICAL EXPRESSIONS.
; <EXPR>::<EXPR2>
;         <EXPR2><REL.OP.><EXPR2>
; WHERE <REL.OP.> IS ONE OF THE OPERATORS IN TAB8 AND THE
; RESULT OF THESE OPERATIONS IS 1 IF TRUE AND 0 IF FALSE.
; <EXPR2>::=(+ OR -)<EXPR3>(+ OR -<EXPR3>)(....)
; WHERE () ARE OPTIONAL AND (....) ARE OPTIONAL REPEATS.
; <EXPR3>::=<EXPR4>(* OR /><EXPR4>)(....)
; <EXPR4>::=<VARIABLE>
;           <FUNCTION>
;           (<EXPR>)
; <EXPR> IS RECURSIVE SO THAT VARIABLE '@' CAN HAVE AN <EXPR>
; AS INDEX, FUNCTIONS CAN HAVE AN <EXPR> AS ARGUMENTS, AND
; <EXPR4> CAN BE AN <EXPR> IN PARANTHESE.
;*************************************************************

EXPR1:
        LD HL,TAB8-1                    ;LOOKUP REL.OP.
        JP EXEC                         ;GO DO IT
XP11:
        CALL XP18                       ;REL.OP.">="
        RET C                           ;NO, RETURN HL=0
        LD L,A                          ;YES, RETURN HL=1
        RET
XP12:
        CALL XP18                       ;REL.OP."#"
        RET Z                           ;FALSE, RETURN HL=0
        LD L,A                          ;TRUE, RETURN HL=1
        RET
XP13:
        CALL XP18                       ;REL.OP.">"
        RET Z                           ;FALSE
        RET C                           ;ALSO FALSE, HL=0
        LD L,A                          ;TRUE, HL=1
        RET
XP14:
        CALL XP18                       ;REL.OP."<="
        LD L,A                          ;SET HL=1
        RET Z                           ;REL. TRUE, RETURN
        RET C
        LD L,H                          ;ELSE SET HL=0
        RET
XP15:
        CALL XP18                       ;REL.OP."="
        RET NZ                          ;FALSE, RETURN HL=0
        LD L,A                          ;ELSE SET HL=1
        RET
XP16:
        CALL XP18                       ;REL.OP."<"
        RET NC                          ;FALSE, RETURN HL=0
        LD L,A                          ;ELSE SET HL=1
        RET
XP17:
        POP HL                          ;NOT .REL.OP
        RET                             ;RETURN HL=<EXPR2>
XP18:
        LD A,C                          ;SUBROUTINE FOR ALL
        POP HL                          ;REL.OP.'S
        POP BC
        PUSH HL                         ;REVERSE TOP OF STACKB
        PUSH BC
        LD C,A
        CALL EXPR2                      ;GET 2ND <EXPR2>
        EX DE,HL                        ;VALUE IN DE NOW
        EX (SP),HL                      ;1ST <EXPR2> IN HL
        CALL CKHLDE                     ;COMPARE 1ST WITH 2ND
        POP DE                          ;RESTORE TEXT POINTER
        LD HL,0000H                     ;SET HL=0, A=1
        LD A,01H
        RET
EXPR2:
        RST 08H                         ;NEGATIVE SIGN?
        DB '-'
        DB XP21-$-1
        LD HL,0000H                     ;YES, FAKE '0-'
        JR XP26                         ;TREAT LIKE SUBTRACT
XP21:
        RST 08H                         ;POSITIVE SIGN? IGNORE
        DB '+'
        DB XP22-$-1
XP22:
        CALL EXPR3                      ;1ST <EXPR3>
XP23:
        RST 08H                         ;ADD?
        DB  '+'
        DB XP25-$-1
        PUSH HL                         ;YES, SAVE VALUE
        CALL EXPR3                      ;GET 2ND <EXPR3>
XP24:
        EX DE,HL                        ;2ND IN DE
        EX (SP),HL                      ;1ST IN HL
        LD A,H                          ;COMPARE SIGN
        XOR D
        LD A,D
        ADD HL,DE
        POP DE                          ;RESTORE TEXT POINTER
        JP M,XP23                       ;1ST AND 2ND SIGN DIFFER
        XOR H                           ;1ST AND 2ND SIGN EQUAL
        JP P,XP23                       ;SO IS RESULT
        JP QHOW                         ;ELSE WE HAVE OVERFLOW
XP25:
        RST 08H                         ;SUBTRACT?
        DB '-'
        DB XP42-$-1
XP26:
        PUSH HL                         ;YES, SAVE 1ST <EXPR3>
        CALL EXPR3                      ;GET 2ND <EXPR3>
        CALL CHGSGN                     ;NEGATE
        JR XP24                         ;AND ADD THEM
;
EXPR3:
        CALL EXPR4                      ;GET 1ST <EXPR4>
XP31:
        RST 08H                         ;MULTIPLY?
        DB '*'
        DB XP34-$-1
        PUSH HL                         ;YES, SAVE 1ST
        CALL EXPR4                      ;AND GET 2ND <EXPR4>
        LD B,00H                        ;CLEAR B FOR SIGN
        CALL CHKSGN                     ;CHECK SIGN
        EX (SP),HL                      ;1ST IN HL
        CALL CHKSGN                     ;CHECK SIGN OF 1ST
        EX DE,HL
        EX (SP),HL
        LD A,H                          ;IS HL > 255 ?
        OR A
        JR Z,XP32                       ;NO
        LD A,D                          ;YES, HOW ABOUT DE
        OR D
        EX DE,HL                        ;PUT SMALLER IN HL
        JP NZ,AHOW                      ;ALSO >, WILL OVERFLOW
XP32:
        LD A,L                          ;THIS IS DUMB
        LD HL,0000H                     ;CLEAR RESULT
        OR A                            ;ADD AND COUNT
        JR Z,XP35
XP33:
        ADD HL,DE
        JP C,AHOW                       ;OVERFLOW
        DEC A
        JR NZ,XP33
        JR XP35                         ;FINISHED
XP34:
        RST 08H                         ;DIVIDE?
        DB '/'
        DB XP42-$-1
        PUSH HL                         ;YES, SAVE 1ST <EXPR4>
        CALL EXPR4                      ;AND GET THE SECOND ONE
        LD B,00H                        ;CLEAR B FOR SIGN
        CALL CHKSGN                     ;CHECK SIGN OF 2ND
        EX (SP),HL                      ;GET 1ST IN HL
        CALL CHKSGN                     ;CHECK SIGN OF 1ST
        EX DE,HL
        EX (SP),HL
        EX DE,HL
        LD A,D                          ;DIVIDE BY 0?
        OR E
        JP Z,AHOW                       ;SAY "HOW?"
        PUSH BC                         ;ELSE SAVE SIGN
        CALL DIVIDE                     ;USE SUBROUTINE
        LD H,B                          ;RESULT IN HL NOW
        LD L,C
        POP BC                          ;GET SIGN BACK
XP35:
        POP DE                          ;AND TEXT POINTER
        LD A,H                          ;HL MUST BE +
        OR A
        JP M,QHOW                       ;ELSE IT IS OVERFLOW
        LD A,B
        OR A
        CALL M,CHGSGN                   ;CHANGE SIGN IF NEEDED
        JR XP31                         ;LOOK FOR MORE TERMS
EXPR4:
        LD HL,TAB4-1                    ;FIND FUNCTION IN TAB4
        JP EXEC                         ;AND GO DO IT
XP40:
        RST 38H                         ;NO, NOT A FUNCTION
        JR C,XP41                       ;NOR A VARIABLE
        LD A,(HL)                       ;VARIABLE
        INC HL
        LD H,(HL)                       ;VALUE IN HL
        LD L,A
        RET
XP41:
        CALL TSTNUM                     ;OR IS IT A NUMBER
        LD A,B                          ;# OF DIGIT
        OR A
        RET NZ                          ;OK
PARN:
        RST 08H
        DB '('
        DB XP43-$-1
        RST 18H                         ;"(EXPR)"
        RST 08H
        DB ')'
        DB XP43-$-1
XP42:
        RET
XP43:
        JP QWHAT                        ;ELSE SAY: "WHAT?"
RND:
        CALL PARN                       ;*** RND(EXPR) ***
        LD A,H                          ;EXPR MUST BE +
        OR A
        JP M,QHOW
        OR L                            ;AND NON-ZERO
        JP Z,QHOW
        PUSH DE                         ;SAVE BOTH
        PUSH HL
        LD HL,(RANPNT)                  ;GET MEMORY AS RANDOM
        LD DE,LSTROM                    ;NUMBER
        RST 20H
        JR C,RA1                        ;WRAP AROUND IF LAST
        LD HL,START
RA1:
        LD E,(HL)
        INC HL
        LD D,(HL)
        LD (RANPNT),HL
        POP HL
        EX DE,HL
        PUSH BC
        CALL DIVIDE                     ;RND (N)=MOD(M,N)+1
        POP BC
        POP DE
        INC HL
        RET
ABS:
        CALL PARN                       ;*** ABS (EXPR) ***
        DEC DE
        CALL CHKSGN                     ;CHECK SIGN
        INC DE
        RET
SIZE:
        LD HL,(TXTUNF)                  ;*** SIZE ***
        PUSH DE                         ;GET THE NUMBER OF FREE
        EX DE,HL                        ;BYTES BETWEEN 'TXTUNF'
        LD HL,VARBGN                    ;AND 'VARBGN'
        CALL SUBDE
        POP DE
        RET
;*************************************************************
;
; *** DIVIDE *** SUBDE *** CHKSGN *** CHGSGN *** & CKHLDE ***
;
; 'DIVIDE' DIVIDES HL BY DE, RESULT IN BC, REMAINDER IN HL
;
; 'SUBDE' SUBSTRACTS DE FROM HL
;
; 'CHKSGN' CHECKS SIGN OF HL.  IF +, NO CHANGE.  IF -, CHANGE
; SIGN AND FLIP SIGN OF B.
;
; 'CHGSGN' CHECKS SIGN N OF HL AND B UNCONDITIONALLY.
;
; 'CKHLDE' CHECKS SIGN OF HL AND DE.  IF DIFFERENT, HL AND DE
; ARE INTERCHANGED.  IF SAME SIGN, NOT INTERCHANGED.  EITHER
; CASE, HL DE ARE THEN COMPARED TO SET THE FLAGS.
;*************************************************************

DIVIDE:
        PUSH HL                         ;*** DIVIDE ***
        LD L,H                          ;DIVIDE H BY DE
        LD H,00H
        CALL DV1
        LD B,C                          ;SAVE RESULT IN B
        LD A,L                          ;(REMAINDER+L)/DE
        POP HL
        LD H,A
DV1:
        LD C,0FFH                       ;RESULT IN C
DV2:
        INC C                           ;DUMB ROUTINE
        CALL SUBDE                      ;DIVIDE BY SUBTRACT
        JR NC,DV2                       ;AND COUNT
        ADD HL,DE
        RET
SUBDE:
        LD A,L                          ;*** SUBDE ***
        SUB E                           ;SUBSTRACT DE FROM
        LD L,A                          ;HL
        LD A,H
        SBC A,D
        LD H,A
        RET
CHKSGN:
        LD A,H                          ;*** CHKSGN ***
        OR A                            ;CHECK SIGN OF HL
        RET P
CHGSGN:
        LD A,H                          ;*** CHGSGN ***
        PUSH AF
        CPL                             ;CHANGE SIGN OF HL
        LD H,A
        LD A,L
        CPL
        LD L,A
        INC HL
        POP AF
        XOR H
        JP P,QHOW
        LD A,B                          ;AND ALSO FLIP B
        XOR 80H
        LD B,A
        RET
CKHLDE:
        LD A,H                          ;SAME SIGN?
        XOR D                           ;YES, COMPARE
        JP P,CK1                        ;NO, XCHANGE AND COMP
        EX DE,HL
CK1:
        RST 20H
        RET
;*************************************************************
;
; *** SETVAL *** FIN *** ENDCHK *** & ERROR (& FRIENDS) ***
;
; "SETVAL" EXPECTS A VARIABLE, FOLLOWED BY AN EQUAL SIGN AND
; THEN AN EXPR.  IT EVALUATES THE EXPR. AND SET THE VARIABLE
; TO THAT VALUE.
;
; "FIN" CHECKS THE END OF A COMMAND.  IF IT ENDED WITH ";",
; EXECUTION CONTINUES.  IF IT ENDED WITH A CR, IT FINDS THE
; NEXT LINE AND CONTINUE FROM THERE.
;
; "ENDCHK" CHECKS IF A COMMAND IS ENDED WITH CR.  THIS IS
; REQUIRED IN CERTAIN COMMANDS.  (GOTO, RETURN, AND STOP ETC.)
;
; "ERROR" PRINTS THE STRING POINTED BY DE (AND ENDS WITH CR).
; IT THEN PRINTS THE LINE POINTED BY 'CURRNT' WITH A "?"
; INSERTED AT WHERE THE OLD TEXT POINTER (SHOULD BE ON TOP
; OF THE STACKB) POINTS TO.  EXECUTION OF TB IS STOPPED
; AND TBI IS RESTARTED.  HOWEVER, IF 'CURRNT' -> ZERO
; (INDICATING A DIRECT COMMAND), THE DIRECT COMMAND IS NOT
; PRINTED.  AND IF 'CURRNT' -> NEGATIVE # (INDICATING 'INPUT'
; COMMAND), THE INPUT LINE IS NOT PRINTED AND EXECUTION IS
; NOT TERMINATED BUT CONTINUED AT 'INPERR'.
;
; RELATED TO 'ERROR' ARE THE FOLLOWING:
; 'QWHAT' SAVES TEXT POINTER IN STACKB AND GET MESSAGE "WHAT?"
; 'AWHAT' JUST GET MESSAGE "WHAT?" AND JUMP TO 'ERROR'.
; 'QSORRY' AND 'ASORRY' DO SAME KIND OF THING.
; 'AHOW' AND 'AHOW' IN THE ZERO PAGE SECTION ALSO DO THIS.
;*************************************************************

SETVAL:
        RST 38H                         ;*** SETVAL ***
        JP C,QWHAT                      ;"WHAT?" NO VARIABLE
        PUSH HL                         ;SAVE ADDRESS OF VAR.
        RST 08H                         ;PASS "=" SIGN
        DB '='
        DB SV1-$-1
        RST 18H                         ;EVALUATE EXPR.
        LD B,H                          ;VALUE IS IN BC NOW
        LD C,L
        POP HL                          ;GET ADDRESS
        LD (HL),C                       ;SAVE VALUE
        INC HL
        LD (HL),B
        RET
SV1:
        JP QWHAT                        ;NO "=" SIGN
FIN:
        RST 08H                         ;*** FIN ***
        DB 3BH
        DB FI1-$-1
        POP AF                          ;";", PURGE RET. ADDR.
        JP RUNSML                       ;CONTINUE SAME LINE
FI1:
        RST 08H                         ;NOT ";", IS IT CR?
        DB CR
        DB FI2-$-1
        POP AF                          ;YES, PURGE RET. ADDR.
        JP RUNNXL                       ;RUN NEXT LINE
FI2:
        RET                             ;ELSE RETURN TO CALLER
ENDCHK:
        RST 28H                         ;*** ENDCHK ***
        CP CR                           ;END WITH CR?
        RET Z                           ;OK, ELSE SAY: "WHAT?"
QWHAT:
        PUSH DE                         ;*** QWHAT ***
AWHAT:
        LD DE,WHAT                      ;*** AWHAT ***
ERROR_ROUTINE:
        SUB A                           ;*** ERROR ***
        CALL PRTSTG                     ;PRINT 'WHAT?', 'HOW?'
        POP DE                          ;OR 'SORRY'
        LD A,(DE)                       ;SAVE THE CHARACTER
        PUSH AF                         ;AT WHERE OLD DE ->
        SUB A                           ;AND PUT A 0 THERE
        LD (DE),A
        LD HL,(CURRNT)                  ;GET CURRENT LINE #
        PUSH HL
        LD A,(HL)                       ;CHECK THE VALUE
        INC HL
        OR (HL)
        POP DE
        JP Z,RSTART                     ;IF ZERO, JUST RESTART
        LD A,(HL)                       ;IF NEGATIVE,
        OR A
        JP M,INPERR                     ;REDO INPUT
        CALL PRTLN                      ;ELSE PRINT THE LINE
        DEC DE                          ;UPTO WHERE THE 0 IS
        POP AF                          ;RESTORE THE CHARACTER
        LD (DE),A
        LD A,3FH                        ;PRINT A "?"
        RST 10H
        SUB A                           ;AND THE REST OF THE
        CALL PRTSTG                     ;LINE
        JP RSTART                       ;THEN RESTART
QSORRY:
        PUSH DE                         ;*** QSORRY ***
ASORRY:
        LD DE,SORRY                     ;*** ASORRY ***
        JR ERROR_ROUTINE
;*************************************************************
;
; *** GETLN *** FNDLN (& FRIENDS) ***
;
; 'GETLN' READS A INPUT LINE INTO 'BUFFER'.  IT FIRST PROMPT
; THE CHARACTER IN A (GIVEN BY THE CALLER), THEN IT FILLS
; THE BUFFER AND ECHOS.  IT IGNORES LF'S AND NULLS, BUT STILL
; ECHOS THEM BACK.  RUB-OUT IS USED TO CAUSE IT TO DELETE
; THE LAST CHARACTER (IF THERE IS ONE), AND ALT-MOD IS USED TO
; CAUSE IT TO DELETE THE WHOLE LINE AND START IT ALL OVER.
; CR SIGNALS THE END OF A LINE, AND CAUSE 'GETLN' TO RETURN.
;
; 'FNDLN' FINDS A LINE WITH A GIVEN LINE # (IN HL) IN THE
; TEXT SAVE AREA.  DE IS USED AS THE TEXT POINTER.  IF THE
; LINE IS FOUND, DE WILL POINT TO THE BEGINNING OF THAT LINE
; (I.E., THE LOW BYTE OF THE LINE #), AND FLAGS ARE NC & Z.
; IF THAT LINE IS NOT THERE AND A LINE WITH A HIGHER LINE #
; IS FOUND, DE POINTS TO THERE AND FLAGS ARE NC & NZ.  IF
; WE REACHED THE END OF TEXT SAVE AREA AND CANNOT FIND THE
; LINE, FLAGS ARE C & NZ.
; 'FNDLN' WILL INITIALIZE DE TO THE BEGINNING OF THE TEXT SAVE
; AREA TO START THE SEARCH.  SOME OTHER ENTRIES OF THIS
; ROUTINE WILL NOT INITIALIZE DE AND DO THE SEARCH.
; 'FNDLNP' WILL START WITH DE AND SEARCH FOR THE LINE #.
; 'FNDNXT' WILL BUMP DE BY 2, FIND A CR AND THEN START SEARCH.
; 'FNDSKP' USE DE TO FIND A CR, AND THEN START SEARCH.
;*************************************************************

GETLN:
        RST 10H                         ;*** GETLN ***
        LD DE,BUFFER                    ;PROMPT AND INIT.
GL1:
        CALL CHKIO                      ;CHECK KEYBOARD
        JR Z,GL1                        ;NO INPUT, WAIT
        CP 7FH                          ;DELETE LAST CHARACTER?
        JR Z,GL3                        ;YES
        RST 10H                         ;INPUT, ECHO BACK
        CP 0AH                          ;IGNORE LF
        JR Z,GL1
        OR A                            ;IGNORE NULL
        JR Z,GL1
        CP 7DH                          ;DELETE THE WHOLE LINE?
        JR Z,GL4                        ;YES
        LD (DE),A                       ;ELSE SAVE INPUT
        INC DE                          ;AND BUMP POINTER
        CP 0DH                          ;WAS IT CR
        RET Z                           ;YES, END OF LINE
        LD A,E                          ;ELSE MORE FREE ROOM?
        CP BUFEND AND 0FFH
        JR NZ,GL1                       ;YES, GET NEXT INPUT
GL3:
        LD A,E                          ;DELETE LAST CHARACTER
        CP BUFFER AND 0FFH              ;BUT DO WE HAVE ANY?
        JR Z,GL4                        ;NO, REDO WHOLE LINE
        DEC DE                          ;YES, BACKUP POINTER
        LD A,5CH                        ;AND ECHO A BACK-SLASH
        RST 10H
        JR GL1                          ;GO GET NEXT INPUT
GL4:
        CALL CRLF                       ;REDO ENTIRE LINE
        LD A,05EH                       ;CR, LF AND UP-ARROW
        JR GETLN
FNDLN:
        LD A,H                          ;*** FNDLN ***
        OR A                            ;CHECK SIGN OF HL
        JP M,QHOW                       ;IT CANNOT BE -
        LD DE,TXTBGN                    ;INIT TEXT POINTER
FNDLP:                                  ;*** FDLNP ***
FL1:
        PUSH HL                         ;SAVE LINE #
        LD HL,(TXTUNF)                  ;CHECK IF WE PASSED END
        DEC HL
        RST 20H
        POP HL                          ;GET LINE # BACK
        RET C                           ;C,NZ PASSED END
        LD A,(DE)                       ;WE DID NOT, GET BYTE 1
        SUB L                           ;IS THIS THE LINE?
        LD B,A                          ;COMPARE LOW ORDER
        INC DE
        LD A,(DE)                       ;GET BYTE 2
        SBC A,H                         ;COMPARE HIGH ORDER
        JR C,FL2                        ;NO, NOT THERE YET
        DEC DE                          ;ELSE WE EITHER FOUND
        OR B                            ;IT, OR IT IS NOT THERE
        RET                             ;NC,Z;FOUND, NC,NZ:NO
FNDNXT:                                 ;*** FNDNXT ***
        INC DE                          ;FIND NEXT LINE
FL2:
        INC DE                          ;JUST PASSED BYTE 1 & 2
FNDSKP:
        LD A,(DE)                       ;*** FNDSKP ***
        CP CR                           ;TRY TO FIND CR
        JR NZ,FL2                       ;KEEP LOOKING
        INC DE                          ;FOUND CR, SKIP OVER
        JR FL1                          ;CHECK IF END OF TEXT
;*************************************************************
;
; *** PRTSTG *** QTSTG *** PRTNUM *** & PRTLN ***
;
; 'PRTSTG' PRINTS A STRING POINTED BY DE.  IT STOPS PRINTING
; AND RETURNS TO CALLER WHEN EITHER A CR IS PRINTED OR WHEN
; THE NEXT BYTE IS THE SAME AS WHAT WAS IN A (GIVEN BY THE
; CALLER).  OLD A IS STORED IN B, OLD B IS LOST.
;
; 'QTSTG' LOOKS FOR A BACK-ARROW, SINGLE QUOTE, OR DOUBLE
; QUOTE.  IF NONE OF THESE, RETURN TO CALLER.  IF BACK-ARROW,
; OUTPUT A CR WITHOUT A LF.  IF SINGLE OR DOUBLE QUOTE, PRINT
; THE STRING IN THE QUOTE AND DEMANDS A MATCHING UNQUOTE.
; AFTER THE PRINTING THE NEXT 3 BYTES OF THE CALLER IS SKIPPED
; OVER (USUALLY A JUMP INSTRUCTION.
;
; 'PRTNUM' PRINTS THE NUMBER IN HL.  LEADING BLANKS ARE ADDED
; IF NEEDED TO PAD THE NUMBER OF SPACES TO THE NUMBER IN C.
; HOWEVER, IF THE NUMBER OF DIGITS IS LARGER THAN THE # IN
; C, ALL DIGITS ARE PRINTED ANYWAY.  NEGATIVE SIGN IS ALSO
; PRINTED AND COUNTED IN, POSITIVE SIGN IS NOT.
;
; 'PRTLN' PRINTS A SAVED TEXT LINE WITH LINE # AND ALL.
;*************************************************************

PRTSTG:
        LD B,A                          ;*** PRTSTG ***
PS1:
        LD A,(DE)                       ;GET A CHARACTER
        INC DE                          ;BUMP POINTER
        CP B                            ;SAME AS OLD A?
        RET Z                           ;YES, RETURN
        RST 10H                         ;NO, NEXT
        CP CR                           ;WAS IT A CR?
        JR NZ,PS1                       ;NO, NEXT
        RET                             ;YES, RETURN
QTSTG:
        RST 08H                         ;*** QTSTG ***
        DB '"'
        DB QT3-$-1
        LD A,22H                        ;IT IS A "
QT1:
        CALL PRTSTG                     ;PRINT UNTIL ANOTHER
        CP CR                           ;WAS LAST ONE A CR?
        POP HL                          ;RETURN ADDRESS
        JP Z,RUNNXL                     ;WAS CR, RUN NEXT LINE
QT2:
        INC HL                          ;SKIP 3 BYTES ON RETURN
        INC HL
        ;INC HL                         ;skip due to relative jumps
                                        ;suggested by Nick Brok: Fixed
        JP (HL)                         ;RETURN
QT3:
        RST 08H                         ;IS IT A '?
        DB 27H
        DB QT4-$-1
        LD A,27H                        ;YES, DO THE SAME
        JR QT1                          ;AS IN "
QT4:
        RST 08H                         ;IS IT BACK-ARROW?
        DB 5FH
        DB QT5-$-1
        LD A,8DH                        ;YES, CR WITHOUT LF
        RST 10H                         ;DO IT TWICE TO GIVE
        RST 10H                         ;TTY ENOUGH TIME
        POP HL                          ;RETURN ADDRESS
        JR QT2
QT5:
        RET                             ;NONE OF ABOVE
;
PRTNUM:
        LD B,00H                        ;*** PRTNUM ***
        CALL CHKSGN                     ;CHECK SIGN
        JP P,PN1                        ;NO SIGN
        LD B,'-'                        ;B=SIGN
        DEC C                           ;'-' TAKES SPACE
PN1:
        PUSH DE                         ;SAVE
        LD DE,000AH                     ;DECIMAL
        PUSH DE                         ;SAVE AS FLAG
        DEC C                           ;C=SPACES
        PUSH BC                         ;SAVE SIGN & SPACE
PN2:
        CALL DIVIDE                     ;DIVIDE HL BY 10
        LD A,B                          ;RESULT 0?
        OR C
        JR Z,PN3                        ;YES, WE GOT ALL
        EX (SP),HL                      ;NO, SAVE REMAINDER
        DEC L                           ;AND COUNT SPACE
        PUSH HL                         ;HL IS OLD BC
        LD H,B                          ;MOVE RESULT TO BC
        LD L,C
        JR PN2                          ;AND DIVIDE BY 10
PN3:
        POP BC                          ;WE GOT ALL DIGITS IN
PN4:
        DEC C                           ;THE STACKB
        LD A,C                          ;LOOK AT SPACE COUNT
        OR A
        JP M,PN5                        ;NO LEADING BLANKS
        LD A,20H                        ;LEADING BLANKS
        RST 10H
        JR PN4                          ;MORE?
PN5:
        LD A,B                          ;PRINT SIGN
        OR A
        CALL NZ,0010H
        LD E,L                          ;LAST REMAINDER IN E
PN6:
        LD A,E                          ;CHECK DIGIT IN E
        CP 0AH                          ;10 IS FLAG FOR NO MORE
        POP DE
        RET Z                           ;IF SO, RETURN
        ADD A,30H                       ;ELSE, CONVERT TO ASCII
        RST 10H                         ;PRINT THE DIGIT
        JR PN6                          ;GO BACK FOR MORE
PRTLN:
        LD A,(DE)                       ;*** PRTLN ***
        LD L,A                          ;LOW ORDER LINE #
        INC DE
        LD A,(DE)                       ;HIGH ORDER
        LD H,A
        INC DE
        LD C,04H                        ;PRINT 4 DIGIT LINE #
        CALL PRTNUM
        LD A,20H                        ;FOLLOWED BY A BLANK
        RST 10H
        SUB A                           ;AND THEN THE NEXT
        CALL PRTSTG
        RET
;*************************************************************
;
; *** MVUP *** MVDOWN *** POPA *** & PUSHA ***
;
; 'MVUP' MOVES A BLOCK UP FROM WHERE DE-> TO WHERE BC-> UNTIL
; DE = HL
;
; 'MVDOWN' MOVES A BLOCK DOWN FROM WHERE DE-> TO WHERE HL->
; UNTIL DE = BC
;
; 'POPA' RESTORES THE 'FOR' LOOP VARIABLE SAVE AREA FROM THE
; STACKB
;
; 'PUSHA' STACKBS THE 'FOR' LOOP VARIABLE SAVE AREA INTO THE
; STACKB
;*************************************************************

MVUP:
        RST 20H                         ;*** MVUP ***
        RET Z                           ;DE = HL, RETURN
        LD A,(DE)                       ;GET ONE BYTE
        LD (BC),A                       ;MOVE IT
        INC DE                          ;INCREASE BOTH POINTERS
        INC BC
        JR MVUP                         ;UNTIL DONE
MVDOWN:
        LD A,B                          ;*** MVDOWN ***
        SUB D                           ;TEST IF DE = BC
        JP NZ,MD1                       ;NO, GO MOVE
        LD A,C                          ;MAYBE, OTHER BYTE?
        SUB E
        RET Z                           ;YES, RETURN
MD1:
        DEC DE                          ;ELSE MOVE A BYTE
        DEC HL                          ;BUT FIRST DECREASE
        LD A,(DE)                       ;BOTH POINTERS AND
        LD (HL),A                       ;THEN DO IT
        JR MVDOWN                       ;LOOP BACK
POPA:
        POP BC                          ;BC = RETURN ADDR.
        POP HL                          ;RESTORE LOPVAR, BUT
        LD (LOPVAR),HL                  ;=0 MEANS NO MORE
        LD A,H
        OR L
        JR Z,PP1                        ;YEP, GO RETURN
        POP HL                          ;NOP, RESTORE OTHERS
        LD (LOPINC),HL
        POP HL
        LD (LOPLMT),HL
        POP HL
        LD (LOPLN),HL
        POP HL
        LD (LOPPT),HL
PP1:
        PUSH BC                         ;BC = RETURN ADDR.
        RET
PUSHA:
        LD HL,STKLMT                    ;*** PUSHA ***
        CALL CHGSGN
        POP BC                          ;BC=RETURN ADDRESS
        ADD HL,SP                       ;IS STACKB NEAR THE TOP?
        JP NC,QSORRY                    ;YES, SORRY FOR THAT
        LD HL,(LOPVAR)                  ;ELSE SAVE LOOP VAR'S
        LD A,H                          ;BUT IF LOPVAR IS 0
        OR L                            ;THAT WILL BE ALL
        JR Z,PU1
        LD HL,(LOPPT)                   ;ELSE, MORE TO SAVE
        PUSH HL
        LD HL,(LOPLN)
        PUSH HL
        LD HL,(LOPLMT)
        PUSH HL
        LD HL,(LOPINC)
        PUSH HL
        LD HL,(LOPVAR)
PU1:
        PUSH HL
        PUSH BC                         ;BC = RETURN ADDR.
        RET
;*************************************************************
;
; *** OUTC *** & CHKIO ***
;
; THESE ARE THE ONLY I/O ROUTINES IN TBI.
; 'OUTC' IS CONTROLLED BY A SOFTWARE SWITCH 'OCSW'.  IF OCSW=0
; 'OUTC' WILL JUST RETURN TO THE CALLER.  IF OCSW IS NOT 0,
; IT WILL OUTPUT THE BYTE IN A.  IF THAT IS A CR, A LF IS ALSO
; SEND OUT.  ONLY THE FLAGS MAY BE CHANGED AT RETURN. ALL REG.
; ARE RESTORED.
;
; 'CHKIO' CHECKS THE INPUT.  IF NO INPUT, IT WILL RETURN TO
; THE CALLER WITH THE Z FLAG SET.  IF THERE IS INPUT, Z FLAG
; IS CLEARED AND THE INPUT BYTE IS IN A.  HOWEVER, IF THE
; INPUT IS A CONTROL-O, THE 'OCSW' SWITCH IS COMPLIMENTED, AND
; Z FLAG IS RETURNED.  IF A CONTROL-C IS READ, 'CHKIO' WILL
; RESTART TBI AND DO NOT RETURN TO THE CALLER.
;*************************************************************

INIT:
        CALL SERIAL_INIT		;INITIALIZE THE SERIAL PORT
        LD D,03H                        ;3X LINE FEEDS
PATLOP:
        CALL CRLF
        DEC D
        JR NZ,PATLOP
        SUB A
        LD DE,MSG1
        CALL PRTSTG
        LD DE,MSG2
        CALL PRTSTG
        LD DE,MSG3
        CALL PRTSTG
        LD HL,START
        LD (RANPNT),HL
        LD HL,TXTBGN
        LD (TXTUNF),HL
        JP RSTART
OUTC:
        JR NZ,OUTC2                     ;IT IS ON
        POP AF                          ;IT IS OFF
        RET                             ;RESTORE AF AND RETURN
OUTC2:
        CALL TX_RDY                     ;SEE IF TRANSMIT IS AVAILABLE
        POP AF                          ;RESTORE THE REGISTER
        OUT (SerialPort),A		;SEND THE BYTE
        CP CR
        RET NZ
        LD A,LF
        RST 10H
        LD A,CR
        RET
CHKIO:
        CALL RX_RDY                     ;CHECK IF CHARACTER AVAILABLE
        RET Z                           ;RETURN IF NO CHARACTER AVAILABLE

        PUSH BC                         ;IF IT'S A LF, IGNORE AND RETURN
        LD B,A                          ; AS IF THERE WAS NO CHARACTER.
        SUB LF
        JR Z,CHKIO2
        LD A,B                          ;OTHERWISE RESTORE 'A' AND 'BC'
        POP BC                          ; AND CONTINUE ON.

        CP 0FH                          ;IS IT CONTROL-0?
        JR NZ,CI1                       ;NO, MORE CHECKING
        LD A,(OCSW)                     ;CONTROL-0 FLIPS OCSW
        CPL                             ;ON TO OFF, OFF TO ON
        LD (OCSW),A
        JR CHKIO                        ;GET ANOTHER INPUT
CHKIO2:
        LD A,00H                        ;CLEAR A
        OR A                            ;ZET THE Z-FLAG
        POP BC                          ;RESTORE THE 'BC' PAIR
        RET                             ;RETURN WITH 'Z' SET.
CI1:
        CP 03H                          ;IS IT CONTROL-C?
        RET NZ                          ;NO, RETURN "NZ"
        JP RSTART                       ;YES, RESTART TBI
;
MSG1:
        DB      ESC,"[2J",ESC,"[H"
        DB      'Z80 TinyBASIC 2.5g Patch 2',CR
MSG2:   DB      'Ported by Doug Gabbard, 2017',CR
MSG3:
        DB      LF,LF,'HELP - New Instructions',LF,LF,CR
;*************************************************************
;
; *** TABLES *** DIRECT *** & EXEC ***
;
; THIS SECTION OF THE CODE TESTS A STRING AGAINST A TABLE.
; WHEN A MATCH IS FOUND, CONTROL IS TRANSFERED TO THE SECTION
; OF CODE ACCORDING TO THE TABLE.
;
; AT 'EXEC', DE SHOULD POINT TO THE STRING AND HL SHOULD POINT
; TO THE TABLE-1.  AT 'DIRECT', DE SHOULD POINT TO THE STRING.
; HL WILL BE SET UP TO POINT TO TAB1-1, WHICH IS THE TABLE OF
; ALL DIRECT AND STATEMENT COMMANDS.
;
; A '.' IN THE STRING WILL TERMINATE THE TEST AND THE PARTIAL
; MATCH WILL BE CONSIDERED AS A MATCH.  E.G., 'P.', 'PR.',
; 'PRI.', 'PRIN.', OR 'PRINT' WILL ALL MATCH 'PRINT'.
;
; THE TABLE CONSISTS OF ANY NUMBER OF ITEMS.  EACH ITEM
; IS A STRING OF CHARACTERS WITH BIT 7 SET TO 0 AND
; A JUMP ADDRESS STORED HI-LOW WITH BIT 7 OF THE HIGH
; BYTE SET TO 1.
;
; END OF TABLE IS AN ITEM WITH A JUMP ADDRESS ONLY.  IF THE
; STRING DOES NOT MATCH ANY OF THE OTHER ITEMS, IT WILL
; MATCH THIS NULL ITEM AS DEFAULT.
;*************************************************************

TAB1:                                   ;DIRECT COMMANDS
        DB 'HELP'                       ;ADDED HELP MENU
        DWA HELP_CMDS
        DB 'LIST'
        DWA LIST
        DB 'NEW'
        DWA NEW
        DB 'RUN'
        DWA RUN

TAB2:                                   ;DIRECT/STATEMENT

        DB 'CALL'
        DWA CALL_MCODE
        DB 'CLS'                        ;ADDED CLS CMD
        DWA CLSB
        DB 'DELAY'                      ;ADDED DELAY CMD
        DWA DELAYB
        DB 'FOR'
        DWA FOR
        DB 'GOSUB'
        DWA GOSUB
        DB 'GOTO'
        DWA GOTO
        DB 'IF'
        DWA IFF
        DB 'INPUT'
        DWA INPUT
        DB 'IN'                         ;ADDED IN CMD
        DWA INB
        DB 'LET'
        DWA LET
        DB 'NEXT'
        DWA NEXT
        DB 'OUT'                        ;ADDED OUT CMD
        DWA OUTB
        DB 'PEEK'                       ;ADDED PEEK
        DWA PEEK
        DB 'POKE'                       ;ADDED POKE
        DWA POKE
        DB 'PRINT'
        DWA PRINT
        DB 'REM'
        DWA REM
        DB 'RETURN'
        DWA RETURN
        DB 'STOP'
        DWA STOP
        DWA DEFLT

TAB4:                                   ;FUNCTIONS
        DB 'ABS'
        DWA ABS
        DB 'RND'
        DWA RND
        DB 'SIZE'
        DWA SIZE
        DWA XP40
TAB5:                                   ;"TO" IN "FOR"
        DB 'TO'
        DWA FR1
        DWA QWHAT
TAB6:                                   ;"STEP" IN "FOR"
        DB 'STEP'
        DWA FR2
        DWA FR3
TAB8:                                   ;RELATION OPERATORS
        DB '>='
        DWA XP11
        DB '#'
        DWA XP12
        DB '>'
        DWA XP13
        DB '='
        DWA XP15
        DB '<='
        DWA XP14
        DB '<'
        DWA XP16
        DWA XP17
DIRECT: LD HL,TAB1-1                   ;*** DIRECT ***
EXEC:                                   ;*** EXEC ***
EX0:    RST 28H                         ;IGNORE LEADING BLANKS
        PUSH DE                         ;SAVE POINTER
EX1:
        LD A,(DE)                       ;IF FOUND '.' IN STRING
        INC DE                          ;BEFORE ANY MISMATCH
        CP 23H                          ;WE DECLARE A MATCH
        JR Z,EX3
        INC HL                          ;HL->TABLE
        CP (HL)                         ;IF MATCH, TEST NEXT
        JR Z,EX1
        LD A,7FH                        ;ELSE SEE IF BIT 7
        DEC DE                          ;OF TABLE IS SET, WHICH
        CP (HL)                         ;IS THE JUMP ADDR. (HI)
        JR C,EX5                        ;C:YES, MATCHED
EX2:
        INC HL                          ;NC:NO, FIND JUMP ADDR.
        CP (HL)
        JR NC,EX2
        INC HL                          ;BUMP TO NEXT TAB. ITEM
        POP DE                          ;RESTORE STRING POINTER
        JR EX0                          ;TEST AGAINST NEXT ITEM
EX3:
        LD A,7FH                        ;PARTIAL MATCH, FIND
EX4:
        INC HL                          ;JUMP ADDR., WHICH IS
        CP (HL)                         ;FLAGGED BY BIT 7
        JR NC,EX4
EX5:
        LD A,(HL)                       ;LOAD HL WITH THE JUMP
        INC HL                          ;ADDRESS FROM THE TABLE
        LD L,(HL)
        AND 7FH                         ;MASK OFF BIT 7
        LD H,A
        POP AF                          ;CLEAN UP THE GABAGE
        JP (HL)                         ;AND WE GO DO IT


;*************************************************************
;  *** TinyBASIC Expansion ***
;
;   *** QUIT *** INB *** OUTB *** CLSB ***
;   *** DELAYB *** PEEK *** POKE ***
;
;  INB IS THE ROUTINE FOR READING THE VALUE OF A PORT AND
;   ASSIGNING IT TO A VARIABLE.
;
;  OUTB IS THE ROUTINE FOR READIGN THE VALUE OF A VARIABLE AND
;   WRITING IT TO A HARDWARE PORT.
;
;  CLSB IS A ROUTINE TO CLEAR THE SCREEN.
;
;  DELAYB IS A ROUTINE DESIGNED TO GIVE APPROXIMATELY 2ms DELAY
;   AT 6MHZ.
;
;  PEEK IS A ROUTINE TO READ THE VALUE OF A MEMORY LOCATION
;   AND STORE THAT VALUE IN A VARIABLE.
;
;  POKE IS A ROUTINE USED TO READ A VARIABLE, AND WRITE THE
;   INFORMATION INTO A MEMORY LOCATION.
;
;  CALL_MCODE IS A ROUTINE TO EXECUTE MACHINE CODE, AND CAN
;    RETURN A TWO BYTE VARIABLE BACK TO 'HL'.
;*************************************************************

INB:                                    ;'IN' ROUTINE
        PUSH AF                         ;SAVE THE REGISTERS
        PUSH BC
INB2:
        INC DE
        LD A,(DE)
        LD B,SPACE
        CP B
        JR Z,INB2                      ;IF IT'S NOT A SPACE GET THE LOCATION
INB3:
        CALL GET_HEX
        LD C,A                          ;PORT IS NOW IN 'C'.
INB4:
        INC DE
        LD A,(DE)
        LD B,','                        ; COMPARE COMA
        CP B
        JR Z,INB4
        LD B,' '                        ; COMPARE SPACE
        CP B
        JR Z,INB4
        LD B,'='
        CP B
        JR Z,INB4

        LD B,40H                        ;IF NOT IT IS VARIABLE
        SUB B                           ;ADJUST FOR MEMORY LOCATION

        LD HL,VARBGN                    ;COMPUTE ADDRESS OF
        RLCA                            ;THAT VARIABLE
        ADD A,L                         ;AND RETURN IT IN HL
        LD L,A                          ;WITH C FLAG CLEARED
        LD A,00H
        ADC A,H
        LD H,A

        IN A,(C)                        ;GET BYTE
        LD (HL),A                       ;STORE IT IN THE VARIALBLE LOCATION
        INC HL                          ;PAD THE EXTRA MEMORY LOCATION
        LD (HL),00H

        INC DE
        POP BC                          ;RESTORE THE REGISTERS
        POP AF
        JP RUNSML                       ;NEXT LINE
;-------------------------------------------------------------------------------
OUTB:                                   ;'OUT' ROUTINE
        PUSH AF
        PUSH BC
OUTB2:
        INC DE
        LD A,(DE)
        LD B,SPACE
        CP B
        JR Z,OUTB2
OUTB3:
        CALL GET_HEX
        PUSH AF                         ;PORT IS IN THE STACK
OUTB4:
        INC DE
        LD A,(DE)
        LD B,','                        ; COMPARE COMA
        CP B
        JR Z,OUTB4
        LD B,' '                        ; COMPARE SPACE
        CP B
        JR Z,OUTB4
        LD B,'='
        CP B
        JR Z,OUTB4

        LD B,40H                        ;IF NOT IT IS VARIABLE
        SUB B                           ;ADJUST FOR MEMORY LOCATION

        LD HL,VARBGN                    ;COMPUTE ADDRESS OF
        RLCA                            ;THAT VARIABLE
        ADD A,L                         ;AND RETURN IT IN HL
        LD L,A                          ;WITH C FLAG CLEARED
        LD A,00H
        ADC A,H
        LD H,A                          ;VARIABLE LOCATION IN HL

        POP AF                          ;PORT BACK IN 'A'
        LD C,A                          ;PORT IS NOW IN C
        LD A,(HL)                       ;Load the value from memory into 'A'

        OUT (C),A                       ;WRITE THE BYTE TO THE PORT

        POP BC                          ;RESTORE REGISTERS
        POP AF

        INC DE
        JP RUNSML
;-------------------------------------------------------------------------------

CLSB:                                   ;CLS ROUTINE FOR BASIC
        PUSH AF
        PUSH BC
        PUSH DE
        LD DE,CLSB_MSG
        CALL PRTSTG
        POP DE
        POP BC
        POP AF
        INC DE
        JP RUNNXL
CLSB_MSG:
        DB      ESC,"[2J",ESC,"[H",CR
;-------------------------------------------------------------------------------

DELAYB:
        PUSH AF
        PUSH BC
        PUSH DE
        PUSH HL

        CALL MILLI_DLY
        POP HL
        POP DE
        POP BC
        POP AF
        INC DE
        JP RUNNXL
;-------------------------------------------------------------------------------
PEEK:
        PUSH AF                         ;SAVE THE REGISTERS
        PUSH BC
PEEK2:
        INC DE
        LD A,(DE)
        LD B,SPACE
        CP B
        JR Z,PEEK2                      ;IF IT'S NOT A SPACE GET THE LOCATION
PEEK3:
        CALL GET_HEX
        LD H,A
        INC DE
        CALL GET_HEX
        LD L,A                          ;MEMORY LOCATION IN 'HL' NOW.
        LD A,(HL)                       ;GET THE BYTE FROM MEMORY.
        PUSH AF                         ;NOW STORE THE BYTE ON THE STACK.
PEEK4:
        INC DE
        LD A,(DE)
        LD B,','                        ; COMPARE COMA
        CP B
        JR Z,PEEK4
        LD B,' '                        ; COMPARE SPACE
        CP B
        JR Z,PEEK4
        LD B,'='
        CP B
        JR Z,PEEK4

        LD B,40H                        ;IF NOT IT IS VARIABLE
        SUB B                           ;ADJUST FOR MEMORY LOCATION

        LD HL,VARBGN                    ;COMPUTE ADDRESS OF
        RLCA                            ;THAT VARIABLE
        ADD A,L                         ;AND RETURN IT IN HL
        LD L,A                          ;WITH C FLAG CLEARED
        LD A,00H
        ADC A,H
        LD H,A

        POP AF                          ;RESTORE THE BYTE FROM THE STACK
        LD (HL),A                       ;STORE IT IN THE VARIALBLE LOCATION
        INC HL                          ;PAD THE EXTRA MEMORY LOCATION
        LD (HL),00H

        INC DE
        POP BC                          ;RESTORE THE REGISTERS
        POP AF
        JP RUNSML                       ;NEXT LINE
;-------------------------------------------------------------------------------

POKE:                                   ;POKE ROUTINE
        PUSH AF
        PUSH BC
POKE2:
        INC DE
        LD A,(DE)
        LD B,SPACE
        CP B
        JR Z,POKE2
POKE3:
        CALL GET_HEX
        LD H,A
        INC DE
        CALL GET_HEX
        LD L,A                          ;LOCATION NOW 'HL'
        PUSH HL                         ;STORE LOCATION IN STACK.

POKE4:
        INC DE
        LD A,(DE)
        LD B,','                        ; COMPARE COMA
        CP B
        JR Z,POKE4
        LD B,' '                        ; COMPARE SPACE
        CP B
        JR Z,POKE4
        LD B,'='
        CP B
        JR Z,POKE4
        LD B,'('                        ;IS IT HEX?
        CP B
        JR Z,POKE5

        LD B,40H                        ;IF NOT IT IS VARIABLE
        SUB B                           ;ADJUST FOR MEMORY LOCATION

        LD HL,VARBGN                    ;COMPUTE ADDRESS OF
        RLCA                            ;THAT VARIABLE
        ADD A,L                         ;AND RETURN IT IN HL
        LD L,A                          ;WITH C FLAG CLEARED
        LD A,00H
        ADC A,H
        LD H,A                          ;VARIABLE LOCATION IN HL

        ;POP AF                          ;PORT BACK IN 'A'
        ;LD C,A                          ;PORT IS NOW IN C
        LD A,(HL)                       ;Load the value from memory into 'A'

        POP HL                          ;GET THE MEMORY LOCATION BACK
        LD (HL),A
        ;OUT (C),A                       ;WRITE THE BYTE TO THE PORT

        POP BC                          ;RESTORE REGISTERS
        POP AF

        INC DE
        JP RUNSML
POKE5:
        INC DE                          ;NEXT CHARACTER
        LD A,(DE)
        LD B,')'                        ;IS IT THE END OF HEX?
        CP B
        JR Z,POKE6                      ;IF SO, GO TO END
        CALL GET_HEX                    ;IF NOT, GET THE VALUE AND WRITE
        POP HL
        LD (HL),A
        INC HL                          ;NEXT LOCATION TO WRITE
        PUSH HL                         ;STORE THE LOCATION
        JR POKE5                        ;NEXT BYTE.
POKE6:
        POP BC
        POP AF
        INC DE
        JP RUNSML
;-------------------------------------------------------------------------------

CALL_MCODE:
        PUSH AF
        PUSH BC
        PUSH HL
CALL2:
        INC DE
        LD A,(DE)
        LD B,SPACE
        CP B
        JR Z,CALL2
CALL3:
        LD HL,CALL5                     ;SET RETURN VECTOR - I THINK...
        PUSH HL                         ;PLACE IT ON THE STACK FOR RETURN...

        CALL GET_HEX
        LD H,A
        INC DE
        CALL GET_HEX
        LD L,A                          ;LOCATION NOW 'HL'
CALL4:
        PUSH DE                         ;SAVE CURRENT DE LOCATION.
        JP (HL)
CALL5:
        POP HL
        POP DE                          ;KEEPS RETURNING 'WHAT?' ERROR....
        POP BC
        POP AF
        INC DE
        JP RUNSML

;-------------------------------------------------------------------------------
GET_HEX:
        LD A,(DE)
        LD B,A
        INC DE
        LD A,(DE)
        LD C,A
        PUSH DE                         ;SAVE DE LOCATION
        LD D,B                          ;SEND THE ASCII TO CONVERT
        LD E,C
        CALL ASCIIHEX_TO_BYTE           ;BYTE IS RETURNED IN 'A'
        POP DE
        RET

ASCIIHEX_TO_BYTE:
        PUSH BC                 ;SAVE REGISTERS
        LD A,D                  ;LOAD UPPER CHARACTER
        CALL CONVERT_HEX_VAL    ;CONVERT THE CHARACTER
        RLA
        RLA
        RLA
        RLA
        LD B,A                  ;STORE THE FIRST NIBBLE
        LD A,E                  ;GET SECOND CHARACTER
        CALL CONVERT_HEX_VAL    ;CONVERT THE CHARACTER
        ADD A,B                 ;ADD THE TWO NIBBLES
        POP BC
        RET
; CONVERTS THE ASCII CHARACTER IN A TO IT'S HEX VALUE IN A, ERROR RETURNS 0FFH
CONVERT_HEX_VAL:
        CP 'G'                  ;GREATER THAN "F"
        JP P,CONVERT_HEX_ERROR    ;IF SO, ERROR.
        CP '0'                  ;LESS THAN "ZERO"
        JP M,CONVERT_HEX_ERROR    ;IF SO, ERROR.
        CP 03AH                 ;LESS THAN OR EQUAL TO "9"
        JP M,CONVERT_MASK         ;IF SO, CONVERT AND RETURN.
        CP 'A'                  ;LESS THAN "A"
        JP M,CONVERT_HEX_ERROR    ;IF SO, ERROR.
        SUB 037H                ;MUST BE "A" TO "F", CONVERT.
        RET
CONVERT_MASK:
        AND 0FH
        RET
CONVERT_HEX_ERROR:
        LD A,0FFH               ;IF ERROR, RETURN 0FFH
        RET
;-------------------------------------------------------------------------------
MILLI_DLY:                      ;DELAY 1 MILLISECOND @ 6MHZ (ESTIMATED)
        PUSH AF                 ;       THERE IS NO WAY TO REALLY CALCULATE
        PUSH BC                 ;       THIS, AS THE INTERPRETER TAKES TIME.
        LD  BC,0073H           ; 6006 INSTRUCTIONS
MILLI_DLYL:
	DEC BC
	LD  A,C
	OR  B
	JR  NZ,MILLI_DLYL
        POP BC
        POP AF
	RET
;-------------------------------------------------------------------------------
HELP_CMDS:
        PUSH AF
        PUSH BC
        PUSH DE
        LD DE,HELP_CMD_MSG1
        CALL PRTSTG
        LD DE,HELP_CMD_MSG2
        CALL PRTSTG
        LD DE,HELP_CMD_MSG3
        CALL PRTSTG
        LD DE,HELP_CMD_MSG4
        CALL PRTSTG
        LD DE,HELP_CMD_MSG5
        CALL PRTSTG
        LD DE,HELP_CMD_MSG6
        CALL PRTSTG
        LD DE,HELP_CMD_MSG7
        CALL PRTSTG
        LD DE,HELP_CMD_MSG8
        CALL PRTSTG
        POP DE
        POP BC
        POP AF
        INC DE
        ;JP RUNSML
        JP RUNNXL
HELP_CMD_MSG1:
        DB      LF,LF,TAB,'TinyBASIC 2.5g Expanded Instructions',LF,LF,CR
HELP_CMD_MSG2:
        DB      TAB,'OUT PP,V',LF,CR
HELP_CMD_MSG3:
        DB      TAB,'IN PP,V',LF,CR
HELP_CMD_MSG4:
        DB      TAB,'POKE AAAA,V',LF,CR
HELP_CMD_MSG5:
        DB      TAB,'PEEK AAAA,V',LF,CR
HELP_CMD_MSG6:
        DB      TAB,'DELAY',LF,CR
HELP_CMD_MSG7:
        DB      TAB,'CLS',LF,LF,LF,CR
HELP_CMD_MSG8:
        DB      TAB,'PP=HEX PORT    AAAA=HEX ADDR    V=VARIABLE',LF,LF,CR
;-------------------------------------------------------------------------------
;///////////////////////////////////////////////////////////////////////////////
;-------------------------------------------------------------------------------
;COMPUTER SPECIFIC ROUTINES.

;-------------------------------------------------------------------------------
SERIAL_INIT:

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
;-------------------------------------------------------------------------------
TX_RDY:

	; This routine is checking if the Serial Port is ready to send
	; a character.

        PUSH AF

        CALL UART_TOGGLE_OUT1

        CALL UART_CLEAR_DLAB

        TX_RDY_LOOP:
                ;Read transmit register status in line status register (LSR) See page 22
                ;Wait if not empty
                IN A, (UART_LSR)
                AND 60H
                CP 60H
                JP NZ, TX_RDY_LOOP

        ;Write Char to UART
        POP AF

	RET

;-------------------------------------------------------------------------------
RX_RDY:

	; This routine is for checkif if a character is available over
	; serial. If a character is available, it returns to the calling
	; function with the character in 'A' and the Z-flag reset.
	; However, if a character is not available, it returns with the
	; Z-flag set.

        CALL UART_CLEAR_DLAB

        ;Read Line Status Reg
        IN A, (UART_LSR)
        ;If only bit 1 is set then FIFO has new data
        AND 1
        CP 0
        JP Z, RX_RDY_END

        CALL UART_TOGGLE_OUT2
        XOR A
        CP 1
        ;Get next char from data holding register
        IN A, (UART_DHR)

        RX_RDY_END:

        RET
;-------------------------------------------------------------------------------
;///////////////////////////////////////////////////////////////////////////////
;-------------------------------------------------------------------------------
;
LSTROM:                                 ;ALL ABOVE CAN BE ROM
;       ORG  1000H                      ;HERE DOWN MUST BE RAM
        ORG  08000H
        ORG  0FF00H
VARBGN: DS   55                         ;VARIABLE @(0)
BUFFER: DS   64                         ;INPUT BUFFER
BUFEND: DS   1                          ;BUFFER ENDS
STKLMT: DS   1                          ;TOP LIMIT FOR STACKB

