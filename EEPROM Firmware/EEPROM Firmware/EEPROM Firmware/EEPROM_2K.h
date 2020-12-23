/*
 * EEPROM_2K.h
 *
 * Created: 12/22/2020 10:45:53 AM
 *  Author: Aidan
 */ 


#ifndef EEPROM_2K_H_
#define EEPROM_2K_H_


///New ones
#define D0 PORTB1
#define D1 PORTB0
#define D2 PORTA0
#define D3 PORTA5
#define D4 PORTA6
#define D5 PORTA7
#define D6 PORTD7
#define D7 PORTC2

#define A0 PORTB2
#define A1 PORTB3
#define A2 PORTB4
#define A3 PORTB5
#define A4 PORTB6
#define A5 PORTB7
#define A6 PORTC4
#define A7 PORTC6
#define A8 PORTD6
#define A9 PORTC5
#define A10 PORTC3

#define n_WE PORTC0
#define n_OE PORTC1
#define n_CE PORTD5
#define VSS PORTA1

void flush2K();
void enable2K();
void disable2K();
void enableWrite2K();
void disableWrite2K();
void disableOutput2K();
void enableOutput2K();

uint8_t getData();
void setAddresss2K(uint16_t a);
void setControl2K();
void setData2K(uint8_t d);

void writeData2K(uint8_t d, uint16_t a);
uint8_t readData2K(uint16_t a);
void init2Kwrite();
void init2Kread();


#endif /* EEPROM_2K_H_ */