;Both ASH and CPM need these files to be consistant across projects

;Locations of each system in RAM
CCP_BASE    EQU 0xE400
BDOS_BASE   EQU 0xEC06
BIOS_BASE   EQU 0xFA00
WBOOT_LOC	EQU 0xFA03

;Size of each system in memory
CCP_SIZE    EQU BDOS_BASE-CCP_BASE
BDOS_SIZE   EQU BIOS_BASE-BDOS_BASE

WBOOT_SIZE	EQU	0x1600

;Locations of each system in ROM
CCP_EEPROM  EQU 0x3000 						;Location of CCP in RAM
BDOS_EEPROM EQU CCP_EEPROM+CCP_SIZE 		;Location of BDOS in RAM

;Values used when loading from RAM to ROM
CPM_ROM_BASE	EQU		CCP_EEPROM			;Location CPM is loaded from in EEPROM
CPM_BASE		EQU		CCP_BASE			;Location CPM is loaded to in RAM
CPM_SIZE		EQU		0x1B00				;Total Size of CPM (Guesstimate)