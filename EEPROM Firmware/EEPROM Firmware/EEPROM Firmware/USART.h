/*
 * USART.h
 *
 * Created: 10/6/2020 7:00:37 PM
 *  Author: Aidan
 */ 


#ifndef USART_H_
#define USART_H_

//Placeholder baud, check MCP2221 sheet for best
#define main_baud (clock/128)

void USART_Init( unsigned int baud );

void USART_Transmit( unsigned char data );

unsigned char USART_Receive( void );

void USART_PrintStr(char s[]);


#endif /* USART_H_ */