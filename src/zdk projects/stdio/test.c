#pragma printf = "%s"   // prune to required converters
#pragma scanf  = "%s"   // prune to required converters

#include <stdio.h>
#include "uart.h"

unsigned char buf[64];

void main(void){
	
	UART_INIT();
	
	while (1){
		//printf("Hello World!\r\n");

		//fflush(stdin);
		//scanf("%63s", buf);

		printf(getc(stdin));
	}
}
