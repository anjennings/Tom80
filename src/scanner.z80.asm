;Scanner, Assumes clock is 2 MHz
NOP      
NOP      
NOP      
NOP 

;Set Stack to start at 0x08FF
LD H, 8
LD L, 255
LD SP, HL

START:

LD C, 0		;IO Port 0
OR  A       ;reset carry flag
LD  A, 1

RLOOP:
OUT (C), A	;Put A into Latch
CALL WAIT	;Wait
rla			;Rotate
JP NC, RLOOP

LLOOP:
OUT (C), A	;Latch A
CALL WAIT	;Wait
rra			;Rotate
ADD A, 0    ;set zero flag
JP NZ, LLOOP
JP START

HALT

;Delay, change 0x18FF, to set speed
WAIT:
LD H, 24
LD L, 255
WAIT_LOOP_1:
DEC L
JP NZ, WAIT_LOOP_1
WAIT_LOOP_2:
LD L, 255
DEC H
JP NZ, WAIT_LOOP_1
ret