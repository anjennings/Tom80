/*
 * EEPROM_2K.cpp
 *
 * Created: 12/22/2020 10:42:52 AM
 *  Author: Aidan
 */ 

//DO NOT WRITE TO PORTD AS A SINGAL LOCAITON
//ONLY WRITE TO SPECIFIC PINS TO PREVENT FROM FUCKING THE UART

//DO NOT WRITE TO PORTA AS A SINGAL LOCATION EITHER
//PIN1 MUST HOLD AT 0V WHEN WRITING TO THE 2K ROM


/**
	flush():
	
	Set all pins to 0 to prevent floating values
	Assumes that we are already in 'write mode'

**/
/*
void flush2K(){
	
	//Put all control pins in a known state
	disableEEPROM();
	disableWrite();
	disableOutput();
	
	//Clear the data/address lines
	setData2K(0);
	setAddresss2K(0);

}

void enable2K(){
	DDRD |= (1 << n_CE);	//Set pin to output (if not already)
	PORTD &= ~(1 << n_CE);	//Set Enable pin low
}

void disable2K(){
	DDRD |= (1 << n_CE);	//Set pin to output (if not already)
	PORTD |= (1 << n_CE);	//Set Enable pin high
}

void enableWrite2K(){
	DDRC |= (1 << n_WE);	//Set pin to output (if not already)
	PORTC &= ~(1 << n_WE);	//Set Enable pin low
}

void disableWrite2K(){
	DDRC |= (1 << n_WE);	//Set pin to output (if not already)
	PORTC |= (1 << n_WE);	//Set Enable pin high
}

void enableOutput(){
	DDRC |= (1 << n_OE);	//Set pin to output (if not already)
	PORTC &= ~(1 << n_OE);	//Set Enable pin low
}

void disableOutput(){
	DDRC |= (1 << n_OE);	//Set pin to output (if not already)
	PORTC |= (1 << n_OE);	//Set Enable pin low
}

uint8_t getData(){
	
	uint8_t a,b,c,d;
	
	DDRA &= ~((1<<D2)|(1<<D3)|(1<<D4)|(1<<D5));		//Set pins low
	DDRB &= ~((1<<D0)|(1<<D1));						//Set pins low
	DDRC &= ~(1<<D7);								//Set pins low
	DDRD &= ~(1<<D6);								//Set pins low
	
	_delay_ms(1);	//need to wait a bit for the port state to change
	
	a = ((1<<D2)|(1<<D3)|(1<<D4)|(1<<D5)) & PINA;
	b = ((1<<D0)|(1<<D1)) & PINB;
	c = (1<<D7) & PINC;
	d = (1<<D6) & PIND;
	
	return (a|b|c|d);
}

void setAddresss(uint16_t a){
	DDRB = 0xff;
	DDRC = 0xff;
	ADDR_H = (uint8_t)((a >> 8) & 0xff);
	ADDR_L = (uint8_t)(a & 0xff);
}

void setData(uint8_t d){
	
	DDRA |= ((1<<D2)|(1<<D3)|(1<<D4)|(1<<D5));		//Set pins high
	DDRB |= ((1<<D0)|(1<<D1));						//Set pins high
	DDRC |= (1<<D7);								//Set pins high
	DDRD |= (1<<D6);								//Set pins high
	
	_delay_ms(1);	//need to wait a bit for the port state to change
	
	PINA = d & ((1<<D2)|(1<<D3)|(1<<D4)|(1<<D5));	//Just assign
	PINB = d & ((1<<D0)|(1<<D1));					//Just assign
	PINC = d & (1<<D7);								//Just assign
	
	//Again, can't just assign to port D
	PIND &= ~(1<<D6);								//Clear the specific pin
	PIND |= d & (1<<D6);							//Set to the desired value
}

void writeData(uint8_t d, uint16_t a){
	
	
	//Set up control pins
	setControl();
	
	//Zero out all of the lines and disable all controls
	flush();
	
	//See waveform on page 13 of datasheet
	disableOutput();
	setAddresss(a);
	enableEEPROM();
	
	//I have no idea why but that 10 is pretty important
	_delay_ms(8);	//T-CS
	
	enableWrite();
	setData(d);
	disableWrite();
	disableEEPROM();
	
	//Leave the chip alone
	flush();
	disableEEPROM();
	disableOutput();
	disableWrite();
	
}

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
	disableEEPROM();
	disableOutput();
	disableWrite();
	flush();
	return val;
	
}

void init2Kwrite(){
	
	//Set GPIO Direction
	DDRA = (0xff);	//All Pins Out
	DDRB = (0xff);	//All Pins Out
	DDRC = (0xff);	//All Pins Out
	setControl();

	//Put all control pins in a known state
	disableEEPROM();	
	disableWrite();	
	disableOutput();

}

void init2Kread(){
	
	setControl();

	//Put all control pins in a known state
	disableEEPROM();
	disableWrite();
	disableOutput();
}
*/