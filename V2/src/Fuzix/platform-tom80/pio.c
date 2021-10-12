#include <pio.h>
#include <devtty.h>
#include <printf.h>

#define	PROP_SETTRK	0x90
#define PROP_SETSEC	0x91
#define PROP_SELDSK	0x92
#define PROP_PREP_READ	0x93
#define PROP_PREP_WRITE	0x95
#define PROP_WRITE_NEXT 0x96
#define PROP_WRITE_FIN	0x97

#define PROP_SECT_SIZE	512

__sfr __at PIO_PORTA_DAT PORTA_D;
__sfr __at PIO_PORTA_CON PORTA_C;

__sfr __at PIO_PORTB_DAT PORTB_D;
__sfr __at PIO_PORTB_CON PORTB_C;

extern unsigned volatile char pio_wait_in;
extern unsigned volatile char pio_wait_out;

// Send raw byte to PIO
void pio_putb(char b)
{
	//kprintf("\np %x, %d, %d", b, pio_wait_in, pio_wait_out);
	ei();
	while (pio_wait_out) {}
	pio_wait_out = 0xFF;
	PORTA_D = b;

	/*
	__asm
		LD IY, #2
		ADD IY, SP

		LD A, (IY)
		OUT (_PORTA_D), A
		EI
		HALT
		DI
	__endasm;*/
}

// Get byte from PIO
char pio_getb() 
{
	ei();
	while (pio_wait_out) {}
	//while (pio_wait_in) {}
	//pio_wait_in = 0xFF;

	__asm
		EI
		HALT
		//DI

		IN A, (_PORTA_D)
		LD L, A
	__endasm;
	
}

// Read from currently selected track/sect
void pio_read_sector(char *data, uint16_t offset) {

	pio_putb(PROP_PREP_READ);
	for (int j = 0; j < offset; j++) {
		pio_getb();
	}
	for (int i = 0; i < (PROP_SECT_SIZE-offset); i++) {
	       *(data+i) = pio_getb();
	}
}

// Write to currently selected track/sect
void pio_write_sector(char *data) {
	pio_putb(PROP_PREP_WRITE);
	for (int i = 0; i < PROP_SECT_SIZE; i++) {
		pio_putb(PROP_WRITE_NEXT);
		pio_putb(*(data+i));
	}
	pio_putb(PROP_WRITE_FIN);
}

// Set track
void pio_settrk(uint_fast8_t track){
	//kprintf("DEBUG: settrk %d\n", track);
	pio_putb(PROP_SETTRK);
	pio_putb(track);
}

// Set sector
void pio_setsect(char sector) {
	//kprintf("DEBUG: setsec %d\n", sector);
	pio_putb(PROP_SETSEC);
	pio_putb(sector);
}

void pio_mountfs() {
	pio_putb(0x92);
	pio_putb(0xF);	// F for Fuzix
}

void pio_commit() {
	pio_putb(PROP_WRITE_FIN);
}

// Set PIO interrupt vector on port A
void pio_set_int_a(char i)
{
	PORTA_C = (i & 0xFE);
}

// Set PIO interrupt vector on port B
void pio_set_int_b(char i)
{
	PORTB_C = (i & 0xFE);
}

// Only sets up port A, probably not needed
void pio_init_bi()
{
	// Page should already be set
	pio_set_int_a((char)PIO_INT_VECT_A);
	PORTA_C = PIO_MODE_BI;
	PORTA_C = PIO_INT_EN_A;
	int a = PORTA_D;
}
		

