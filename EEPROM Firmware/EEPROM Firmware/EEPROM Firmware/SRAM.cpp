/*
 * SRAM.cpp
 *
 * Created: 10/6/2020 7:32:41 PM
 *  Author: Aidan
 */ 

#include "avr\io.h"

#define DATA PORTA
#define D0 PA0
#define D1 PA1
#define D2 PA2
#define D3 PA3
#define D4 PA4
#define D5 PA5
#define D6 PA6
#define D7 PA7

#define ADDR_L PORTB
#define A0 PB0
#define A1 PB1
#define A2 PB2
#define A3 PB3
#define A4 PB4
#define A5 PB5
#define A6 PB6
#define A7 PB7

#define ADDR_H PORTC
#define A8 PC0
#define A9 PC1
#define A10 PC2
#define A11 PC3
#define A12 PC4
#define A13 PC5
#define A14 PC6

//UART is on PortD so don't write to any other pins
#define CONTROL PORTD
#define N_OUTPUT PD5
#define N_WRITE PD6
#define N_ENABLE PD7

void delay(int x){
	
	//Quick and dirty, this is only a placeholder
	for(int i = 0; i < x; i++);
	
}

void writeData(uint8_t d, uint16_t a){
	
	//Put all control pins in a known state
	CONTROL |= (1 << N_OUTPUT);		//Disable output
	CONTROL &= ~(1 << N_ENABLE);	//Enable the chip
	CONTROL |= (1 << N_WRITE);		//Disable write
	
	//Put the data and address in the right place
	DATA = d;
	ADDR_L = (uint8_t)(a&0xff);
	ADDR_H = (uint8_t)((a >> 8)&0xff);
	
	//Set write pin low (enabled)
	CONTROL ^= (1 << N_WRITE);
	
	//wait, see ROM data-sheet for min time
	delay(1000);
	
	//Set write pin high (disabled)
	CONTROL ^= (1 << N_WRITE);
}

uint8_t readData( uint16_t a){
	
	//Put all control pins in a known state
	CONTROL &= ~(1 << N_OUTPUT);	//Enable output
	CONTROL &= ~(1 << N_ENABLE);	//Enable the chip
	CONTROL |= (1 << N_WRITE);		//Disable write
	
	//Put the data and address in the right place
	ADDR_L = (uint8_t)(a & 0xff);
	ADDR_H = (uint8_t)((a >> 8) & 0xff);
	
	//wait, see ROM data-sheet for min time
	delay(1000);
	
	//Read from Port A
	return PINA;
	
}

void init32Kwrite(){
	
	//Set GPIO Direction
	DDRA |= (0xff);	//All Pins Out
	DDRB |= (0xff);	//All Pins Out
	DDRC |= (0xff);	//All Pins Out
	DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs

	//Pulldown resistors?
}

void init32Kread(){
	
	//Set GPIO Direction
	DDRA &= ~(0xff);//All Pins In
	DDRB |= (0xff);	//All Pins OUT
	DDRC |= (0xff);	//All Pins Out
	DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs

	//Pulldown resistors?
}