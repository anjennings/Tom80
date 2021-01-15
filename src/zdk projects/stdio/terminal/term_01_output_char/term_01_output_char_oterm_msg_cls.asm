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
