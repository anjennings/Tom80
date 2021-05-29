
#include "PS2.h"

void PS2() {
	
	uint8_t buffer[BUFF_SIZE];
	
}

uint8_t MonitorWire() {

	
	uint16_t packet;
	uint8_t data;

	for(int i = 0; i < PACKET_SIZE; i++) {
		
		while (input(PS2_CLK)) {
			// do nothing
		}
		
		// when clock goes low
	   packet = ((data << 1) | input(PS2_DAT));
	   
		while (input(PS2_CLK) == 0) {
			// do nothing
		}
	}
	data = ((packet >> 2) & 0xFF);
	printf("0x%x \n", packet);
}
