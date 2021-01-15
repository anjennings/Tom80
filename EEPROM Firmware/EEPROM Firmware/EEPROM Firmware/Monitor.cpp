/*
 * Monitor.cpp
 *
 * Created: 10/6/2020 7:08:16 PM
 *  Author: Aidan
 */ 

#include "FIRMWARE.h"

#define BUFFSIZE 64

#define i_READ 0x72		//r
#define i_WRITE 0x77	//w
#define i_DUMP 0x61		//a

int systemBaud;

char buff[BUFFSIZE];
int buff_size;

/*
	4-Byte Packet
	0 : Instruction
	1 : Address High
	2 : Address Low
	3 : Data (if write instruction)
*/
void monitor(){
	
	char iB[4];
	uint8_t bP = 0;
	
	while(1){
		
		*(iB + bP) = USART_receive();

		if(bP == 3){
			evaluateExpression(iB);
			bP = 0;
		}else{
			bP++;
		}
	}
	
}

void dumbMonitor(){
	
	uint16_t addr = 0;
	
	//The dumbest thing that should technically work
	while(1){
		writeData(USART_echo(addr), addr);
		addr++;
	}
	
}

void monitorLoop(){
	
	while(1){
	//	USART_print("\n\r?:");
	//	evaluateExpression(USART_receive());
	//	_delay_ms(100);
	}
}

void evaluateExpression(char *i){
	
	char inst = *i;
	uint8_t addr_l = ( (uint8_t)(*(i+2)) );
	uint8_t addr_h = ( (uint8_t)(*(i+1)) );
	uint16_t addr = addr_h;
	addr = ((addr<<8) | addr_l);
	uint8_t data = (*(i+3));
	
	switch(inst){
		case i_WRITE : 
			writeData(data, addr);
			USART_send('0');
			break;
		case i_READ : 
			USART_send(readData(addr));
			break;
		case i_DUMP :
			dump();
			break;
		default :
			USART_print("\rError\n");
			break;
	}
}

void dump(){
	
	USART_print("\rReading from EEPROM...\n");
	
	char snum[8];
	
	for(uint16_t j = 0; j < 0x100; j++){
		
		itoa(j, snum, 16);
		USART_print("\r0x");
		USART_print(snum);
		USART_print(" : 0x");
		
		itoa(readData(j), snum, 16);
		USART_print(snum);
		USART_print("\n");
		
	}
	
	//Finished
	USART_print("\rDone!\r\n\n");
	
}