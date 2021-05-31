;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 17218-488c5c6-20210108
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Sat Jan 09 11:21:43 2021


	C_LINE	0,"main.c"

	MODULE	main_c


	INCLUDE "z80_crt0.hdr"


	C_LINE	22,"main.c"
	C_LINE	23,"main.c"
	C_LINE	24,"main.c"
	C_LINE	25,"main.c"
	C_LINE	26,"main.c"
	C_LINE	27,"main.c"
	C_LINE	28,"main.c"
	C_LINE	29,"main.c"
	C_LINE	30,"main.c"
	C_LINE	31,"main.c"
	C_LINE	32,"main.c"
	C_LINE	33,"main.c"
	C_LINE	34,"main.c"
	C_LINE	35,"main.c"
	C_LINE	37,"main.c"
	C_LINE	39,"main.c"
	SECTION	code_compiler

; Function UART_INIT flags 0x00000240 __smallc __z88dk_callee 
; void UART_INIT()
	C_LINE	39,"main.c::UART_INIT"
._UART_INIT
	call	_UART_CLEAR_DLAB
	call	_UART_DISABLE_FIFO
	call	_UART_SET_LINE_CONTROL
	call	_UART_TOGGLE_OUT1
	call	_UART_TOGGLE_OUT2
	call	_UART_CLEAR_LSR
	call	_UART_SET_DLAB
	call	_UART_SET_BAUD
	call	_UART_CLEAR_DLAB
	ret


	C_LINE	53,"main.c::UART_INIT"

; Function UART_CLEAR_LSR flags 0x00000240 __smallc __z88dk_callee 
; void UART_CLEAR_LSR()
	C_LINE	53,"main.c::UART_CLEAR_LSR"
._UART_CLEAR_LSR
    PUSH AF
    IN A, ( 5 )
    POP AF
    RET
	ret


	C_LINE	64,"main.c::UART_CLEAR_LSR"

; Function UART_SET_BAUD flags 0x00000240 __smallc __z88dk_callee 
; void UART_SET_BAUD()
	C_LINE	64,"main.c::UART_SET_BAUD"
._UART_SET_BAUD
    PUSH AF
    LD A,  8 
    OUT ( 0 ), A
    LD A,  0 
    OUT ( 1 ), A
    POP AF
    RET
	ret


	C_LINE	78,"main.c::UART_SET_BAUD"

; Function UART_DISABLE_FIFO flags 0x00000240 __smallc __z88dk_callee 
; void UART_DISABLE_FIFO()
	C_LINE	78,"main.c::UART_DISABLE_FIFO"
._UART_DISABLE_FIFO
    PUSH AF
    LD A, 0x6
    OUT ( 2 ), A
    POP AF
    RET
	ret


	C_LINE	90,"main.c::UART_DISABLE_FIFO"

; Function UART_SET_LINE_CONTROL flags 0x00000240 __smallc __z88dk_callee 
; void UART_SET_LINE_CONTROL()
	C_LINE	90,"main.c::UART_SET_LINE_CONTROL"
._UART_SET_LINE_CONTROL
    PUSH AF
    LD A, 0x3          
    OUT ( 3 ), A
    POP AF
    RET
	ret


	C_LINE	102,"main.c::UART_SET_LINE_CONTROL"

; Function UART_CLEAR_DLAB flags 0x00000240 __smallc __z88dk_callee 
; void UART_CLEAR_DLAB()
	C_LINE	102,"main.c::UART_CLEAR_DLAB"
._UART_CLEAR_DLAB
	push AF
    IN A, ( 3 )
    AND 0x7F
    OUT ( 3 ), A
    POP AF
    RET
	ret


	C_LINE	115,"main.c::UART_CLEAR_DLAB"

; Function UART_SET_DLAB flags 0x00000240 __smallc __z88dk_callee 
; void UART_SET_DLAB()
	C_LINE	115,"main.c::UART_SET_DLAB"
._UART_SET_DLAB
	PUSH AF
    IN A, ( 3 )
    OR 0x80
    OUT ( 3 ), A
    POP AF
    RET
	ret


	C_LINE	129,"main.c::UART_SET_DLAB"

; Function UART_TOGGLE_OUT1 flags 0x00000240 __smallc __z88dk_callee 
; void UART_TOGGLE_OUT1()
	C_LINE	129,"main.c::UART_TOGGLE_OUT1"
._UART_TOGGLE_OUT1
    PUSH AF
    IN A, ( 4 )
    XOR 0x4
    OUT ( 4 ), A
    POP AF
    RET
	ret


	C_LINE	142,"main.c::UART_TOGGLE_OUT1"

; Function UART_TOGGLE_OUT2 flags 0x00000240 __smallc __z88dk_callee 
; void UART_TOGGLE_OUT2()
	C_LINE	142,"main.c::UART_TOGGLE_OUT2"
._UART_TOGGLE_OUT2
    PUSH AF
    IN A, ( 4 )
    XOR 0x8
    OUT ( 4 ), A
    POP AF
    RET
	ret


	C_LINE	159,"main.c::UART_TOGGLE_OUT2"

; Function GETCH flags 0x00000240 __smallc __z88dk_callee 
; char GETCH()
	C_LINE	159,"main.c::GETCH"
._GETCH
    PUSH BC
    CALL _UART_CLEAR_DLAB
    GETCH_LOOP:
        IN A, ( 5 )
        AND 0x1F
        CP 1
        JP NZ, GETCH_LOOP
    IN A, ( 0 )
    CALL _WRITE_BUFFER
    CALL _UART_TOGGLE_OUT2
    GETCH_END:
    POP BC
    RET
	ret


	C_LINE	192,"main.c::GETCH"

; Function WRITE_BUFFER flags 0x00000240 __smallc __z88dk_callee 
; void WRITE_BUFFER()
	C_LINE	192,"main.c::WRITE_BUFFER"
._WRITE_BUFFER
	ret


	C_LINE	217,"main.c::WRITE_BUFFER"

; Function PRINTCH flags 0x00000240 __smallc __z88dk_callee 
; void PRINTCH()
	C_LINE	217,"main.c::PRINTCH"
._PRINTCH
    PUSH AF
    CALL _UART_CLEAR_DLAB
    PRINTCH_LOOP:
        IN A, ( 5 )
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP
    POP AF
    OUT ( 0 ), A
    RET
	ret


	C_LINE	239,"main.c::PRINTCH"

; Function printc flags 0x00000200 __smallc 
; void printc(char c)
; parameter 'char c' at sp+2 size(1)
	C_LINE	239,"main.c::printc"
._printc
	call	_UART_CLEAR_DLAB
	call	_trsmtStatWait
	ld	hl,2	;const
	add	hl,sp
	call	l_gchar
	push	hl
	call	_trsmtc
	ret


	C_LINE	247,"main.c::printc"

; Function trsmtc flags 0x00000240 __smallc __z88dk_callee 
; void trsmtc(char c)
; parameter 'char c' at sp+2 size(1)
	C_LINE	247,"main.c::trsmtc"
._trsmtc
	LD HL, 2
	ADD HL, SP
	LD A, (HL)
	OUT ( 0 ), A
	RET
	pop	bc
	pop	af
	push	bc
	ret


	C_LINE	260,"main.c::trsmtc"

; Function trsmtStatWait flags 0x00000240 __smallc __z88dk_callee 
; void trsmtStatWait()
	C_LINE	260,"main.c::trsmtStatWait"
._trsmtStatWait
	trsmtStatWait_LOOP:
        IN A, ( 5 )
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP
	ret


	C_LINE	273,"main.c::trsmtStatWait"

; Function init flags 0x00000200 __smallc 
; void init()
	C_LINE	273,"main.c::init"
._init
	LD HL, 0x0000
    LD SP, HL
	DI
	call	_UART_INIT
	ret


	C_LINE	287,"main.c::init"

; Function main flags 0x00000000 __stdc 
; int main()
	C_LINE	287,"main.c::main"
._main
	call	_init
	ret



; --- Start of Static Variables ---

	SECTION	bss_compiler
	SECTION	code_compiler


; --- Start of Scope Defns ---

	GLOBAL	_UART_INIT
	GLOBAL	_UART_CLEAR_DLAB
	GLOBAL	_UART_SET_DLAB
	GLOBAL	_UART_SET_LINE_CONTROL
	GLOBAL	_UART_DISABLE_FIFO
	GLOBAL	_UART_SET_BAUD
	GLOBAL	_UART_CLEAR_LSR
	GLOBAL	_UART_TOGGLE_OUT1
	GLOBAL	_UART_TOGGLE_OUT2
	GLOBAL	_GETCH
	GLOBAL	_WRITE_BUFFER
	GLOBAL	_PRINTCH
	GLOBAL	_trsmtc
	GLOBAL	_trsmtStatWait
	GLOBAL	_printc
	GLOBAL	_init
	GLOBAL	_main


; --- End of Scope Defns ---


; --- End of Compilation ---
