#include <kernel.h>
#include <kdata.h>
#include <printf.h>
#include <stdbool.h>
#include <devtty.h>
#include <tty.h>
#include <input.h>
#include <uart.h>
#include <pio.h>
#include <devprop.h>

#define TTY_SER	1

static uint16_t tty_present = 0x06;	/* One serial, one floppy */

extern unsigned char irqvector;

// Device buffers
static uint8_t tbuf1[TTYSIZ];
static uint8_t tbuf2[TTYSIZ];

static uint8_t sleeping;

struct s_queue ttyinq[NUM_DEV_TTY + 1] = {	/* ttyinq[0] is never used */
	{NULL, NULL, NULL, 0, 0, 0},
	{tbuf1, tbuf1, tbuf1, TTYSIZ, 0, TTYSIZ / 2},
};

tcflag_t termios_mask[NUM_DEV_TTY + 1] = {
	0,
	_CSYS,
};

/* Output for the system console (kprintf etc) */
// Should block
void kputchar(uint_fast8_t c)
{
	while(!uart_rdy2send()){};
	uart_putc(c);
}


ttyready_t tty_writeready(uint_fast8_t minor)
{
	if (uart_rdy2send()) {
		return TTY_READY_NOW;
	}
	return TTY_READY_SOON;
}

// Does not block, drop data if busy
void tty_putc(uint_fast8_t minor, uint_fast8_t c)
{
	if (uart_rdy2send())
		uart_putc(c);
}

int tty_carrier(uint_fast8_t minor)
{
	return 1;
}

void tty_setup(uint_fast8_t minor, uint_fast8_t flags)
{
	// called before open (?)
}


void tty_sleeping(uint_fast8_t minor) {
	sleeping |= (1 << minor);
}

void tty_data_consumed(uint8_t minor) {
	used(minor);
}

void platform_interrupt() {

	// keep stack use low
	// timer_interrupt should be the last thing called in its handler
	static uint8_t tickCount = 0;

	// Poll 16550 since it has no interrupt line
	// call tty_inproc in uart handler
	if (uart_rdy2get()) {
		tty_inproc(1, uart_getc());
	}

	//kprintf("\nint!\n");

	switch(irqvector) {
		case 0:			// CTC 0
		case 1:			// CTC 1
			if ((tickCount++) == 120) {
				tickCount = 0;
				uart_toggle_o1();
			}

			timer_interrupt();
			return;
		default:
			return;
	}	
}
