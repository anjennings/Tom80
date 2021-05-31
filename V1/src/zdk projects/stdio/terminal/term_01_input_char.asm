;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; term_01_input_char ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The keyboard hw delivers ascii codes to this driver.
;
;   * Keyboard reads are blocking.
;
; This subroutine inherits the library's console_01_input
; terminal code which implements line editing and various
; other niceties.  This means this input console must be
; tied to an output terminal that understands console_01_input
; terminal messages.
;
; ;;;;;;;;;;;;;;;;;;;;
; DRIVER CLASS DIAGRAM
; ;;;;;;;;;;;;;;;;;;;;
;
; CONSOLE_01_INPUT_TERMINAL (root, abstract)
; TERM_01_INPUT_CHAR (concrete)
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MESSAGES CONSUMED FROM STDIO
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; * STDIO_MSG_GETC
; * STDIO_MSG_EATC
; * STDIO_MSG_READ
; * STDIO_MSG_SEEK
; * STDIO_MSG_FLSH
; * STDIO_MSG_ICTL
; * STDIO_MSG_CLOS
;
; Others result in enotsup_zc.
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MESSAGES CONSUMED FROM CONSOLE_01_INPUT_TERMINAL
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; * ITERM_MSG_GETC
; * ITERM_MSG_INTERRUPT
; * ITERM_MSG_REJECT
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MESSAGES GENERATED FOR CONSOLE_01_OUTPUT_TERMINAL
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; * ITERM_MSG_PUTC
; * ITERM_MSG_PRINT_CURSOR
; * ITERM_MSG_ERASE_CURSOR
; * ITERM_MSG_BS
; * ITERM_MSG_BS_PWD
; * ITERM_MSG_READLINE_BEGIN
; * ITERM_MSG_READLINE_END
; * ITERM_MSG_BELL
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IOCTLs UNDERSTOOD BY THIS DRIVER
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; * IOCTL_ITERM_RESET
;
; * IOCTL_ITERM_TIE
;   Attach input device to a different output terminal (0 to disconnect)
;
; * IOCTL_ITERM_GET_EDITBUF
;   Copies edit buffer details to user program
;
; * IOCTL_ITERM_SET_EDITBUF
;   Writes edit buffer details into driver
;
; * IOCTL_ITERM_ECHO
;   enable / disable echo mode
;
; * IOCTL_ITERM_PASS
;   enable / disable password mode
;
; * IOCTL_ITERM_LINE
;   enable / disable line editing mode
;
; * IOCTL_ITERM_COOK
;   enable / disable cook mode
;
; * IOCTL_ITERM_CAPS
;   set / reset caps lock
;
; * IOCTL_ITERM_CRLF
;   enable / disable crlf processing
;
; * IOCTL_ITERM_CURS
;   enable / disable cursor in line mode
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;
; BYTES RESERVED IN FDSTRUCT
; ;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; offset (wrt FDSTRUCT.JP)  description
;
;    8..13                  mutex
;   14..15                  FDSTRUCT *oterm (connected output terminal, 0 if none)
;   16                      pending_char
;   17..18                  read_index (index of next char to read from edit buffer)
;   19..24                  b_array (manages edit buffer)

SECTION code_driver
SECTION code_driver_terminal_input

PUBLIC term_01_input_char

EXTERN ITERM_MSG_GETC, ITERM_MSG_INTERRUPT, ITERM_MSG_REJECT, STDIO_MSG_FLSH

EXTERN console_01_input_terminal
EXTERN term_01_input_char_iterm_msg_getc
EXTERN term_01_input_char_iterm_msg_interrupt
EXTERN term_01_input_char_iterm_msg_reject
EXTERN term_01_input_char_stdio_msg_flsh

term_01_input_char:

   cp ITERM_MSG_GETC
   jp z, term_01_input_char_iterm_msg_getc
   
   cp ITERM_MSG_INTERRUPT
   jp z, term_01_input_char_iterm_msg_interrupt

   cp ITERM_MSG_REJECT
   jp z, term_01_input_char_iterm_msg_reject
   
   cp STDIO_MSG_FLSH
   jp z, term_01_input_char_stdio_msg_flsh
   
   jp console_01_input_terminal    ; forward to library
