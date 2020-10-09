/*
 * EEPROM Firmware.cpp
 *
 * Created: 10/6/2020 6:51:56 PM
 * Author : Aidan
 */ 

#include <avr/io.h>
#include "USART.h"
#include "MONITOR.h"
#include "SRAM.h"
#include "MAIN.h"

#define clock 14745600
#define baud (clock/128)

int main(void)
{
	
	USART_Init(baud);
    init32Kwrite();
	monitorInit();
	
    while (1) 
    {
		
    }
}

