/*
 * USART.h
 *
 * Created: 10/6/2020 7:00:37 PM
 *  Author: Aidan
 */ 

#ifndef USART_H_
#define USART_H_

#define F_CPU 14745600UL
#define BAUDRATE 38400
#define BAUD_SCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1)

void USART_init(void);

unsigned char USART_receive(void);

void USART_send( unsigned char data);

uint8_t USART_echo(uint16_t addr);

void USART_print(char * str);

#endif 