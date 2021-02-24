#include "uart.h"
#include "tom80.h"
#include "monitor.h"

#pragma output CLIB_MALLOC_HEAP_SIZE = 0

void main(){
	
	UART_INIT();
	getc();
	cls();
	
	setColor(WHITE, BLACK);
	
	print("ASH v0.3C\n\r(C) 2020 by Aidan Jennings\n\r");
	print("ZILOG Z80 32k EEPROM, 32k SRAM\n\rTEXT ONLY\n\r");
	print("\nBOOT PROCESS COMPLETE!\n\n\r");
	
	char buffer[128];
	
	while(1){
		monitor(&buffer);
	}
	
}