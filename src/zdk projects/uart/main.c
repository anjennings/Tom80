#include "uart.h"
#include "tom80.h"
#include "monitor.h"
#include <malloc.h>

#pragma output CLIB_MALLOC_HEAP_SIZE = 0

void main(){
	
	UART_INIT();
	getc();
	cls();
	
	setColor(WHITE, BLACK);
	
	print("ASH v0.3C\n\r(C) 2020 by Aidan Jennings\n\r");
	print("ZILOG Z80 32k EEPROM, 32k SRAM\n\rTEXTONLY\n\r");
	print("\nBOOT PROCESS COMPLETE!\n\n\r");
	
	unsigned char buffer[128];
//	buffer = malloc(128*sizeof(char));
	
	while(1){
		monitor(&buffer);
		//simpleLoop();
		//putc(getc());
	}
	
}