/*
 * USART.cpp
 *
 * Created: 10/6/2020 6:55:02 PM
 *  Author: Aidan
 */ 	
#include "avr\io.h"


/*
 * Initialize USART 
 */
void USART_Init( unsigned int baud )
{
	/* Set baud rate */
	UBRRH = (unsigned char)(baud>>8);
	UBRRL = (unsigned char)baud;
	/* Enable receiver and transmitter */
	UCSRB = (1<<RXEN)|(1<<TXEN);
	/* Set frame format: 8data, 2stop bit */
	UCSRC = (1<<URSEL)|(1<<USBS)|(3<<UCSZ0);
}

/*
 *	Send a single character via UART
 */
void USART_Transmit( unsigned char data )
{
	/* Wait for empty transmit buffer */
	while ( !( UCSRA & (1<<UDRE)) )
	;
	/* Put data into buffer, sends the data */
	UDR = data;
}

/*
 *	Wait until a single character has been received and return
 */
unsigned char USART_Receive( void )
{
	/* Wait for data to be received */
	while ( !(UCSRA & (1<<RXC)) )
	;
	/* Get and return received data from buffer */
	return UDR;
}

void USART_PrintStr(char s[]){
	
	for(int i = 0; s[i] != '\0'; i++){
		USART_Transmit(s[i]);
	}
}