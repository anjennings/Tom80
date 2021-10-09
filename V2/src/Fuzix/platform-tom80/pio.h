#ifndef PIO_H_
#define PIO_H_

#include <kernel.h>

#define PIO_BASE 		0
#define PIO_PORTA_DAT		(PIO_BASE)
#define PIO_PORTB_DAT		(PIO_BASE+1)
#define PIO_PORTA_CON		(PIO_BASE+2)
#define PIO_PORTB_CON		(PIO_BASE+3)

#define PIO_INT_PAGE		0xFF
#define PIO_INT_VECT		0xF0
#define PIO_INT_VECT_A		(PIO_INT_VECT & 0xFE)

#define PIO_MODE_BI		0x8F
#define PIO_INT_EN_A		0x87

void pio_putb(uint_fast8_t b);
char pio_getb();
void pio_set_int_a(char i);
void pio_set_int_b(char i);
void pio_init_bi();
void pio_read_sector(char *data, uint16_t offset);
void pio_write_sector(char *data);
void pio_commit();
void pio_settrk(uint_fast8_t track);
void pio_setsect(char sector);
void pio_mountfs();

#endif
