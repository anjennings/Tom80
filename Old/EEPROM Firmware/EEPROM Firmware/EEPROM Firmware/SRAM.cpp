/*
 * SRAM.cpp
 *
 * Created: 10/6/2020 7:32:41 PM
 *  Author: Aidan
 */ 

#include "FIRMWARE.h"

//YES I KNOW THIS FILE SHOULD BE NAMED EEPROM, NOT SRAM I NEVER SAID I WAS SMART


//Set all data and address pins to 0 to prevent floating values
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

//Set EEPROM Chip Enable Low
void enableEEPROM(){
	CONTROL &= ~(1 << N_ENABLE);
}

//Set EEPROM Chip Enable High
void disableEEPROM(){
	CONTROL |= (1 << N_ENABLE);
}

//Set EEPROM Write Enable Low
void enableWrite(){
	CONTROL &= ~(1 << N_WRITE);
}

//Set EEPROM Write Enable High
void disableWrite(){
	CONTROL |= (1 << N_WRITE);
}

//Set EEPROM Output Enable High
void enableOutput(){
	CONTROL &= ~(1 << N_OUTPUT);
}

//Set EEPROM Output Enable Low
void disableOutput(){
	CONTROL |= (1 << N_OUTPUT);
}

//Set all 3 control pins to be outputs
void setControl(){
	DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
}

//Read data on Port A
uint8_t getData(){
	DDRA = 0;
	_delay_ms(1);	//need to wait a bit for the port state to change
	return PINA;
}

//Set Port B & C to be an address value
void setAddresss(uint16_t a){
	DDRB = 0xff;
	DDRC = 0xff;
	ADDR_H = (uint8_t)((a >> 8) & 0xff);
	ADDR_L = (uint8_t)(a & 0xff);
}

//Set Port A to be a data value
void setData(uint8_t d){
	DDRA = 0xff;
	DATA = d;
}

//Write data to a single location in memory
void writeData(uint8_t d, uint16_t a){
	
	//Set control pins
	setControl();
	
	//Zero out all of the lines and disable all controls
	flush();
	
	//See waveform on page 13 of datasheet
	disableOutput();
	setAddresss(a);
	enableEEPROM();
	
	//I have no idea why but that 8 is pretty important
	_delay_ms(8);	//T-CS
	
	enableWrite();
	setData(d);
	disableWrite();
	disableEEPROM();
	
	//Clear address and data lines again and disable the chip
	flush();
	disableEEPROM();
	disableOutput();
	disableWrite();
	
}

//Read from a single location in memory
uint8_t readData( uint16_t a){
	
	//Set data and address lines low
	flush();
	
	//Put all control pins in a known state
	enableOutput();
	enableEEPROM();
	disableWrite();
	
	//Put the data and address in the right place
	setAddresss(a);
	
	//Without a delay, the chip doesn't always read correctly
	_delay_ms(1);
	
	//Read from Port A
	uint8_t val = getData();
	
	//Clear address and data lines again and disable the chip
	disableEEPROM();
	disableOutput();
	disableWrite();
	flush();
	
	return val;
	
}

//Unused
void init32Kwrite(){
	
	//Set GPIO Direction
	DDRA = (0xff);	//All Pins Out
	DDRB = (0xff);	//All Pins Out
	DDRC = (0xff);	//All Pins Out
	//DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
	setControl();

	//Put all control pins in a known state
	disableEEPROM();	
	disableWrite();	
	disableOutput();

}

//Unused
void init32Kread(){
	
	//Set GPIO Direction
	//DDRA = 0;//All Pins IN
	//DDRB = 0xff;	//All Pins OUT
	//DDRC = 0xff;	//All Pins OUT
	//DDRD |= (1 << DDRD7)|(1 << DDRD6)|(1 << DDRD5);	//5,6,7 are Outputs
	setControl();

	//Put all control pins in a known state
	disableEEPROM();
	disableWrite();
	disableOutput();
}

//Disables write protection on chips, only needs to be done once
void disableSoftwareProtection(){
	
	setControl();
	//flush disables all controls
	
	//Step 1
	flush();
	setAddresss(0x5555);
	setData(0xAA);
	enableEEPROM();
	enableWrite();
	_delay_ms(1);
	
	//Step 2
	flush();
	setAddresss(0x2AAA);
	setData(0x55);
	enableEEPROM();
	enableWrite();
	_delay_ms(1);
	
	//Step 3
	flush();
	setAddresss(0x5555);
	setData(0x80);
	enableEEPROM();
	enableWrite();
	_delay_ms(1);
	
	//Step 4
	flush();
	setAddresss(0x5555);
	setData(0xAA);
	enableEEPROM();
	enableWrite();
	_delay_ms(1);
	
	//Step 5
	flush();
	setAddresss(0x2AAA);
	setData(0x55);
	enableEEPROM();
	enableWrite();
	_delay_ms(1);
	
	//Step 6
	flush();
	setAddresss(0x5555);
	setData(0x20);
	enableEEPROM();
	enableWrite();
	
	//Twc
	_delay_ms(10);
	
	/*
	writeData(0xaa, 0x5555);
	//_delay_ms(1);
	writeData(0x55, 0x2aaa);
	//_delay_ms(1);
	writeData(0x80, 0x5555);
	//_delay_ms(1);
	writeData(0xAA, 0x5555);
	//_delay_ms(1);
	writeData(0x55, 0x2aaa);
	//_delay_ms(1);
	writeData(0x20, 0x5555);
	//_delay_ms(1);
	//_delay_ms(1);
	*/
}