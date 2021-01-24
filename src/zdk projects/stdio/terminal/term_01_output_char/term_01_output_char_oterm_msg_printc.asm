SECTION code_driver
SECTION code_driver_terminal_output

PUBLIC term_01_output_char_oterm_msg_printc

term_01_output_char_oterm_msg_printc:

;   * OTERM_MSG_PRINTC
;
;     enter  :  c = ascii code
;               b = 255 if not supplied by iterm (safely ignore)
;               l = absolute x coordinate
;               h = absolute y coordinate
;     can use:  af, bc, de, hl, af'
;
;     Print the char to screen at given character coordinate.

;error implement term_01_output_char_oterm_msg_printc

	
	LD A, '\033'
    CALL PUTCHAR

	LD A, '['
    CALL PUTCHAR
	
	;Put the Y value
	LD A, H
	CALL DIV10
	LD A, D
	CP 0x30
	JP Z, PUT_Y_E
	CALL PUTCHAR
	PUT_Y_E:
	LD A, E
	CALL PUTCHAR
	
	;Put the Semicolon
	LD A, ';'
	CALL PUTCHAR
	
	;Put the X value
	LD A, L
	CALL DIV10
	LD A, D
	CP 0x30
	JP Z, PUT_X_E
	CALL PUTCHAR
	PUT_X_E:
	LD A, E
	CALL PUTCHAR
	
	LD A, 'H'
	CALL PUTCHAR
	
	LD A, C
    CALL PUTCHAR
	ret

	
;Expects A to be value, returns 10s in D, 1s in E
DIV10:
		PUSH AF
		LD D, 0
		LD E, 0
		;Check if 0
		CP 0
		JP Z, DIV10_END
		
	DIV10_LOOP:
		SUB A, 10
		JP C, DIV10_END
		INC D
		JP DIV10_LOOP
	
	DIV10_END:
		ADD A, 10
		LD E, A
		
		;Convert D and E to Char
		LD A, D
		ADD A, 0x31
		LD D, A

		LD A, E
		ADD A, 0x31
		LD E, A
		
		POP AF
		RET
	
;Expects A to be the char
PUTCHAR:

	PUSH AF
	;Clear DLAB
    IN A, (3)
    AND 0x7F
    OUT (3), A
	
	;Print Escape Char
	PRINTCH_LOOP:
        ;Read transmit register status in line status register
        IN A, (5)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

	POP AF
    OUT (0), A

	RET
