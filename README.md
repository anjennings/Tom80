# Z80-Computer

Files relating to a Z80 based computer I am building

Specs are:

	-Z80 CPU @ 8 MHz (10 MHz Max)
	-32 Kilobytes EEPROM (0x0000 - 0x7FFF)
	-32 Kilobytes SRAM (0x8000 - 0xFFFF)
	-16550 UART Controller
	-USB Serial Interface
	
Prototype Specs:

	-Z80 CPU @ 2 MHz Clock
	-2 Kilobytes EEPROM (0x0000 - 0x07FF)
	-2 Kilobytes SRAM (0x0800 - 0x0FFF)
	-A single 8 bit latch for I/O

See a video of the prototype here:
https://www.youtube.com/watch?v=QeUG9fH5Wn8

Also Includes:

	-Custom EEPROM Programmer
		-ATMEGA32A
		-28 Pin ZIF Socket
		-USB Interface
		
	-Simple Memory Monitor (ASH.asm)
		-a whopping 5 commands, including read, write, execute, AND MORE!
		-not currently finished

Other (Older) files:

	Arduino Micro EEPROM Programmer (Predecessor to Custom Programmer)
		-Arduino Code
		-Script to send data via Seral
	
	Various Programs, mostly tests for EEPROM, SRAM, and I/O
