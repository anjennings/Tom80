nop
nop
nop
nop

LD H, 255
LD L, 0
LD A, 10
LD B, 0

LD (HL), 10

LD B, (HL)

CP B
JP NZ, FAIL

;If SRAM is present, system should halt
SUCC:
HALT

FAIL:
JP FAIL