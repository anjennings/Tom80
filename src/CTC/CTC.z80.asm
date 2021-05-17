CTC_INT_HIGH        equ 0x10
CTC_INT_LOW         equ 0x00
CTC_INT_VECTOR_0    equ ((CTC_INT_HIGH * 0x100) | (CTC_INT_LOW))
CTC_INT_VECTOR_1    equ ((CTC_INT_HIGH * 0x100) | (CTC_INT_LOW)) + 0x20
CTC_INT_VECTOR_2    equ ((CTC_INT_HIGH * 0x100) | (CTC_INT_LOW)) + 0x40
CTC_INT_VECTOR_3    equ ((CTC_INT_HIGH * 0x100) | (CTC_INT_LOW)) + 0x60
CTC_BASE            equ 0x8
CTC_CH0             equ 1+CTC_BASE
CTC_CH1             equ 2+CTC_BASE
CTC_CH2             equ 1+CTC_BASE
CTC_CH3             equ 2+CTC_BASE

;Control Word Bits
CTC_CONTROL_BIT     equ 0x01    ;Control Word
CTC_RESET_BIT       equ 0x02    ;Reset Channel
CTC_TCONST_BIT      equ 0x04    ;Time constant word to follow
CTC_TTRIG_BIT       equ 0x08    ;(Timer Mode Only) Pulse starts timer
CTC_EDGE_BIT        equ 0x10    ;Falling Edge (1) or Rising Edge (1)
CTC_SCALE_BIT       equ 0x20    ;16x (0) or 256x (1)
CTC_MODE_BIT        equ 0x40    ;Timer (0) or Counter (1)
CTC_INTR_BIT        equ 0x80    ;Enable Interrupt on this channel

;Reset Channel
CTC_RESET       equ (CTC_CONTROL_BIT + CTC_RESET_BIT)

;Counter mode, 256x, interrupt enable, constant to follow
CTC_SINGLE      equ (CTC_CONTROL_BIT | CTC_TCONST_BIT | CTC_SCALE_BIT | CTC_MODE_BIT | CTC_INTR_BIT)

;Constants for multi-channel cascaded timer
;Counter mode, no interrupt, 256x, time constant follows 
CTC_MULTI_0      equ (CTC_CONTROL_BIT | CTC_TCONST_BIT | CTC_SCALE_BIT | CTC_MODE_BIT)
;Counter mode, interrupt, 16x, time constant follows
CTC_MULTI_1      equ (CTC_CONTROL_BIT | CTC_TCONST_BIT | CTC_MODE_BIT | CTC_INTR_BIT)

;0 is the same as 256, the max value
CTC_TIME_MAX      equ 0x00

org 0
        NOP
        NOP
        CALL CTC_INIT_SINGLE
LOOP:
        JP LOOP
        HALT
        

CTC_INIT_MULTI:
        PUSH AF
        DI
        IM 2
        
        ;Set up interrupt page
        LD A, CTC_INT_HIGH
        LD I, A
        
        ;Reset all channels
        LD A, CTC_RESET
        OUT CTC_CH0, A
        OUT CTC_CH1, A
        OUT CTC_CH2, A
        OUT CTC_CH3, A
        
        ;Set Interrupt Vector (Indicated by D0 being 0 not following a contro word with TCONST set)
        LD A, 0x00          ;Interrupt low byte is 0, on channel 0
        OUT CTC_CH0, A
        
        LD A, 0x02          ;Interrupt low byte is 0, on channel 1
        OUT CTC_CH0, A
        
        ;Set up channel 0
        LD A, CTC_MULTI_0        ;Control Word
        OUT CTC_CH0, A
        LD A, CTC_TIME_MAX      ;Time Constant
        OUT CTC_CH0, A
        
        ;Set up channel 1
        LD A, CTC_MULTI_1        ;Control Word
        OUT CTC_CH1, A
        LD A, CTC_TIME_MAX      ;Time Constant
        OUT CTC_CH1, A
        
        ;Channel 0 should start to run and generate an INT when finished
        EI
        POP AF
        RET

CTC_INIT_SINGLE:
        PUSH AF
        DI
        IM 2
        
        ;Set up interrupt page
        LD A, CTC_INT_HIGH
        LD I, A
        
        ;Reset all channels
        LD A, CTC_RESET
        OUT CTC_CH0, A
        OUT CTC_CH1, A
        OUT CTC_CH2, A
        OUT CTC_CH3, A
        
        ;Set Interrupt Vector (Indicated by D0 being 0 not following a contro word with TCONST set)
        LD A, 0x00          ;Interrupt low byte is 0, on channel 0
        OUT CTC_CH0, A
        
        ;Set up channel 0
        LD A, CTC_SINGLE    ;Control Word
        OUT CTC_CH0, A
        LD A, CTC_TIME_MAX    ;Time Constant
        OUT CTC_CH0, A
        
        ;Channels 0 & 1 should start to run and 1 should generate an INT when finished
        
        EI
        POP AF
        RET



org CTC_INT_VECTOR_0
CTC_INT_HANDLE:
        HALT
        RETI