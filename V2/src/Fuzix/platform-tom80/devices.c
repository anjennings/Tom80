#include <kernel.h>
#include <version.h>
#include <kdata.h>
#include <tty.h>
#include <devfd.h>
#include <devsys.h>
#include <devtty.h>
#include <blkdev.h>
#include <uart.h>
#include <devprop.h>
#include <ctc.h>

extern uint16_t * ctc1_int_v;

struct devsw dev_tab[] =  /* The device driver switch table */
{
// minor    open         close        read      write       ioctl
// -----------------------------------------------------------------
  /* 0: /dev/hd		Hard disc block devices (hdx - not supported yet) */
  {  devprop_open, devprop_close, devprop_read, devprop_write, devprop_ioctl }, //blkdev_ioctl   },
  /* 1: floppy disk */
  {  devprop_open, devprop_close, devprop_read, devprop_write, devprop_ioctl },
  /* 2: tty serial */
  {  tty_open, tty_close, tty_read, tty_write, no_ioctl  },//{  uart_open, no_close, uart_read, uart_write,    no_ioctl  },
//  {  no_open,      no_close,    no_rdwr,  no_rdwr,    no_ioctl  },
//  {  no_open,      no_close,    no_rdwr,  no_rdwr,    no_ioctl  },
};

// Cut and paste boilerplate
bool validdev(uint16_t dev)
{
    /* This is a bit uglier than needed but the right hand side is
       a constant this way */
    if(dev > ((sizeof(dev_tab)/sizeof(struct devsw)) << 8) - 1)
	return false;
    else
        return true;
}

void device_init(void)
{
	/* Called before init before devices are opened */
	//ctc_init();
	// uart should not need an init but if it does, do it here
}
