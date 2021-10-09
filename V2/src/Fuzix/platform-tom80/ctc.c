#include <kernel.h>
#include <version.h>
#include <kdata.h>
#include <ctc.h>
#include <printf.h>

__sfr __at (CTC_BASE)	CTC_CH0;
__sfr __at (CTC_BASE+1)	CTC_CH1;
__sfr __at (CTC_BASE+2) CTC_CH2;
__sfr __at (CTC_BASE+3)	CTC_CH3;

#define CTC_CH1_INIT	0xC7	// Init channel, INT EN, COUNT, 16x, Falling Edge, TC Follows, Reset, Control
#define CTC_CH1_RST	0xC3	// Restart Chan, INT EN, COUNT, 16x, Falling Edge, NO TC, Reset, Control
#define CTC_CH1_DI	0x41	// Disable ints, INT DI, COUNT, 16x, Falling Edge, NO TC, NO RESET, Control
#define CTC_CH1_EI	0xC1	// Enable ints,  INT EN, COUNT, 16x, Falling Edge, NO TC, NO RESET, Control

extern uint16_t ctc1_int_v;

// Disable interrupts from ctc, countdown continues
void ctc_di(){
	//CTC_CH1 = CTC_RESET;// CTC_CH1_DI;
}

// Enable interrupts from ctc
void ctc_ei(){
	
	//ctc_init_single();
	return;
/*
	// if the countdown is 0, just reset (call interrupt handler?)
	if (CTC_CH1 == 0) {
		CTC_CH1 = CTC_SINGLE;
		CTC_CH1 = 0;
	} else {
		CTC_CH1 = CTC_SINGLE;
	}
	*/
}

// Called no matter what mode is selected
void ctc_init() {

	kprintf("CTC INIT\n");
	// Reset all registers
	CTC_CH0 = CTC_RESET;
	CTC_CH1 = CTC_RESET;
	CTC_CH2 = CTC_RESET;
	CTC_CH3 = CTC_RESET;

	// Reset all interrupt vectors
	CTC_CH0 = 0x0;
	CTC_CH0 = 0x2;
	CTC_CH0 = 0x4;
	CTC_CH0 = 0x6;

	ctc_init_single();
}

// Set channel 1 to generate an interrupt every 65532 ticks 
void ctc_init_single() {
	CTC_CH1 = CTC_RESET; 			// Reset control register
	CTC_CH1 = CTC_SINGLE;			// Set control register for single timer with following constant
	CTC_CH1 = 0;				// Set time constant (0 means 256 ticks)
}

// Set channel 0 & 1 to generate an interrupt every ~1M ticks
void ctc_init_multi() {

	kprintf("CTC INIT\n");
	CTC_CH0 = CTC_RESET;		// Reset both registers
	CTC_CH1 = CTC_RESET;

	//CTC_CH0 = ((int_vector & CTC_INT_MASK) | 2);	//Do this in crt0

	CTC_CH0 = 0x27;			// 244 * 256 Ticks, timer, no interrupt, tc follows
	CTC_CH0 = 244;

	CTC_CH1 = 0xC7;			// 16 * (244 * 256) ticks, counter, interrupt, tc follows
	CTC_CH1 = 0x1;

}
