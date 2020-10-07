/*
 * EEPROM Firmware.cpp
 *
 * Created: 10/6/2020 6:51:56 PM
 * Author : Aidan
 */ 

#include <avr/io.h>
#include "USART.h"
#include "Monitor.h"
#include "SRAM.h"

#define clock 14745600

int main(void)
{
	USART_Init((unsigned)main_baud);
    /* Replace with your application code */
    while (1) 
    {
		USART_PrintStr("Hello World!");
    }
}

