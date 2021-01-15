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

	IN A, (3)
    AND 0x7F
    OUT (3), A

    PRINTCH_LOOP:
        ;Read transmit register status in line status register
        IN A, (3)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    ;Write Char to UART
	LD A, C
    OUT (0), A
