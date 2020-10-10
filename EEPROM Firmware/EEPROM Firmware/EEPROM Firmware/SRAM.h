/*
 * SRAM.h
 *
 * Created: 10/6/2020 7:17:27 PM
 *  Author: Aidan
 */ 



#ifndef SRAM_H_
#define SRAM_H_
#include <stdint-gcc.h>

	void delay(int x);
	void writeData(uint8_t d, uint16_t a);
	uint8_t readData(uint16_t a);
	void init32Kwrite();
	void init32Kread();

#endif /* SRAM_H_ */