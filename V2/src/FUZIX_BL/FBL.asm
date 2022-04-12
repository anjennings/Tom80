include "./../shared/Prop.h"

BOOT_BASE		EQU	0x4000		;Sits above CPM (~6.5k @ 0x2000) in ROM
FUZIX_SIZE		EQU	0xCB20		;Guesstimate
FUZIX_SECTORS	EQU	(FUZIX_SIZE / SECTOR_SIZE)				;Total # of sectors needed for fuzix
BOOTST_SIZE		EQU (FUZIX_BOOTST_END-FUZIX_BOOTST_END)	;Total size of BOOTSTRAP
FUZIX_TRACKS	EQU 2										;Number of tracks needed for fuzix
SECT_PER_TRACK	EQU (FUZIX_SECTORS / FUZIX_TRACKS)			;Sectors per track
FUZIX_START		EQU 0x0100		;crt0 begins at 0x100
SECTOR_SIZE		EQU	0x0080		;128 byte sector
BS_DEST			EQU 0xE000		;Way outside the stack, int vectors, and kernel
FUZIX_DISK		EQU	'E'

PIO_BASE		EQU 0
PIO_PORTA_DAT	EQU (PIO_BASE)

;Bootload = ROM -> RAM		(Step 1)
;Bootstrap = DISk -> RAM	(Step 2)

ORG BOOT_BASE
;Once this is called, ASH can not be returned to without a restart
;Step 1, BOOTLOAD copies BOOTSTRAP to location in common mem
;Step 2, BOOTSTRAP disables rom, copies fuzix kernel into memory from disk
;Step 3, Jump to exe at 0x0100
;Step 4, ????
;Step 5, Profit
BL_SETUP:
	CALL BOOTLOAD
	JP BS_DEST
	RET					;Return to monitor to check if ram has loaded correctly

;Load BOOTSTRAP into Memory
;Expects DE to be base in RAM
;Expects HL to be base in ROM
;Expects BC to be size of section
BOOTLOAD:
	LD HL, FUZIX_BOOTST_START
	LD DE, BS_DEST
	LD BC, BOOTST_SIZE
	LDIR
	RET
	
;Avoid using JP/CALL, size will be larger but code is relocatable, JR only (+/- 128 bytes)
FUZIX_BOOTST_START:
	;Fuzix Bootstrap, copied from ROM into RAM and executed
	LD DE, FUZIX_START 
	LD BC, FUZIX_SIZE
	
	;DISABLE ROM
	LD C, 0x14		;UART_MCR
	IN A, (C)
	OR 0x01
	OUT (C), A
	
	;CHANGE INT VECTORS
	LD HL, PIO_INT
	LD A, H
	LD I, A
	
	;CHANGE INT JUMPER (reti)
	LD A, L
	AND 0xFE
	OUT (PIO_BASE+2), A
	ADD A, 2
	OUT (PIO_BASE+3), A
	
	;OPEN FILE
	LD A, PROP_SELDSK
	OUT (PIO_PORTA_DAT), A
    EI
    HALT
	DI
	
	LD A, FUZIX_DISK
	OUT (PIO_PORTA_DAT), A
    EI
    HALT
	DI
	
	;SET TRACK/SECTOR
	;H holds Track
	;L holds Sector
	LD HL, 0
	
SET_DISK_TRACK:
	;Set Track
	LD A, PROP_SETTRK
	OUT (PIO_PORTA_DAT), A
    EI
    HALT        ;Wait for Prop to acknowledge write
	DI
	
	LD A, 0
	OUT (PIO_PORTA_DAT), A
    EI
    HALT        ;Wait for Prop to acknowledge write
	DI
	
SET_DISK_SECT:
	;Set Sector
	LD A, PROP_SETSEC
	OUT (PIO_PORTA_DAT), A
    EI
    HALT        ;Wait for Prop to acknowledge write
	DI
	
	LD A, 0
	OUT (PIO_PORTA_DAT), A
    EI
    HALT        ;Wait for Prop to acknowledge write
	DI
	

FUZIX_BOOTLD_LOOP:

	;Init read from disk
	LD A, PROP_PREP_READ
	OUT (PIO_PORTA_DAT), A
    EI
    HALT        ;Wait for Prop to acknowledge write
	DI
	
    LD A, SECTOR_SIZE
	
READ_LOOP:
	LD B, A
	
	;PIO_GET_DATA
	EI
	HALT
	DI
	IN A, (PIO_PORTA_DAT)
	
	LD (DE), A
	INC DE
	LD A, B
	DEC A
	CP 0
	JR NZ, READ_LOOP
	
	LD A, H
	INC A
	
	;Increment sector
	LD A, L
	INC A
	LD L, A
	CP SECT_PER_TRACK
	JR NZ, SET_DISK_SECT
	
	;Increment track
	LD A, H
	INC A
	LD H, A
	CP FUZIX_TRACKS
	JR NZ, SET_DISK_TRACK
	
	JP FUZIX_START
	

PIO_INT_HANDLER_IN:
	RETI
	
PIO_INT_HANDLER_OUT:
	RETI

PIO_INT:
dw (PIO_INT_HANDLER_OUT)
dw (PIO_INT_HANDLER_IN)

FUZIX_BOOTST_END: