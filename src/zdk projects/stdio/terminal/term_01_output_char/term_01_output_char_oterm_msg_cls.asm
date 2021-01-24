SECTION code_driver
SECTION code_driver_terminal_output

PUBLIC term_01_output_char_oterm_msg_cls

term_01_output_char_oterm_msg_cls:

;   * OTERM_MSG_CLS
;
;     can use:  af, bc, de, hl
;
;     Clear the window.
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

;error implement term_01_output_char_oterm_msg_cls

	;Clear DLAB
    IN A, (3)
    AND 0x7F
    OUT (3), A

	;Escape Character
    PRINTCH_LOOP_1:
        ;Read transmit register status in line status register
        IN A, (5)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_1

	LD A, '\033'
    OUT (0), A
	
	;Bracket
	PRINTCH_LOOP_2:
        ;Read transmit register status in line status register
        IN A, (5)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_2

	LD A, '['
    OUT (0), A
	
	;Clear
	PRINTCH_LOOP_3:
        ;Read transmit register status in line status register
        IN A, (5)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_3

	LD A, '2'
    OUT (0), A
	
	;Terminate
	PRINTCH_LOOP_4:
        ;Read transmit register status in line status register
        IN A, (5)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_4

	LD A, 'J'
    OUT (0), A