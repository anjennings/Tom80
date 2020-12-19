/*
 * FIRMWARE.h
 *
 * Created: 12/18/2020 10:52:10 AM
 *  Author: Aidan
 */ 


#ifndef FIRMWARE_H_
#define FIRMWARE_H_

#define F_CPU 14745600UL
#define BAUDRATE 19200
#define BAUD_SCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1)

#include "USART.h"
#include "MAIN.h"
#include "Monitor.h"
#include "SRAM.h"

#include "avr\io.h"

#include <stdio.h>
#include <stdint-gcc.h>
#include <stdlib.h>
#include <util/delay.h>


#endif /* FIRMWARE_H_ */