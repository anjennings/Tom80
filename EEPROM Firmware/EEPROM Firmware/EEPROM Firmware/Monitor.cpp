/*
 * Monitor.cpp
 *
 * Created: 10/6/2020 7:08:16 PM
 *  Author: Aidan
 */ 

//#include "USART.h"
//#include "Monitor.h"
//#include "SRAM.h"
//#include <stdint-gcc.h>

#include "FIRMWARE.h"

#define BUFFSIZE 64

int systemBaud;

char buff[BUFFSIZE];
int buff_size;

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
		USART_print("\n\r?:");
		evaluateExpression(USART_receive());
		_delay_ms(100);
	}
}


int evaluateExpression(char i){
	
	USART_send(i);
	USART_print("\n\r");
	
	switch(i){
		
		case 'a' : 
			USART_print("\rbussy\n");
			break;
			
		case 'h' : 
			USART_print("\ra : bussy\n");
			USART_print("\rh : help\n");
			break;
			
		case 'w' :
			USART_print("\rNow in write mode:\n");
			break;
			
		case 'r' : 
			USART_print("\rNow in read mode:\n");
			break;
			
		default :
			USART_print("\rError : Unrecognized Instruction, type 'h' for help\n");
			break;
		
	}
	
}