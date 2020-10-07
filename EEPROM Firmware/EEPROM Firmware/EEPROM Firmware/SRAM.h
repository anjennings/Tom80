/*
 * SRAM.h
 *
 * Created: 10/6/2020 7:17:27 PM
 *  Author: Aidan
 */ 


#ifndef SRAM_H_
#define SRAM_H_

struct PinConfig {
	
	/*
		Define pins here... somehow
	*/
	
	};

/*
 *	Define parameters for SRAM Modules
 */
struct SRAM_module {
	
	char partNumber[20];
	int sizeKb;
	int pinCount;
	PinConfig pins;
	
	};
	


	void init32Kwrite();

#endif /* SRAM_H_ */