

#define UART_DHR 0 		//UART Data R/W register
#define UART_IER 1 		//Interrupt Enable Register
#define UART_IFR 2 		//Interrupt ID Reg (READ), FIFO Control Reg (WRITE)
#define UART_LCR 3 		//Line Control Register
#define UART_MCR 4 		//Modem Control
#define UART_LSR 5 		//Line Status Register
#define UART_MSR 6 		//Modem Status (Unused)
#define UART_SCR 7 		//Arbitrary data can be stored here

#define BAUD_DIV_HIGH 0
#define BAUD_DIV_LOW 8

//First byte of term buf is the size of the term buf
#define TERM_BUF equ 0x8000

///////////////////////////////////////
//UART Functions
///////////////////////////////////////

void UART_INIT();
void UART_CLEAR_DLAB() __z88dk_callee;
void UART_SET_DLAB() __z88dk_callee;
void UART_SET_LINE_CONTROL() __z88dk_callee;
void UART_DISABLE_FIFO() __z88dk_callee;
void UART_SET_BAUD() __z88dk_callee;
void UART_CLEAR_LSR() __z88dk_callee;
void UART_TOGGLE_OUT1() __z88dk_callee;
void UART_TOGGLE_OUT2() __z88dk_callee;
char GETCH() __z88dk_callee;
void WRITE_BUFFER() __z88dk_callee;
void PRINTCH() __z88dk_callee;
void trsmtc(char c) __z88dk_callee;
void trsmtStatWait() __z88dk_callee;

void printc(char c);

void UART_INIT(){
	
    UART_CLEAR_DLAB();
    UART_DISABLE_FIFO();
    UART_SET_LINE_CONTROL();
    UART_TOGGLE_OUT1();
    UART_TOGGLE_OUT2();
    UART_CLEAR_LSR();
    UART_SET_DLAB();
    UART_SET_BAUD();
    UART_CLEAR_DLAB();

}

void UART_CLEAR_LSR() __z88dk_callee{
	__asm
    PUSH AF
    IN A, (UART_LSR)
    POP AF
    RET
	__endasm
}

void UART_SET_BAUD() __z88dk_callee{
	__asm
    PUSH AF
    LD A, BAUD_DIV_LOW
    OUT (UART_DHR), A
    LD A, BAUD_DIV_HIGH
    OUT (UART_IER), A
    POP AF
    RET
	__endasm
}

void UART_DISABLE_FIFO() __z88dk_callee{
	__asm
    PUSH AF
    LD A, 0x6
    OUT (UART_IFR), A
    POP AF
    RET
	__endasm
}

void UART_SET_LINE_CONTROL(){
	__asm
    PUSH AF
    LD A, 0x3         //8 Bit word, 1 stop, no parity
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_CLEAR_DLAB(){
	__asm
	push AF
    IN A, (UART_LCR)
    AND 0x7F
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_SET_DLAB(){
	
	__asm
	PUSH AF
    IN A, (UART_LCR)
    OR 0x80
    OUT (UART_LCR), A
    POP AF
    RET
	__endasm
}

void UART_TOGGLE_OUT1(){
	__asm
    PUSH AF
    IN A, (UART_MCR)
    XOR 0x4
    OUT (UART_MCR), A
    POP AF
    RET
	__endasm
}

void UART_TOGGLE_OUT2(){
	__asm
    PUSH AF
    IN A, (UART_MCR)
    XOR 0x8
    OUT (UART_MCR), A
    POP AF
    RET
	__endasm
}


///////////////////////////////////////
//Get a character from the FIFO, add to write buffer and echo to screen
///////////////////////////////////////
char GETCH(){
	__asm
    PUSH BC

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
    CALL _WRITE_BUFFER
    CALL _UART_TOGGLE_OUT2

    GETCH_END:
    POP BC
    RET
	__endasm
}

////////////////////////////////////////
//Write a charactar to the terminal buffer, and echo to screen
//expects A to be the character
//Only ever called from GETCH, but argument passing should be added later
//TODO: completely rewrite this, its a mess
///////////////////////////////////////
void WRITE_BUFFER(){
	
	/*
	__asm
    PUSH AF
    PUSH BC
    PUSH DE

    //Save character in D
    LD D, A
    //Load address of terminal buffer
    LD BC, TERM_BUF
    //Get size of terminal buffer
    LD A, (BC)
    //Add 1
    INC A
    //Write new length to start of buffer
    LD (BC), A
    //Add A and C for new offset (C should be 0 but just in case)
    ADD A, C
    //Put A into C
    LD C, A
    //Put char back into A
    LD A, D
    //Write to buffer
    LD (BC), A

    CALL _PRINTCH

    POP DE
    POP BC
    POP AF
    RET
	__endasm
	*/
}

//////////////////////////////////////////
//Print Character
//Assumes that A is the charactar to write
//TODO: rewrite to handle stack argument passing
//TODO: Create a function for what goes on in the loop
///////////////////////////////////////////
void PRINTCH(){
	__asm
    PUSH AF

    CALL _UART_CLEAR_DLAB

    PRINTCH_LOOP:
        //Read transmit register status in line status register
        IN A, (UART_LSR)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP

    //Write Char to UART
    POP AF
    OUT (UART_DHR), A
    RET
	__endasm
}

void printc(char c){
	
	UART_CLEAR_DLAB();
	trsmtStatWait();
	trsmtc(c);
	
}

void trsmtc(char c){
	__asm
	//Get value passed into Reg A
	LD HL, 2
	ADD HL, SP
	LD A, (HL)
	OUT (UART_DHR), A
	RET
	__endasm
}

void trsmtStatWait() __z88dk_callee{	
	__asm
	trsmtStatWait_LOOP:
        //Read transmit register status in line status register
        IN A, (UART_LSR)
        AND 0x60
        CP 0x60
        JP NZ, PRINTCH_LOOP
	__endasm	
}

void init(){
	
	__asm
	LD HL, 0x0000
    LD SP, HL
	DI
	__endasm
	
	UART_INIT();
	
}
	
int main(){
	init();
	while(1){
		printc('a');
	}
}