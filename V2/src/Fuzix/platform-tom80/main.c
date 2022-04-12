#include <kernel.h>
#include <timer.h>
#include <kdata.h>
#include <printf.h>
#include <devtty.h>
#include <devfd.h>
#include <uart.h>
#include <tty.h>

uint16_t ramtop = PROGTOP;
struct blkbuf *bufpool_end = bufpool + NBUFS;

void platform_idle(void)
{
	// Check the fifo while idle
	if (uart_rdy2get()) {
		tty_inproc(1, uart_getc());
	}
}

// Do something to get user's attention
void do_beep(void){
	uart_toggle_o2();
}

void pagemap_init(void) {
	for(int i = 1; i < MAXPAGES; i++)
		pagemap_add(i);
}

void platform_discard(void) {
	return;
}

// No idea why it wants this
uint8_t platform_canswapon(uint16_t dev) {
	return -1;
}

void swapper(ptptr p)
{
	p;
}
