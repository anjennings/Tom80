;//////////////////////////////////////
;PIO REGISTERS
;//////////////////////////////////////
;This is slightly different from PIO.h found in other projects

PIO_BASE        equ     0x0
PIO_PORTA_DAT   equ     (PIO_BASE)
PIO_PORTB_DAT   equ     (PIO_BASE+1)
PIO_PORTA_CON   equ     (PIO_BASE+2)
PIO_PORTB_CON   equ     (PIO_BASE+3)

;Interrupt Vector
PIO_INT_HIGH    equ     0xFF
PIO_INT_LOW     equ     0x00    ;LSB is disregarded by PIO
PIO_INT         equ     ((PIO_INT_HIGH*256) + (PIO_INT_LOW))
PIO_INT_VECT_A  equ     (PIO_INT_LOW & 0xFE)
PIO_INT_VECT_B  equ     (PIO_INT_LOW & 0xFE)

;Mode Control Words
MODE_OUT       equ     0x0F    ;MODE 0
MODE_IN        equ     0x4F    ;MODE 1
MODE_BI        equ     0x8F    ;MODE 2
MODE_CON       equ     0xCF    ;MODE 3

;Must be sent after setting mode 3
PIO_B_CON_IO    equ     0x00    ;Set PB0, all of port B to outputs

;Interrupt Contro Words
PIO_INT_EN_A    equ     0x87    ;Enable interrupt for mode 0-2
PIO_INT_EN_B    equ     0x97    ;Enable interrupt for mode 3, mask follows
PIO_INT_DE      equ     0x07    ;Disable interrupt for all modes

PIO_MASK        equ     0xFF    ;Must follow Int enable on mode 3