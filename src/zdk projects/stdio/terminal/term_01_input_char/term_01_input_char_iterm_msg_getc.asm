INCLUDE "config_z80_private.inc"

SECTION code_driver
SECTION code_driver_terminal_input

PUBLIC term_01_input_char_iterm_msg_getc

term_01_input_char_iterm_msg_getc:

   ;    enter : ix = & FDSTRUCT.JP
   ;
   ;     exit : a = keyboard char after character set translation
   ;            carry set on error, hl = 0 (stream error) or -1 (eof)
   ;
   ;  can use : af, bc, de, hl
   
   ; Get a character in a blocking read
   
;error implement term_01_input_char_iterm_msg_getc

	;Clear DLAB
	IN A, (3)
    AND 0x7F
    OUT (3), A

	GETCH_LOOP:
        ;Read Line Status Reg
        IN A, (5)
        ;If only bit 1 is set then FIFO has new data
        AND 0x1F
        CP 1
        JP NZ, GETCH_LOOP
		
	IN A, (0)
	or a
	RET
	
   ; After character is retrieved do any necessary
   ; character set translation including ascii codes
   ; 10 and 13 as shown below

   ; a = ascii code

   cp 32
   ret nc
   
   cp 10
   jr z, key_cr
   
   cp 13
   jr z, key_lf

   or a                        ; reset carry to indicate success
   ret

key_cr:

   ld a,CHAR_CR
   ret

key_lf:

   ld a,CHAR_LF
   ret