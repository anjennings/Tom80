/*
 * FIRMWARE.h
 *
 * Created: 12/18/2020 10:52:10 AM
 *  Author: Aidan
 */ 

//One big include file for all items in the project

#ifndef FIRMWARE_H_
#define FIRMWARE_H_

//#define F_CPU 14745600UL
//#define BAUDRATE 19200
//#define BAUD_SCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1)

#include <stdio.h>
#include <stdint-gcc.h>
#include <stdlib.h>

#include "USART.h"
#include "MAIN.h"
#include "Monitor.h"
#include "SRAM.h"

#include "avr\io.h"

//Must be included last
#include <util/delay.h>


#endif /* FIRMWARE_H_ */