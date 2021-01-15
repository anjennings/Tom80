#include "uart.h"
#include "tom80.h"

char buffer[256];

void main(){
	
	UART_INIT();	
	GETCH();
	cls();
	
	setColor(WHITE, BLACK);
	
	PRINTSTR("ASH v0.2C\n\r(C) 2020 by Aidan Jennings\n\r");
	PRINTSTR("ZILOG Z80 32k EEPROM, 32k SRAM\n\rTEXTONLY\n\r");
	PRINTSTR("\nBOOT PROCESS COMPLETE!\n\r");
	
	setColor(BLACK, WHITE);
	putstr("test test 123\r", 11, 11);
	setColor(WHITE, BLACK);
	
	while(1){
		monitor(&buffer);
	}
	
	HALT();
}