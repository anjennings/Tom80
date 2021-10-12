;
;	Tom80 V2.0B hardware support
;


            .module tom80

            ; exported symbols
            .globl init_early
            .globl init_hardware
            .globl _program_vectors
	    .globl platform_interrupt
	    .globl platform_interrupt_all

	    .globl map_kernel
	    .globl map_buffers
	    .globl map_kernel_di
	    .globl map_kernel_restore
	    .globl map_process
	    .globl map_process_di
	    .globl map_process_a
	    .globl map_process_always
	    .globl map_process_always_di
	    .globl map_save_kernel
	    .globl map_restore
	    .globl map_for_swap
	    .globl _kernel_map

	    .globl _int_disabled

	    .globl _irqvector

            ; exported debugging tools
            .globl _platform_monitor
            .globl _platform_reboot
            .globl outchar

            ; imported symbols
            .globl _ramsize
            .globl _procmem
	    ;.globl _membanks
	    .globl _udata

	    .globl unix_syscall_entry
            .globl null_handler
	    .globl nmi_handler
            .globl interrupt_handler

            .globl outcharhex
            .globl outhl, outde, outbc
            .globl outnewline
            .globl outstring
            .globl outstringhex

	    ; Used in pio code
	    .globl _pio_wait_out
	    .globl _pio_wait_in

            .include "kernel.def"
            .include "../kernel-z80.def"

;
;	Disk buffers
;
	    .globl _bufpool
	    .area _BUFFERS

_bufpool:
	    .ds BUFSIZE * NBUFS


; -----------------------------------------------------------------------------
; COMMON MEMORY BANK (0xC000 upwards)
; -----------------------------------------------------------------------------
            .area _COMMONMEM
;
;	This is linked straight after the udata block so is 256 byte
; aligned. Put the im2 table first
;
	     .globl intvectors

intvectors:
		; SDCC should add byte alignment
		.dw 0
		.dw 0
_ctc0_int_v:
	    	.dw ctc0_int
_ctc1_int_v:
		.dw ctc1_int
_ctc2_int_v:
		.dw 0
_ctc3_int_v:
		.dw 0
_pioI_int_v:
		.dw pioI_int
_pioO_int_v:
		.dw pioO_int
		
_irqvector:
		.dw #0xFF


; Reenable ROM, jump back to ASH
_platform_monitor:
	    ; TODO: print PC and SP?
_platform_reboot:
	    di
	    LD C, #0x14
	    IN A, (C)
	    AND #0xE
	    OUT (C), A
	    rst 0		; kaboom


; For each of these, set appropriate flags and jump to handler
; see devtty.c for actual handler
ctc0_int:
ctc1_int:
		PUSH AF
		LD A, #1
		LD (_irqvector), A
		POP AF
		jp interrupt_handler

pioI_int:
		PUSH AF
		LD A, #0
		LD (_pio_wait_in), A
		POP AF
		RETI

pioO_int:
		PUSH AF
		LD A, #0
		LD (_pio_wait_out), A
		POP AF
		RETI

; FF if there is nothing waiting
_pio_wait_in:	.dw	0xFF

; Zero if register is clear to send
_pio_wait_out:	.dw	0

; -----------------------------------------------------------------------------
; KERNEL MEMORY BANK (below 0xC000, only accessible when the kernel is mapped)
; -----------------------------------------------------------------------------

	    ;.area _CONST
		.area _CODE
init_early:
		ret

		.area _DISCARD
init_hardware:
		LD HL, #400 
		LD (_ramsize), HL
		LD HL, #(400-48)
		LD (_procmem), HL

		IM 2

		call BOOT_PIO_INIT
		call BOOT_CTC_INIT

		;Set I register
		LD HL, #intvectors
		LD A, H
		LD I, A

		LD HL, #0
		PUSH HL
		call _program_vectors
		POP HL

            	ret

BOOT_CTC_INIT:
		; Just set interrupt vector, device init does the rest
		LD HL, #_ctc0_int_v
		LD A, L
		AND A, #0xF8	; 8 byte aligned
		OUT (#8), A	; Channel 0
		OR A, #0x2
		OUT (#8), A	; Channel 1

		; Add more as needed

		ret

BOOT_PIO_INIT:

		; Clear any pending command
		LD A, #0
		OUT (#0), A
		EI
		HALT
		DI

		; Commit any outstanding buffer
		LD A, #0x97	; PROP_WRITE_FIN
		OUT (#0), A
		EI
		HALT
		DI

		; One more time just to be sure
		LD A, #0
		OUT (#0), a
		EI
		HALT
		DI

		;Now set new vectors
		LD HL, #_pioO_int_v
		LD A, L
		AND #0xFE
		OUT (#2), A

		LD HL, #_pioI_int_v
		LD A, L
		AND #0xFE
		OUT (#3), A

		ret

;------------------------------------------------------------------------------
; COMMON MEMORY PROCEDURES FOLLOW

            .area _COMMONMEM

_program_vectors:
            ; we are called, with interrupts disabled, by both newproc() and crt0
	    ; will exit with interrupts off
            di ; just to be sure
            pop de ; temporarily store return address
            pop hl ; function argument -- base page number
            push hl ; put stack back as it was
            push de

	    call map_process

            ; write zeroes across all vectors
            ld hl, #0
            ld de, #1
            ld bc, #0x007f ; program first 0x80 bytes only
            ld (hl), #0x00
            ldir

            ; now install the interrupt vector at 0x0038
	    ; TODO: this should be different
            ld a, #0xC3 ; JP instruction
            ld (0x0038), a
            ld hl, #interrupt_handler
            ld (0x0039), hl

	    ld a, #0xC3
            ; set restart vector for UZI system calls
            ld (0x0030), a   ;  (rst 30h is unix function call vector)
            ld hl, #unix_syscall_entry
            ld (0x0031), hl

            ; Set vector for jump to NULL
            ld (0x0000), a   
            ld hl, #null_handler  ;   to Our Trap Handler
            ld (0x0001), hl

            ;ld (0x0066), a  ; Set vector for NMI
            ;ld hl, #nmi_handler
            ;ld (0x0067), hl

		;call map_kernel
		;ret

	    ; our platform has a "true" common area, if it did not we would
	    ; need to copy the "common" code into the common area of the new
	    ; process.

	    ; falls through

            ; put the paging back as it was -- we're in kernel mode so this is predictable
map_kernel:			; Copied!
map_buffers:
map_kernel_di:
map_kernel_restore:
		; Map Bank 0 (Kernel)
		push af
		XOR A
		LD (mapreg), A
		OUT (#1), A	; Port 1 is PIO-B Data
		pop af
            	ret

; Map process pointed to by HL or Kernel if HL is 0
map_process:
map_process_di:			; GOOD!
	    	ld a, h
	    	or l
	    	jr z, map_kernel
	    	ld a, (hl)

map_for_swap:
map_process_a:			; Checked!
		PUSH AF
		AND A, #0x7
		ld (mapreg), a
	    	out (#1), a		; Port 1 is PIO-B Data
	    	POP AF
	    	ret

map_process_always:		; GOOD!
map_process_always_di:
		push AF
		push HL
		ld HL, #_udata + #U_DATA__U_PAGE
		call map_process
		POP HL
		POP AF
		RET

map_save_kernel:		; Copied!
		push af
		ld a, (mapreg)
		ld (mapsave), a
		xor a
		ld (mapreg), a
		out (#1), a
		pop af
		ret

; Restore saved bank
map_restore:			; Copied!
		push af
		ld a, (mapsave)
		ld (mapreg), a
		out (#1), a
		pop af
		ret

mapsave:    	.db 0
mapreg:		.db 0


_kernel_map:   	.db 0
_int_disabled: 	.db 1
_kernel_flag:	.db 1

outchar:
		
		push af
		push bc
		ld B, A	
	
		in a, (#0x13)
		and #0x7F
		out (#0x13), a

outchar_loop:
		IN A, (#0x15)
		AND #0x60
		cp #0x60
		jp nz, outchar_loop

		ld a, b
		out (#0x10), a

		pop bc
		pop af
            	ret

platform_interrupt:
platform_interrupt_all:
	ret
