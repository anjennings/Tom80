SECTION code_driver
SECTION code_driver_terminal_output

PUBLIC term_01_output_char_oterm_msg_scroll

term_01_output_char_oterm_msg_scroll:

;   * OTERM_MSG_SCROLL
;
;     enter  :   c = number of rows to scroll
;     can use:  af, bc, de, hl
;
;     Scroll the window upward 'c' character rows.
;
; A pointer to a rectangle covering the terminal screen
; can be retrieved with this code:
;
;   ld hl,16
;   call l_offset_ix_de         ; hl = window.rect *
;
; hl+0 = & window.x
; hl+1 = & window.width
; hl+2 = & window.y
; hl+3 = & window.height

;error implement term_01_output_char_oterm_msg_scroll

;Esc[ValueA

;Gets called no matter what character is given
	
	LD A, '\033'
    CALL PUTCHAR

	LD A, '['
    CALL PUTCHAR
	
	LD A, '1'
    CALL PUTCHAR

	LD A, 'S'
    CALL PUTCHAR
	
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