#ifndef __DEVTTY_DOT_H__
#define __DEVTTY_DOT_H__

#include <kernel.h>
#include <kdata.h>
#include <tty.h>

extern void kputchar(uint_fast8_t c);
extern void tty_interrupt(int INT_ID);
extern void tty_putc(uint_fast8_t minor, unsigned char c);
ttyready_t tty_writeready(uint_fast8_t minor);
void tty_sleeping(uint_fast8_t minor);
int tty_carrier(uint_fast8_t minor);
void tty_setup(uint_fast8_t minor, uint_fast8_t flags);

extern uint8_t outputtty;

#endif
