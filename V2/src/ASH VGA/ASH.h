;///////////
;Charactars
;///////////

CHAR_NEWLINE equ 0xA
CHAR_RETURN equ 0xD
CHAR_EOT equ 0x3
CHAR_SPACE equ 0x20
CHAR_NULL equ 0x0

SYM_READ equ ":"
SYM_WRITE equ "<"
SYM_EXE equ "@"
SYM_HELP equ "?"

STACK           equ 0xFFF0
OUTPUT_SEL      equ STACK+1     ;Indicates if output is via serial or VGA
PROP_ENABLED    equ STACK+2     ;Set to 0 if Prop is detected at boot
PROP_WRITE_FLAG equ STACK+3     
PROP_READ_FLAG  equ STACK+4

;First byte of term buf is the size of the term buf
TERM_BUF equ 0x8000
;Maximum size of the buffer
TERM_BUF_MAX  equ 256

OUTPUT_SERIAL   equ     'S'
OUTPUT_VGA      equ     'V'