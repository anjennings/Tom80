/*
 * SRAM.h
 *
 * Created: 10/6/2020 7:17:27 PM
 *  Author: Aidan
 */ 



#ifndef SRAM_H_
#define SRAM_H_
#include <stdint-gcc.h>

	#define DATA PORTA
	#define D0 PORTA0
	#define D1 PORTA1
	#define D2 PORTA2
	#define D3 PORTA3
	#define D4 PORTA4
	#define D5 PORTA5
	#define D6 PORTA6
	#define D7 PORTA7

	#define ADDR_L PORTB
	#define A0 PORTB0
	#define A1 PORTB1
	#define A2 PORTB2
	#define A3 PORTB3
	#define A4 PORTB4
	#define A5 PORTB5
	#define A6 PORTB6
	#define A7 PORTB7

	#define ADDR_H PORTC
	#define A8 PORTC0
	#define A9 PORTC1
	#define A10 PORTC2
	#define A11 PORTC3
	#define A12 PORTC4
	#define A13 PORTC5
	#define A14 PORTC6

	//UART is on PortD so don't write to any other pins
	#define CONTROL PORTD
	#define N_OUTPUT PORTD5
	#define N_WRITE PORTD6
	#define N_ENABLE PORTD7
	
	void enableEEPROM();
	void disableEEPROM();
	void enableWrite();
	void disableWrite();
	void disableOutput();
	void enableOutput();
	
	uint8_t getData();
	void setAddresss(uint16_t a);
	void setControl();

	void writeData(uint8_t d, uint16_t a);
	uint8_t readData(uint16_t a);
	void init32Kwrite();
	void init32Kread();
	void disableSoftwareProtection();

#endif /* SRAM_H_ */