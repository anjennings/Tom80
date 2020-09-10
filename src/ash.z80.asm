;ASH - Aidan's SHell

;8K EEPROM (0x0000 - 0x1FFF)
;8K SRAM (0x2000 - 2FFF)
;IO Provided via 16550 UART
;Clock is 1.8 something or 3.6 something (I haven't decided yet)

STACK_H equ 0x2F
STACK_L equ 0xFF

;////////////////
;UART Registers
;////////////////

UART_DHR equ        0x0 ;UART Data R/W register
UART_IER equ        0x1 ;Interrupt Enable Register
UART_IFR equ        0x2 ;Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
UART_LCR equ        0x3 ;Line Control Register
UART_MCR equ        0x4 ;Modem Control (Unused)
UART_LSR equ        0x5 ;Line Status Register
UART_MSR equ        0x6 ;Modem Status (Unused)
UART_SCR equ        0x7 ;Arbitrary data can be stored here

;///////////
;Charactars
;///////////

NEWLINE equ 0xA
RETURN equ 0xD
EOF equ 0x0

;/////////////////
;Code Starts HERE
;/////////////////
org 0000h
BOOT:
;Wait a few clocks
NOP
NOP
NOP
NOP
;Set up Stack
LD H, STACK_H
LD L, STACK_L
LD SP, HL
;Set up Interrupt mode
IM 1
;Print Boot Screen
LD BC, BOOT_MSG
CALL WRITE_STR
;Enable Interrupt
EI
;Print Ready Message
LD BC, READY_MSG
CALL WRITE_STR
;Boot Sequence Complete
JP MAIN

;//////////////////
;Interrupt Routine
;//////////////////
org 0038h
NOP
NOP
RETI

MAIN:
LD BC, STR1
CALL WRITE_STR
HALT

;//////////////////////
;//////Functions///////
;//////////////////////

;Writes a string via IO 
;Disables Interrupts while running
;Expects BC to be the address of a string
;This is really more of a placeholder until I get more info about the UART
WRITE_STR:
DI
PUSH AF
PUSH BC
WRITE_START:
LD A, (BC)
CP 0
JP Z, WRITE_CLOSE
OUT UART_DHR, A
INC BC
JP WRITE_START
WRITE_CLOSE:
POP BC
POP AF
ret


;//////////////////////
;/////////DATA/////////
;//////////////////////
WARNING:
.db "I DON'T RECALL SAYING YOU WERE ALLOWED TO LOOK AT MY EEPROM", EOF

STR1:
.db "TEST TEST 123", EOF

BOOT_MSG:
.db NEWLINE, RETURN, "ASH v0.01", NEWLINE, RETURN, "(C) 2020 by Aidan Jennings"
.db NEWLINE, RETURN, "ZILOG Z80 8k EEPROM, 8k SRAM", NEWLINE, RETURN, "TEXT ONLY", EOF

READY_MSG:
.db NEWLINE, RETURN, "BOOT PROCESS COMPLETE!", NEWLINE, RETURN, EOF

CURSOR:
.db RETURN, ">>>:", EOF