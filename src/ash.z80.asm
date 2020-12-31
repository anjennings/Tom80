;ASH - Aidan's SHell
;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

;TODO:
;Change most DE to HL
;Change eror to check for non-zero values
;Write doesn't seem to write correctly
;Read doesn't read correctly at non-0 values

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

NEWLINE equ 0xA
RETURN equ 0xD
EOT equ 0x3
SPACE equ 0x20
NULL equ 0x0

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

COLOR_FG_BLACK equ "30"
COLOR_FG_RED equ "31"
COLOR_FG_GREEN equ "32"
COLOR_FG_YELLOW equ "33"
COLOR_FG_BLUE equ "34"
COLOR_FG_PURPLE equ "35"
COLOR_FG_CYAN equ "36"
COLOR_FG_WHITE equ "37"

COLOR_BG_BLACK equ "40"
COLOR_BG_RED equ "41"
COLOR_BG_GREEN equ "42"
COLOR_BG_YELLOW equ "43"
COLOR_BG_BLUE equ "44"
COLOR_BG_PURPLE equ "45"
COLOR_BG_CYAN equ "46"
COLOR_BG_WHITE equ "47"

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
    IN A, UART_LCR
    AND 0x7F
    OUT UART_LCR, A
    POP AF
    RET

UART_SET_DLAB:
    PUSH AF
    IN A, UART_LCR
    OR 0x80
    OUT UART_LCR, A
    POP AF
    RET
    
UART_SET_LINE_CONTROL:
    PUSH AF
    LD A, 0x3         ;8 Bit word, 1 stop, no parity
    OUT UART_LCR, A
    POP AF
    RET

UART_DISABLE_FIFO:
    PUSH AF
    LD A, 0x6
    OUT UART_IFR, A
    POP AF
    RET

UART_SET_BAUD:
    PUSH AF
    
    ;115200
    LD A, BAUD_DIV_LOW
    OUT UART_DHR, A
    LD A, BAUD_DIV_HIGH
    OUT UART_IER, A
    
    POP AF
    RET

UART_CLEAR_LSR:
    PUSH AF
    ;Clear Line Status Reg Errors (Page 21)
    IN A, UART_LSR
    POP AF
    RET

UART_TOGGLE_OUT1:
    PUSH AF
    IN A, UART_MCR
    XOR 0x4 
    OUT UART_MCR, A
    POP AF
    RET
    
UART_TOGGLE_OUT2:
    PUSH AF
    IN A, UART_MCR
    XOR 0x8 
    OUT UART_MCR, A
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
        IN A, UART_LSR
        
        ;If only bit 1 is set then FIFO has new data
        AND 0x1F
        CP 1
        JP NZ, GETCH_LOOP
        
    ;Get next char from data holding register
    IN A, UART_DHR
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
        CP RETURN
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
        IN A, UART_LSR
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    ;Write Char to UART
    POP AF
    OUT UART_DHR, A
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
        CP EOT
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
        CP RETURN
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
    LD HL, DE
    ;Jump to new, arbitrary location
    JP (HL)
    
    
    EVAL_EXE_FAILURE:
    LD A, 0xFF
    JP EVAL_EXE_EXIT
    
    EVAL_EXE_SUCCESS:
    LD A, 0
    
    EVAL_EXE_EXIT:
    POP DE
    POP HL
    RET

EVAL_READ:
    ;DE is the literal value
    ;HL should not have been modified from before
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
    LD HL, DE
    
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
        LD A, NEWLINE
        CALL PRINTCH
        LD A, RETURN
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
        LD A, SPACE
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
    LD HL, DE
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
.db NEWLINE, RETURN, "ASH v0.2", NEWLINE, RETURN, "(C) 2020 by Aidan Jennings"
.db NEWLINE, RETURN, "ZILOG Z80 32k EEPROM, 32k SRAM",  NEWLINE, RETURN,  "TEXT ONLY", EOT

READY_MSG:
.db NEWLINE, NEWLINE, RETURN, "BOOT PROCESS COMPLETE!", NEWLINE, EOT

SYNTAX_ERROR:
.db NEWLINE, RETURN, "SYNTAX ERROR", NEWLINE, EOT

TOKEN_ERROR:
.db NEWLINE, RETURN, "INVALID TOKEN", NEWLINE, EOT

EXE_ERROR:
.db NEWLINE, RETURN, "EXECUTION ERROR", NEWLINE, EOT

HELP_TEXT:
.db NEWLINE, RETURN, "INSTRUCTIONS : ", NEWLINE, RETURN, "1FFF : 10 - READ 16 BYTES STARTING AT LOCATION 0x1FFF", NEWLINE, RETURN, "1FFF < 10 - WRITE 0x10 TO LOCAITON 0x1FFF", NEWLINE, RETURN, "@1FFF - BEGIN EXECUTION AT LOCATION 0x1FFF", NEWLINE, RETURN, "? - DISPLAY HELP MESSAGE", NEWLINE, EOT

PROMPT:
.db NEWLINE, RETURN, ">>>:", EOT


;////////////////////////////////////////////////////////
;Text Color Change
;////////////////////////////////////////////////////////
COLOR_NORMAL:
.db ASCII_ESC, ASCII_LBR, COLOR_FG_WHITE, ASCII_SEMI, COLOR_BG_BLACK, ASCII_TER, EOT

COLOR_INVERT:
.db ASCII_ESC, ASCII_LBR, COLOR_FG_BLACK, ASCII_SEMI, COLOR_BG_WHITE, ASCII_TER, EOT

COLOR_WARN:
.db ASCII_ESC, ASCII_LBR, COLOR_FG_YELLOW, ASCII_SEMI, COLOR_BG_BLACK, ASCII_TER, EOT

COLOR_ERR:
.db ASCII_ESC, ASCII_LBR, COLOR_FG_RED, ASCII_SEMI, COLOR_BG_BLACK, ASCII_TER, EOT

CLEAR_DISPLAY:
.db ASCII_ESC, ASCII_LBR, "2J", ASCII_TER, EOT

;////////////////////////////////////////////////////////
;Start of Game at 2k
;////////////////////////////////////////////////////////
.org 0x800


