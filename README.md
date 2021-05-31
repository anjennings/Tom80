# Tom80 - Z80 Based SBC

![alt text](https://github.com/anjennings/Tom80/blob/master/Photos/V2%20Full.jpg?raw=true)

Several Versions of the Tom80 exist

## Version 2.0

Specs:

	-Z80 CPU
	-32K EEPROM (0x0000 - 0x7FFF), Can be disabled for full SRAM memory space
	-64K SRAM (0x0000 - 0xFFFF)
	-16550 UART Controller
	-Counter Timer Chip (CTC) 
	-Parallel I/O Chip (PIO)
	-Parallax Propeller to allow for extra peripherals
		-SD Card
		-VGA 
		-PS/2 Keyboard
	-5V Power Via USB (Z80 Only)
	-Regulated power via wall jack (Z80 and Propeller)
	
	V2 is 99% compatable with V1.X so most (if not all) code can be ported without much trouble
	There are several (minor) known issues with V2 that will likely be fixed in a future revision
	
Video comming soon...

## Version 1.X

Specs:

	-Z80 CPU
	-32 Kilobytes EEPROM (0x0000 - 0x7FFF)
	-32 Kilobytes SRAM (0x8000 - 0xFFFF)
	-16550 UART Controller
	-USB Serial Interface
	
	A memory monitor (ASH.asm) can be assembled and run
	Varoious flavors of basic can also be ported
	
See a video about Version 1.1 here:
https://youtu.be/3KAjZbjPqnA
	
## Prototype

Specs:

	-Z80 CPU
	-2 Kilobytes EEPROM (0x0000 - 0x07FF)
	-2 Kilobytes SRAM (0x0800 - 0x0FFF)
	-A single 8 bit latch for I/O

See a video of the prototype here:
https://www.youtube.com/watch?v=QeUG9fH5Wn8


## Other Stuff

Also Includes:

	-Custom EEPROM Programmer Schematics
		-ATMEGA32A
		-28 Pin ZIF Socket
		-USB Interface
		
See a video about the programmer here:
https://youtu.be/HartpD7Tr4I

Other (Older) files:

	Arduino Micro EEPROM Programmer (Predecessor to Custom Programmer)
		-Arduino Code
		-Script to send data via Seral
	
	Various Programs, mostly tests for EEPROM, SRAM, and I/O
	
## TODO

	Tests for V2 CTC and PIO are still lacking
	Firmware for Propeller has not been tested
	Record known issues with each board revision
	Schematics and manufacturing files for V2
	Better documentation in general
	Makefiles
	More pictures
	
