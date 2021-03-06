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

;Valid Instructions
SYM_READ equ ":"
SYM_WRITE equ "<"
SYM_EXE equ "@"
SYM_HELP equ "?"

;/////////////////
;Code Starts HERE
;/////////////////
org 0000h
RESET:
    ;Wait several clocks, then jump directly to MAIN
    NOP
    NOP
    NOP
    NOP
    JP BOOT
    JP BOOT
    JP BOOT
    JP BOOT

;Not exactly a header, but it will show up in a hex dump
HEADER:
.db NEWLINE, "ASH (Aidan's SHell) 2020", NEWLINE, RETURN, EOF

INTERRUPT:
    ;//////////////////
    ;Interrupt Routine
    ;//////////////////
    org 0038h
    NOP
    NOP
    RETI

    ;//The actual execution starts here
BOOT:
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

POSTBOOT:
    ;Print Boot Screen
    LD HL, BOOT_MSG
    CALL WRITE_STR

    ;Print Ready Message
    LD HL, READY_MSG
    CALL WRITE_STR

    ;Set Terminal buffer to 0 
    LD HL, TERM_BUF
    LD A, 0
    LD (HL), A

MAIN_LOOP:
    ;CALL GETCH
    ;CALL EVALUATE_STMT
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

    ;Loop over each char in string
    WRITE_START:
    LD A, (HL)
    CP 0                ;Is it EOF?
    JP Z, WRITE_CLOSE
    CALL PRINTCH
    INC HL
    JP WRITE_START

    WRITE_CLOSE:
    POP HL
    POP AF
    EI
    ret

;Main function to tokenize, parse, and execute user entered expressions
;Assume AF has return values
EVALUATE_STMT:
    PUSH AF

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
        LD HL, TOKEN_ERROR
        CALL WRITE_STR
        JP EVALUATE_STMT_RETURN

    EVALUATE_STMT_SYNTAX_FAIL:
        ;Print syntax error string
        LD HL, SYNTAX_ERROR
        CALL WRITE_STR
        JP EVALUATE_STMT_RETURN
        
    EVALUATE_STMT_EXE_FAIL:
        ;Print error string
        LD HL, EXE_ERROR
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
;Buffer for tokens, first byte is size of buffer
TOKEN_BUF equ 0x8110
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
        CP NEWLINE
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
        CP 0xFF
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
    LD A, 0xFF
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
    LD HL, PARSE_STATE
    LD (HL), STATE_START

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

;STATES:
STATE_START equ 0   ;Start State
STATE_HELP equ 1    ;? Symbol
STATE_EXE equ 2     ;@ Symbol
STATE_LIEX equ 3    ;Literal following @
STATE_LIT equ 4     ;Leftmost literal (branches)
STATE_READ equ 5    ;Read :
STATE_WRITE equ 6   ;Write <
STATE_LITRD equ 7   ;Literal following :
STATE_LITWR equ 8   ;Literal following <

EXE_RAM equ 0x8300
EXE_STATE equ 0x8301
EXE_INC equ 0x8302
EXE_BUF equ 0x8310

EXECUTE_BUFFER:
    PUSH BC
    PUSH DE
    PUSH HL

    ;Set state
    LD HL, EXE_STATE
    LD (HL), STATE_START

    ;Set incrementor
    LD HL, EXE_INC
    LD (HL), 1

    EXECUTE_BUFFER_LOOP:
        ;Pingas

        ;Get incrementor
        LD HL, EXE_INC
        LD A, (HL)

        ;Go to next token
        LD HL, PARSE_BUF
        ADD A, L
        LD L, A

        ;Get token, Save copy to B
        LD A, (HL)
        LD B, A

        ;Check if its the end of the buffer
        CP TOKEN_EF
        CALL Z, EVAL_EOF
        CP 0xFF
        JP Z, EXECUTE_BUFFER_RETUN_SUCCESS

        ;Check if current token is a single literal value
        CP TOKEN_LT
        CALL Z, EVAL_LITERAL
        CP 0xFF
        JP Z, EXECUTE_BUFFER_LOOP

        ;Check if current token is an @ symbol
        CP TOKEN_EX
        CALL Z, EVAL_EXE
        CP 0xFF
        JP Z, EXECUTE_BUFFER_LOOP

        ;Check if current token is an : symbol
        CP TOKEN_RD
        CALL Z, EVAL_READ
        CP 0xFF
        JP Z, EXECUTE_BUFFER_LOOP

        ;Check if current token is an < symbol
        CP TOKEN_WR
        CALL Z, EVAL_WRITE
        CP 0xFF
        JP Z, EXECUTE_BUFFER_LOOP

        ;Check if current token is an ? symbol
        CP TOKEN_HE
        CALL Z, EVAL_HELP
        CP 0xFF
        JP Z, EXECUTE_BUFFER_LOOP

        ;If parser reaches this point there is an invalid token
        LD A, 0xFF
        JP EXECUTE_BUFFER_RETURN

    EXECUTE_BUFFER_RETUN_SUCCESS:
        LD A, 0x00

    EXECUTE_BUFFER_RETURN:
    POP HL
    POP DE
    POP BC
    RET

EVAL_EOF:
    RET

EVAL_LITERAL:
    RET

EVAL_EXE:
    RET

EVAL_READ:
    RET

EVAL_WRITE:
    RET

EVAL_HELP:
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

EXE_ERROR:
.db NEWLINE, RETURN, "EXECUTION ERROR", NEWLINE, RETURN, EOF

PROMPT:
.db RETURN, ">>>:", EOF

org 8001h
;.db "A0:7F", NEWLINE
.db "A8F4<B7", NEWLINE
;.db "@B800"