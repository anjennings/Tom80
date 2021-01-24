#include "tom80.h"

void cls(){
	print("\033[2J");
}

void putc(char c){
	__asm

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
	
	CALL _UART_TOGGLE_OUT1

    RET
	__endasm
}

unsigned char getc(){
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

void print(const char * s){
	
	for(int i = 0; s[i] != '\0'; i++){
		putc(s[i]);
	}
	
}

void getStr(char * buf){
	
	char c = 0;
	int size = 0;
	int run = 1;
	
	while(c != '\r'){
		c = getc();
		putc(c);
		buf[size] = c;
		size++;
	}
	
	buf[size] = '\0';
	
	print('\n');
	
}

void plotc(char c, int x, int y){
	
	char tx[8];
	char ty[8];
	
	itoa(x, &tx, 10);
	itoa(y, &ty, 10);
	
	print("\033[");
	print(ty);
	print(";");
	print(tx);
	print("H");
	putc(c);
	
}

void plotStr(char * s, int x, int y){
	
	for(int i = 0; s[i] != '\0'; i++){
		plotc(s[i], x+i, y);
	}
	
}

void setColor(ANSII_COLOR fg, ANSII_COLOR bg){

	//Reset everything
	print("\033[");
	print("0");
	print("m");
	
	//Print New Color
	print("\033[");
	print("3");
	putc(fg);
	print(";");
	print("4");
	putc(bg);
	print("m");


}

void HALT(){
	__asm
	HALT
	__endasm
}

void simpleLoop(){
	uint8_t x = 5;
	uint8_t y = 5;
	uint8_t ox, oy;
	
	
	while(1){
		
		ox = x;
		oy = y;
		
		switch(getArrow()){
			case 0:
				plotc("NONE", 3, 1);
				break;
			case 1:
				y--;
				break;
			case 2:
				y++;
				break;
			case 3:
				x++;
				break;
			case 4:
				x--;
				break;
			default:
				plotc("ERROR", 2, 1);
				break;
		}
		plotc(" ", (ox%32), (oy%16));
		plotc("A", (x%32), (y%16));
		plotc(" ", 1, 1);
	}
}

char getArrow(){
	
	if(getc() == '\033'){
	
	
		//Ignore the '['
		getc();
		
		switch(getc()) {
			case 'A':
				return 1;
				break;
			case 'B':
				return 2;
				break;
			case 'C':
				return 3;
				break;
			case 'D':
				return 4;
				break;
			default:
				return 0;
				break;
		}
	}
	
	return 0;
	
}