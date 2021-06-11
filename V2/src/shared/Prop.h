PROP_SANITY		equ		0x80		;Sanity check, should reply

PROP_SETTRK     equ     0x90        ;Set track in "disk"
PROP_SETSEC     equ     0x91        ;Goto sector in "disk"
PROP_SELDSK     equ     0x92        ;Open disk image
PROP_PREP_READ  equ     0x93        ;Prepare to read
PROP_READ_NEXT  equ     0x94        ;Get next byte from sector
PROP_PREP_WRITE equ     0x95        ;Prepare to write
PROP_WRITE_NEXT equ     0x96        ;Write next byte to sector
PROP_WRITE_FIN	equ		0x97		;Commit last sector to disk