#ifndef PS2_H_
#define PS2_H_

#include "simpletools.h"

#define PS2_CLK 	12
#define PS2_DAT		13

#define PACKET_SIZE	11
#define BUFF_SIZE 	32

uint8_t MonitorWire();

#endif	//PS2.h