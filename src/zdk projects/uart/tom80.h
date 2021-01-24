#ifndef TOM80_H_
#define TOM80_H_

#include <stdlib.h>
#include <string.h>
#include "uart.h"

#define printf PRINTSTR

typedef enum {
	
	BLACK = '0',
	RED = '1',
	GREEN = '2',
	YELLOW = '3',
	BLUE = '4',
	PURPLE = '5',
	CYAN = '6',
	WHITE = '7'
	
} ANSII_COLOR;

void cls();
void setColor(ANSII_COLOR fg, ANSII_COLOR bg);
void putc(char c);
unsigned char getc();
void print(const char * s);
void getStr(char * buf);
void plotc(char c, int x, int y);
void plotStr(char * s, int x, int y);
void monitor(char * buf);
void HALT();
void evaluateStmt(char * buf);
char getArrow();
void simpleLoop();

#endif	//	TOM80_H_