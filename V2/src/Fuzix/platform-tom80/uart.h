#ifndef UART_H_
#define UART_H_

#include <kernel.h>
#include <kdata.h>

#define _UART_DHR	0x10
#define _UART_MCR	0x14
#define _UART_LSR	0x15

#define UART_BUF_LEN	10	// Arbitrary, theres buffers in the UART and the bridge

char uart_getc();
char uart_getcw();
void uart_putc(char c);
void uart_putcw(char c);
int uart_rdy2send();
int uart_rdy2get();
void enable_rom();
int uart_read(uint_fast8_t minor, uint_fast8_t rawflag, uint_fast8_t flag);
int uart_write(uint_fast8_t minor, uint_fast8_t rawflag, uint_fast8_t flag);
int uart_open(uint_fast8_t minor, uint16_t flag);
void uart_toggle_o1();
void uart_toggle_o2();

#endif
