#ifndef __DEVPROP_H__
#define __DEVPROP_H__

#include <printf.h>

extern int devprop_open(uint8_t minor, uint16_t flag);
extern int devprop_close(uint8_t minor);
extern int devprop_read(uint8_t minor, uint8_t rawflag, uint8_t flag);
extern int devprop_write(uint8_t minor, uint8_t rawflag, uint8_t flag);
extern int devprop_ioctl(uint8_t minor, uarg_t request, char *data);
#endif
