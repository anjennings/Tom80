#include <propdsk.h>
#include <pio.h>

int propdsk_open(uint_fast8_t foobarg, uint16_t flag)
{
	return (minor == 2) ? 0 : -1;
}

// is this even needed? the disk should never 'close'
int propdsk_close(uint_fast8_t minor)
{
	return 0;
}

int propdsk_read(uint_fast8_t minor, uint_fast8_t rawflag, uint16_t flag)
{
	return 0;
}

int propdsk_write(uint8_t minor, uint8_t rawflag, uint16_t flag)
{
	return 0;
}

int propdsk_ioctl(uint8_t minor, uarg_t request, char *data) {
	if (request == FDIO_GETCAP) {
		// TODO
	} else if (request == FDIO_GETMODE) {
		// TODO
	}
}
