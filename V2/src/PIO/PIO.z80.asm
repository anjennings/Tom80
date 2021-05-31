PIO_BASE        equ     0x0
PIO_PORTA_DAT   equ     (PIO_BASE)
PIO_PORTB_DAT   equ     (PIO_BASE+1)
PIO_PORTA_CON   equ     (PIO_BASE+2)
PIO_PORTB_CON   equ     (PIO_BASE+3)

;Interrupt Vector
PIO_INT_HIGH    equ     0x10
PIO_INT_LOW     equ     0x00    ;LSB is disregarded by PIO
PIO_INT         equ     ((PIO_INT_HIGH*256) + (PIO_INT_LOW))
PIO_INT_VECT    equ     (PIO_INT_LOW & 0xFE)

;Mode Control Words
PIO_A_OUT       equ     0x0F    ;MODE 0
PIO_A_IN        equ     0x4F    ;MODE 1
PIO_A_BI        equ     0x8F    ;MODE 2
PIO_A_CON       equ     0xCF    ;MODE 3

PIO_B_OUT       equ     0x0F    ;MODE 0
PIO_B_IN        equ     0x4F    ;MODE 1
PIO_B_CON       equ     0xCF    ;MODE 3
PIO_B_CON_IO    equ     0xF8    ;Follows mode 3, Set PB0, 1, 2 to be Outputs for ram bank control
PORTB_MASK      equ     0x07

;Interrupt Contro Words
PIO_INT_EN      equ     0x87    ;Enable interrupt for mode 0-2
PIO_INT_DE      equ     0x07    ;Disable interrupt for all modes

org 0
    NOP
    NOP
    NOP
    CALL PIO_INIT
    CALL BANK_TEST
LOOP:
    JP LOOP
    

PIO_INIT:
        PUSH AF
        PUSH BC
        DI
        IM 2
        
        ;Set interrupt page
        LD A, PIO_INT_HIGH
        LD I, A
        
        ;Set Interrupt Vector on port A
        LD A, PIO_INT_VECT
        OUT PIO_PORTA_CON, A
        
        ;Set Interrupt Enable (A on, B off)
        LD A, PIO_INT_EN
        OUT PIO_PORTA_CON, A
        LD A, PIO_INT_DE
        OUT PIO_PORTB_CON, A
        
        ;Set port A as bi-directional
        LD A, PIO_A_BI
        OUT PIO_PORTA_CON, A
        
        ;Port B should be HiZ at reset, set it to a known state before setting mode
        LD A, 0x07
        LD C, PIO_PORTB_DAT
        OUT (C), A
        
        ;Set port B as manual control
        LD A, PIO_B_CON
        OUT PIO_PORTB_CON, A
        LD A, PIO_B_CON_IO
        OUT PIO_PORTB_CON, A
        
        ;Once more for good measure
        LD A, 0x07
        LD C, PIO_PORTB_DAT
        OUT (C), A
        
        POP BC
        POP AF
        EI
        RET


;Send command, busy wait, return after second interrupt
PIO_SEND_CMD:
        PUSH BC
        
        ;Indicate that we have just written and expect a single response
        LD HL, WAIT_WRITE
        LD (HL), 0xFF
        
        LD HL, WAIT_READ
        LD (HL), 0xFF
        
        ;Write to PIO
        LD A, 0xFF
        LD C, PIO_PORTA_DAT
        OUT (C), A
        
WR_LOOP:   ;Pointless interrupt
        LD HL, WAIT_WRITE
        LD A, (HL)
        CP 0
        JP Z, WR_LOOP
        
RD_LOOP:    ;Wait until data is returned
        LD HL, WAIT_READ
        LD A, (HL)
        CP 0
        JP Z, RD_LOOP
        
        ;Read data from PIO
        LD C, PIO_PORTA_DAT
        IN A, (C)
        
        POP BC
        RET


;Check that bank switching works by writing to each bank
BANK_TEST:
        DI
        PUSH AF
        PUSH BC
        PUSH HL
        
        LD H, 0xC0
        LD L, 0x00

        ;Start at bank 7 (default)
        LD A, 7
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD (HL), A
        
        ;Bank 6
        LD A, 6
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD (HL), A
        
        ;Bank 0
        LD A, 0
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD (HL), A
        
        ;Now check bank 7
        LD A, 7
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD A, (HL)
        CP 7
        JP NZ, BANK_TEST_END
        
        ;Check bank 6
        LD A, 6
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD A, (HL)
        CP 6
        JP NZ, BANK_TEST_END
        
        ;Finally bank 0
        LD A, 0
        LD C, PIO_PORTB_DAT
        OUT (C), A
        LD A, (HL)
        CP 0
        JP NZ, BANK_TEST_END

BANK_TEST_SUCCESS:
        HALT
        
BANK_TEST_END:
        POP HL
        POP BC
        POP AF
        EI
        RET



org PIO_INT - 2
WAIT_READ:
db 0

WAIT_WRITE:
db 0

org PIO_INT
PIO_INT_HANDLER:
        ;Exchange registers
        EX AF, AF'
        EXX
        
PIO_INT_WRITE:  
        ;Check if this is the handoff interrupt
        LD HL, WAIT_WRITE
        LD A, (HL)
        CP 0
        JP Z, PIO_INT_READ
        LD (HL), 0
        JP PIO_INT_EXIT
        
PIO_INT_READ:
        ;No need to check any other interrupt cases
        LD HL, WAIT_READ
        LD (HL), 0
        

PIO_INT_EXIT:
        EX AF, AF'
        EXX
        RETI