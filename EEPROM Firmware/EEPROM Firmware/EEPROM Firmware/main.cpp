/*
 * EEPROM Firmware.cpp
 *
 * Created: 10/6/2020 6:51:56 PM
 * Author : Aidan
 */ 

//#define F_CPU 14745600UL

//#include <avr/io.h>
//#include "USART.h"
//#include "MONITOR.h"
//#include "SRAM.h"
//#include "MAIN.h"
//#include <util/delay.h>
//#include <stdio.h>
//#include <stdlib.h>

#include "FIRMWARE.h"

char snum[8];

int main(void){
	
	USART_init();
	
	//Just in case
	disableSoftwareProtection();
	
	while(1){
		monitor();
	}
	return 0;
}


int oldmain(void) {
	
	USART_init();
	
	uint8_t x = 0;
	//uint16_t z = 0;
	
	//Just in case
	disableSoftwareProtection();
	
    while (1) 
    {
		//Wait for user input
		USART_receive();
		
		//Just in case
		disableSoftwareProtection();
		
		_delay_ms(2);
		
		//Write the first 16 bytes
		USART_print("\n\n\rWriting to EEPROM...\n\r");
		for(uint16_t i = 0; i < 0x800; i++){
			writeData(0, i);
		}
		
		_delay_ms(10);
		
		//Read those bytes back and print to 
		USART_print("\n\n\n\n\rReading from EEPROM...\n");
		
		for(uint16_t j = 0; j < 0x800; j++){
			
			itoa(j, snum, 16);
			USART_print("\r0x");
			USART_print(snum);
			USART_print(" : 0x");
			
			x = readData(j);
			itoa(x, snum, 16);
			USART_print(snum);
			USART_print("\n");
			
		}
		
		//Finished
		USART_print("\rDone!\r\n\n");
    }
	return 0;
}


