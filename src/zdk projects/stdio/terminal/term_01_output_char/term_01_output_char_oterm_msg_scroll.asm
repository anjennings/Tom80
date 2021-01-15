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

	IN A, (3)
    AND 0x7F
    OUT (3), A

    PRINTCH_LOOP_1:
        ;Read transmit register status in line status register
        IN A, (3)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_1

    ;Write Char to UART
	LD A, '\n'
    OUT (0), A
	
	PRINTCH_LOOP_2:
        ;Read transmit register status in line status register
        IN A, (3)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP_2

    ;Write Char to UART
	LD A, '\n'
    OUT (0), A
