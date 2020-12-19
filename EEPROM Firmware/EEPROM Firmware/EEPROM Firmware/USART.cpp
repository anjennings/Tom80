//#include "avr\io.h"
//#include "USART.h"
//#include <stdlib.h>
//#include <util/delay.h>

#include "FIRMWARE.h"

//* Initialize USART */
void USART_init(void){
	UBRRH = (uint8_t)(BAUD_SCALLER>>8);
	UBRRL = (uint8_t)(BAUD_SCALLER);
	UCSRB = (1<<RXEN)|(1<<TXEN);
	UCSRC = (1<<UCSZ0)|(1<<UCSZ1)|(1<<URSEL);
}

unsigned char USART_receive(void){
	while(!(UCSRA & (1<<RXC)));
	return UDR;
}

void USART_send( unsigned char data){
	while(!(UCSRA & (1<<UDRE)));
	UDR = data;
	//_delay_ms(10);
}

uint8_t USART_echo(uint16_t addr){
	
	char snum[5];
	char a = USART_receive();
	
	//Print the char
	USART_print("\n\rrecieved : ");
	USART_send(a);
	
	//Print the hex val
	USART_print(" : 0x");
	itoa((int)a, snum, 16);
	USART_print(snum);
	
	//Print the address
	USART_print(" : Address 0x");
	itoa(addr, snum, 16);
	USART_print(snum);
	
	return (uint8_t)a;
}

void USART_print(char * str){
	while(*str != 0){
		USART_send(*str);
		str++;
	}	
}