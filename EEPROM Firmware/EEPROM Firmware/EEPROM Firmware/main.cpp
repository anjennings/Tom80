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

int main(void)
{
	
	USART_init();
	//monitorInit();
	
	char snum[5];
	uint8_t x = 0;
	
	//Just in case?
	disableSoftwareProtection();
	
	
    while (1) 
    {
		//Wait for user input
		USART_receive();
		
		//Write the first 16 bytes
		USART_print("\rWriting to EEPROM...\n");
		for(uint16_t i = 0; i <= 0x10; i++){
			writeData(0xa, i);
		}
		
		_delay_ms(100);
		
		//Read those bytes back and print to 
		USART_print("\n\n\n\n\rReading from EEPROM...\n");
		
		for(uint16_t j = 0; j < 0x10; j++){
			
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
	
}

