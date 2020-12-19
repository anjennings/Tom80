/*
 * SRAM.cpp
 *
 * Created: 10/6/2020 7:32:41 PM
 *  Author: Aidan
 */ 

//#include "avr\io.h"
//#include <util/delay.h>
//#include "SRAM.h"
//#include "USART.h"

#include "FIRMWARE.h"

/**
	flush():
	
	Set all pins to 0 to prevent floating values
	Assumes that we are already in 'write mode'

**/
void flush(){
	
	//Put all control pins in a known state
	disableEEPROM();
	disableWrite();
	disableOutput();
	
	//Set GPIO Direction
	DDRA = (0xff);	//All Pins Out
	DDRB = (0xff);	//All Pins Out
	DDRC = (0xff);	//All Pins Out
	
	//Clear data pins
	DATA = 0;
	
	//Clear address pins
	ADDR_L = 0;
	ADDR_H = 0;
}

void enableEEPROM(){
	CONTROL &= ~(1 << N_ENABLE);
}

void disableEEPROM(){
	CONTROL |= (1 << N_ENABLE);
}

void enableWrite(){
	CONTROL &= ~(1 << N_WRITE);
}

void disableWrite(){
	CONTROL |= (1 << N_WRITE);
}

void enableOutput(){
	CONTROL &= ~(1 << N_OUTPUT);
}

void disableOutput(){
	CONTROL |= (1 << N_OUTPUT);
}

void setControl(){
	DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
}

uint8_t getData(){
	DDRA = 0;
	return PINA;
}

void setAddresss(uint16_t a){
	DDRB = 0xff;
	DDRC = 0xff;
	ADDR_H = (uint8_t)((a >> 8) & 0xff);
	ADDR_L = (uint8_t)(a & 0xff);
}

void setData(uint8_t d){
	DDRA = 0xff;
	DATA = d;
}

void writeData(uint8_t d, uint16_t a){
	
	
	//Set GPIO Direction
	//DDRA = (0xff);	//All Pins Out
	//DDRB = (0xff);	//All Pins Out
	//DDRC = (0xff);	//All Pins Out
	//DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
	setControl();
	
	//Zero out all of the lines and disable all controls
	flush();
	
	//See waveform on page 13 of datasheet
	disableOutput();
	//ADDR_L = (a & 0xFF);
	//ADDR_H = ((a >> 8) & 0xFF);
	setAddresss(a);
	enableEEPROM();
	_delay_ms(10);	//T-CS
	
	enableWrite();
	_delay_ms(1);	//T-WP, T-AH
	
	//PORTA = d;	//DATA Lines
	setData(d);
	_delay_ms(1);	//T-DS
	
	disableWrite();
	_delay_ms(1);	//T-CH
	
	disableEEPROM();
	_delay_ms(1);	//T-WPH, T-DH
	
	//Data should now be written
	
}

uint8_t readData( uint16_t a){
	
	//Set data and address lines low
	flush();
	
	//Set all pins to read
	init32Kread();
	
	//Put all control pins in a known state
	enableOutput();
	enableEEPROM();
	disableWrite();
	
	//Put the data and address in the right place
	//ADDR_L = (uint8_t)(a & 0xff);
	//ADDR_H = (uint8_t)((a >> 8) & 0xff);
	setAddresss(a);
	
	//Without a delay, the chip doesn't always read correctly
	_delay_ms(1);
	
	//Read from Port A
	uint8_t val = getData();
	disableEEPROM();
	disableOutput();
	disableWrite();
	return val;
	
}

void init32Kwrite(){
	
	//Set GPIO Direction
	DDRA = (0xff);	//All Pins Out
	DDRB = (0xff);	//All Pins Out
	DDRC = (0xff);	//All Pins Out
	//DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
	void setControl();

	//Put all control pins in a known state
	disableEEPROM();	
	disableWrite();	
	disableOutput();

}

void init32Kread(){
	
	//Set GPIO Direction
	DDRA = 0;//All Pins IN
	DDRB = 0xff;	//All Pins OUT
	DDRC = 0xff;	//All Pins OUT
	//DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
	setControl();

	//Put all control pins in a known state
	disableEEPROM();
	disableWrite();
	disableOutput();
}

void disableSoftwareProtection(){
	
	init32Kwrite();
	
	//idk if this is the problem but its worth trying
	writeData(0xaa, 0x5555);
	_delay_ms(10);
	
	writeData(0x55, 0x2aaa);
	_delay_ms(10);
	
	writeData(0x80, 0x5555);
	_delay_ms(10);
	
	writeData(0xAA, 0x5555);
	_delay_ms(10);
	
	writeData(0x55, 0x2aaa);
	_delay_ms(10);
	
	writeData(0x80, 0x5555);
	_delay_ms(10);
	
	writeData(0, 0);
	_delay_ms(10);
	
	
}