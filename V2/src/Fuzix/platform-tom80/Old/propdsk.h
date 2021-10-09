// Drivers for propeller disk
#ifndef PROPDSK_H_
#define PROPDSK_H_

 #include <pio.h>

int propdsk_open(uint_fast8_t minor, uint16_t flag);
int propdsk_close(uint_fast8_t minor);
int propdsk_read(uint_fast8_t minor, uint_fast8_t rawflag, uint8_t flag);
int propdsk_write(uint_fast8_t minor, uint_fast8_t rawflag, uint8_t flag);
int propdsk_ioctl(uint8_t minor, uarg_t request, char *data);

#endif
