/*
 * Monitor.cpp
 *
 * Created: 10/6/2020 7:08:16 PM
 *  Author: Aidan
 */ 

#include "USART.h"
#include "Monitor.h"
#include "SRAM.h"
#include <stdint-gcc.h>

#define BUFFSIZE 64

int systemBaud;

char buff[BUFFSIZE];
int buff_size;

void dumbMonitor(){
	
	uint16_t addr = 0;
	uint8_t data;
	
	//The dumbest thing that should technically work
	while(1){
		
		data = USART_Receive();
		
		writeData(data, addr);
		USART_Transmit(data);
		USART_Transmit('\n');
		addr++;
		
	}
	
}

void monitorInit(){
	
	USART_PrintStr("Pingas");
	buff_size = 0;
	
}

void monitorLoop(){
	
	char tmp;
	//int result;
	
	while(1){
		
		tmp = USART_Receive();
		buff[buff_size] = tmp;
		buff_size = (buff_size+1)%BUFFSIZE;
		
		if(tmp == '\r' || tmp == '\n'){
			//evaluate the buffer
			evaluateExpression(buff);
		}
		
	}
	
}

/*
int evaluateExpression(char *b){
	
	//First char is the instruction
	//a - read
	//	a 0000:ffff
	//b - write
	//	only to be used by external software, not to be used by user via serial
	
	char numberBuf[4];
	uint16_t start;
	uint16_t end;
	bool fail = false;
	uint8_t charVal;
	
	
	switch(*b) {
		
		case 'a':
		
			//Jump forward 2 chars
			b += 2;
		
			for(int i=0; (i < 4)|(*b != ':'); i++){
				
				//convert char to int
				charVal = (uint8_t)*b
				
				//check if numerical
				if((charVal >= 48) & (charVal <= 57)){
					numberBuf[i] = *b;
				}else{
					fail = true;
					break;
				}
			
			}
		
			break;
			
		case 'b':
			//go to some subroutine for writing, users should NOT be using this
			break;
		
	}
	
	if(fail){
		USART_PrintStr("THAT ISN'T A VALID INSTRUCTION");
	}
	
	
}*/