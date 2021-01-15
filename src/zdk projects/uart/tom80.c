#include "tom80.h"

void cls(){
	PRINTSTR("\033[2J");
}

void PRINTCH(char c){
	__asm
    //PUSH AF
	//PUSH HL

	//Clear DLAB
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A

    PRINTCH_LOOP:
        //Read transmit register status in line status register
        IN A, (UART_LSR)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    //Write Char to UART
    LD HL, 2
	ADD HL, SP
	LD A, (HL)
    OUT (UART_DHR), A
	//POP HL
	//POP AF
    RET
	__endasm
}

unsigned char GETCH(){
	__asm
	
	PUSH AF
    CALL _UART_CLEAR_DLAB

    GETCH_LOOP:
        //Read Line Status Reg
        IN A, (UART_LSR)
        //If only bit 1 is set then FIFO has new data
        AND 0x1F
        CP 1
        JP NZ, GETCH_LOOP

    //Get next char from data holding register
    IN A, (UART_DHR)
	LD HL, 0x0000
	LD L, A
    CALL _UART_TOGGLE_OUT2

    GETCH_END:
	POP AF
    RET
	__endasm
}

void PRINTSTR(const char * s){
	
	for(int i = 0; s[i] != '\0'; i++){
		PRINTCH(s[i]);
	}
	
}

void getStr(char * buf){
	
	char c = 0;
	int size = 0;
	int run = 1;
	
	while(c != '\r'){
		c = GETCH();
		PRINTCH(c);
		buf[size] = c;
		size++;
	}
	
	buf[size] = '\0';
	
	PRINTCH('\n');
	UART_TOGGLE_OUT1();
	
}

void evaluateStmt(char * buf){
	
	PRINTCH('\r');
	
	for(int i = 0; buf[i] != '\r'; i++){
		PRINTCH(buf[i]);
	}
	
	PRINTCH('\n');
	PRINTCH('\r');
}

void monitor(char * buf){
	
	getStr(buf);
	evaluateStmt(buf);
	
}

void putc(char c, int x, int y){
	
	char tx[8];
	char ty[8];
	
	itoa(x, &tx, 10);
	itoa(y, &ty, 10);
	
	PRINTSTR("\033[");
	PRINTSTR(ty);
	PRINTSTR(";");
	PRINTSTR(tx);
	PRINTSTR("H");
	PRINTCH(c);
	
}

void putstr(char * s, int x, int y){
	
	for(int i = 0; s[i] != '\0'; i++){
		putc(s[i], x+i, y);
	}
	
}

void setColor(ANSII_COLOR fg, ANSII_COLOR bg){


	//Reset everything
	PRINTSTR("\033[");
	PRINTSTR("0");
	PRINTSTR("m");
	
	//Print New Color
	PRINTSTR("\033[");
	PRINTSTR("3");
	PRINTCH(fg);
	PRINTSTR(";");
	PRINTSTR("4");
	PRINTCH(bg);
	PRINTSTR("m");


}

void HALT(){
	__asm
	HALT
	__endasm
}