/*
 * EEPROM Firmware.cpp
 *
 * Created: 10/6/2020 6:51:56 PM
 * Author : Aidan
 */ 

#include "FIRMWARE.h"

char snum[8];

int main(void){
	
	USART_init();
	
	disableSoftwareProtection();
	
	while(1){
		monitor();
	}
	return 0;
}


