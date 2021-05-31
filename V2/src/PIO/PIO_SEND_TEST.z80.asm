PIO_BASE        equ     0x0
PIO_PORTA_DAT   equ     (PIO_BASE)
PIO_PORTB_DAT   equ     (PIO_BASE+1)
PIO_PORTA_CON   equ     (PIO_BASE+2)
PIO_PORTB_CON   equ     (PIO_BASE+3)

;Interrupt Vector
PIO_INT_HIGH    equ     0x04
PIO_INT_LOW     equ     0x00    ;LSB is disregarded by PIO
PIO_INT         equ     ((PIO_INT_HIGH*256) + (PIO_INT_LOW))
PIO_INT_VECT_A  equ     (PIO_INT_LOW & 0xFE)
PIO_INT_VECT_B  equ     (PIO_INT_LOW & 0xFE)

;Mode Control Words
PIO_A_OUT       equ     0x0F    ;MODE 0
PIO_A_IN        equ     0x4F    ;MODE 1
PIO_A_BI        equ     0x8F    ;MODE 2
PIO_A_CON       equ     0xCF    ;MODE 3

PIO_B_OUT       equ     0x0F    ;MODE 0
PIO_B_IN        equ     0x4F    ;MODE 1
PIO_B_CON       equ     0xCF    ;MODE 3
PIO_B_CON_IO    equ     0x00    ;Follows mode 3, Set PB0, all of port B to outputs
PORTB_MASK      equ     0x07

;Interrupt Contro Words
PIO_INT_EN_A    equ     0x87    ;Enable interrupt for mode 0-2
PIO_INT_EN_B    equ     0x97    ;Enable interrupt for mode 3, mask follows
PIO_INT_DE      equ     0x07    ;Disable interrupt for all modes

PIO_MASK        equ     0xFF    ;Must follow Int enable on mode 3

org 0
    DI
    ;Turn off indicator light
    IN A, 0x14
    XOR 0x08
    OUT 0x14, A
    ;Init
    CALL PIO_INIT_BI
    ;Run the test
    LD A, 0x41
    CALL PIO_SEND_CMD
    DI
    ;Turn other indicator light off
    IN A, 0x14
    XOR 0x4
    OUT 0x14, A
    HALT
    
    ;Program should halt with all 3 lights off
    

PIO_INIT_BI:
        PUSH AF
        PUSH BC
        DI
        
        ;Set interrupt page
        LD A, PIO_INT_HIGH
        LD I, A
        
        ;Set Interrupt Vector on port A and B to be the same (they can be different)
        LD A, PIO_INT_VECT_A
        OUT PIO_PORTA_CON, A
        LD A, PIO_INT_VECT_B
        OUT PIO_PORTB_CON, A
        
        ;Set port A as bi-directional
        LD A, PIO_A_BI
        OUT PIO_PORTA_CON, A
        
        ;Set port B as manual control
        LD A, PIO_B_CON
        OUT PIO_PORTB_CON, A
        LD A, PIO_B_CON_IO
        OUT PIO_PORTB_CON, A
        
        ;Set Interrupt Enable (Both must be set to on in bi mode)
        LD A, PIO_INT_EN_A
        OUT PIO_PORTA_CON, A
        LD A, PIO_INT_EN_B
        OUT PIO_PORTB_CON, A
        LD A, PIO_MASK
        OUT PIO_PORTB_CON, A
        
        ;Put port B in a known state
        LD A, 0xFF
        OUT PIO_PORTB_DAT, A
        
        ;Put port A in a known state
        LD A, 0x00
        OUT PIO_PORTA_DAT, A
        
        POP BC
        POP AF
        IM 2
        EI
        RET

PIO_BASELINE:
        PUSH AF
        LD A, 0x41
        CALL PIO_SEND_CMD
        POP AF
        RET

;Send command, busy wait, return after second interrupt
;Expects A to be command
;Returns value in A
PIO_SEND_CMD:
        PUSH BC
        PUSH HL
        EI
        
        ;Write to PIO (Check status beforehand?)
        LD C, PIO_PORTA_DAT
        OUT (C), A
        
        ;HALT        ;Wait for Prop to acknowledge write
        HALT        ;Wait until data is returned
        
        ;Read data from PIO
        LD C, PIO_PORTA_DAT
        IN A, (C)
        
        POP HL
        POP BC
        RET


PIO_INT_HANDLER:
        ;Exchange registers
        EX AF, AF'
        EXX
        
        ;Do anything?

PIO_INT_EXIT:
        EX AF, AF'
        EXX
        RETI

org PIO_INT
.db (PIO_INT_HANDLER)