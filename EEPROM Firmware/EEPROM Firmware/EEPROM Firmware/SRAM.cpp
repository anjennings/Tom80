/*
 * SRAM.cpp
 *
 * Created: 10/6/2020 7:32:41 PM
 *  Author: Aidan
 */ 

#include "avr\io.h"


void init32Kwrite(){
	
	//Set GPIO Direction
	DDRA |= (0xff);	//All Pins Out
	DDRB |= (0xff);	//All Pins Out
	DDRC |= (0xff);	//All Pins Out
	DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
}