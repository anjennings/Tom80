include "../shared/CPM_locations.h"
	
ORG 0x2000
;Once this is called, ASH can not be returned to without a restart
;Stack will be destroyed and EEPROM will be disabled shortly after boot
CPM:
	CALL CPM_BOOTSTRAP
	JP BIOS_BASE
	RET					;Return to monitor to check if ram has loaded correctly

;Load CPM into Memory
CPM_BOOTSTRAP:
	LD HL, CPM_ROM_BASE
	LD DE, CPM_BASE
	LD BC, CPM_SIZE
	CALL LOAD_EEPROM
	RET
	
	
;Expects DE to be base in RAM
;Expects HL to be base in ROM
;Expects BC to be size of section
LOAD_EEPROM:
        
    LOAD_EEPROM_LOOP:
        LD A, (HL)
        LD (DE), A              ;Copy Value
		INC HL
		INC DE
        DEC BC
        
		LD A, 0
		CP B
        JP NZ, LOAD_EEPROM_LOOP   	;Return if B != 0
		CP C
		JP NZ, LOAD_EEPROM_LOOP		;Return if C != 0
        
    LOAD_EEPROM_EXIT:
        RET