#include <kernel.h>
#include <version.h>
#include <kdata.h>
#include <devprop.h>
#include <pio.h>
#include <diskgeom.h>
#include <tty.h>
#include <ctc.h>
#include <uart.h>

int devprop_open(uint8_t minor, uint16_t flag)
{
	// Open filesystem
	ei();
	pio_mountfs();
	return 0;
}

int devprop_close(uint8_t minor)
{
	// Commit write, do not actually close the disk
	pio_commit();
	return 0;
}

int devprop_read(uint8_t minor, uint8_t rawflag, uint8_t flag)
{
	int ret = -1;

	uart_toggle_o2();

	if (rawflag == 0) {
		// Block IO
		// udata.u_buf - disk buffer 
		// udata.u_block - block number (uint16_t)
		// udata.u_blkoff - offset within the block (uint16_t)
		// udata.u_nblock - number of blocks (uint16_t) (should not be more than 256)
		// udata.u_dptr - address to begin read/write
	
		uint16_t offset = udata.u_blkoff;
		
		#ifdef DDEBUG
		kprintf("RD #%d\n", udata.u_block);
		#endif

		for(uint16_t i = 0; i < udata.u_nblock; i++) {
			pio_settrk(((udata.u_block+i)>>8));  // TODO: this can be sped up
			pio_setsect(((udata.u_block+i)&0xFF));
			pio_read_sector(udata.u_dptr, offset);
			udata.u_dptr += (512 - offset);
			offset = 0;
		}	

		// TODO: only multiply if needed to save time
		ret = (512 * udata.u_nblock);

	} else if (rawflag == 1) {
		#ifdef DDEBUG
		kprintf("charIO FD %d, %d, %d\n", udata.u_count, udata.u_base, udata.u_offset);
		#endif
		udata.u_error = ENODEV;

	} else {
		udata.u_error = ENODEV;
	}

	return ret;
}

int devprop_write(uint8_t minor, uint8_t rawflag, uint8_t flag)
{
	kprintf("devprop_write called!\n");
	int ret = -1;

	if (rawflag == 0) {

		// Block IO
                // udata.u_buf - disk buffer 
                // udata.u_block - block number (uint16_t)
                // udata.u_blkoff - offset within the block (uint16_t)
                // udata.u_nblock - number of blocks (uint16_t) (should not be more than 256)
                // udata.u_dptr - address to begin read/write
		
		//int offset = udata.u_blkoff;

		for(uint16_t i = 0; i < udata.u_nblock; i++) {
			pio_settrk(((udata.u_block+i)>>8));
			pio_setsect(((udata.u_block+i)&0xFF));
			pio_write_sector(udata.u_dptr);
			udata.u_dptr += 512;
		}
		// TODO: only multiply when needed
		ret = (512 * udata.u_nblock);

	} else {
		kprintf("devprop_write: non block flag!\n");
		udata.u_error = ENODEV;
	}
	return ret;
}

int devprop_ioctl(uint8_t minor, uarg_t request, char *data)
{
	// TODO ?
	kprintf("devprop_ioctl called!\n");
	return 0;
}
