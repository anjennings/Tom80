
#include <uart.h>
#include <printf.h>

__sfr __at _UART_DHR UART_DHR;
__sfr __at _UART_LSR UART_LSR;
__sfr __at _UART_MCR UART_MCR;

void uart_toggle_o1(){
	UART_MCR = (UART_MCR ^ 0x4);
}

void uart_toggle_o2(){
	UART_MCR = (UART_MCR ^ 0x8);
}

int uart_open(uint_fast8_t minor, uint16_t flag) {
#ifdef DDEBUG
	kprintf("UART: Something tried to open uart\n");
#endif
	return 0;
}

/*
int uart_write(uint_fast8_t minor, uint_fast8_t rawflag, uint_fast8_t flag){

	#ifdef DDEBUG	
	kprintf("UART: Somebody called uart.write\n");
	#endif
	if (rawflag == 1) {
		// udata.u_count - # bytes to transfer
		// udata.u_base - address to read from
		// udata.u_done - number of bytes written (?)
		// udata.u_offset - meaningless (?)
		for (udata.u_done = 0; udata.u_done < udata.u_count; udata.u_done++) {
			uart_putc(*(udata.u_base + udata.u_done));
		}
		return udata.u_done;
	} else {
		return -1;
	}
}*/

/*
int uart_read(uint_fast8_t minor, uint_fast8_t rawflag, uint_fast8_t flag) {
	
	#ifdef DDEBUG
	kprintf("uart_read called!\n");
	#endif
	if (rawflag == 1) {
		char c;
		while(udata.u_done < udata.u_count) {
			c = uart_getc();
			*(udata.u_base + udata.u_done) = c;
			udata.u_done++;
			if ((c == '\r') || (c == '\n'))
				break;
		}
		return udata.u_done;
	} else {
		udata.u_error = ENODEV;
		return -1;
	}
}*/

void uart_clr_dlab()
{
	UART_LSR = (UART_LSR & 0x7F);
}

// If bit 1 is set, there is new data to get
int uart_rdy2get()
{
	return ((UART_LSR & 0x1F) == 1);
}

// Put character into fifo
void uart_putc(char c) {
	UART_DHR = c;
}

char uart_getc() {
	return UART_DHR;
}


// Wait to get
char uart_getcw() {
	uart_clr_dlab();
	while (uart_rdy2get() == 0) {}
	return UART_DHR;
}
	
// Wait to put
void uart_putcw(char c)
{
	uart_clr_dlab();
	while(uart_rdy2send() == 0) {}
	UART_DHR = c;
}

// Return NZ if ready, 0 if otherwise
int uart_rdy2send()
{
	return (UART_LSR & 0x60);
}

// Should ONLY be called when you plan to exit fuzix from common mem.  This will CLOBBER user/kernel space
void enable_rom() {
	UART_MCR = (UART_MCR | 0x1);
}
