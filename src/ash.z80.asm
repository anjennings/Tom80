;ASH - Aidan's SHell

;32K EEPROM (0x0000 - 0x7FFF)
;32K SRAM (0x8000 - FFFF)
;IO Provided via 16550 UART

STACK_H equ 0xFF
STACK_L equ 0xFF

;////////////////
;UART Registers
;////////////////

UART_DHR equ        0x0 ;UART Data R/W register
UART_IER equ        0x1 ;Interrupt Enable Register
UART_IFR equ        0x2 ;Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
UART_LCR equ        0x3 ;Line Control Register
UART_MCR equ        0x4 ;Modem Control 
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

;///////////////////////////////
;Set up UART
;///////////////////////////////
;Enable Received Data Interrupt
LD A, 01h
OUT UART_IER, A
;FIFO Enable?

;Line Control?

;Set OUT pins Low
LD A, 0Ch
OUT UART_MCR, A
;Set DLAB=1
LD A, 80h
OUT UART_LCR, A
;Divide Clock by 6 for 19200 baud
LD A, 6
OUT UART_DHR, A
LD A, 0
OUT UART_IER, A
;////////////////////////////////

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
IM 1
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
.db NEWLINE, RETURN, "ZILOG Z80 32k EEPROM, 32k SRAM", NEWLINE, RETURN, "TEXT ONLY", EOF

READY_MSG:
.db NEWLINE, RETURN, "BOOT PROCESS COMPLETE!", NEWLINE, RETURN, EOF

CURSOR:
.db RETURN, ">>>:", EOF