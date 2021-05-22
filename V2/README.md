# Tom80 V2.0

![alt text](https://github.com/anjennings/Tom80/blob/Version-2.0/Photos/V2%20Partial.jpg?raw=true)

New Features in V2:
* CTC for periodic hardware interrupts
* PIO for interrupt based bi-directional communication
* Parallax Propeller for VGA video, PS/2 Keyboard, and Micro SD Card
* 5V and 3.3V regulators
* Bankable EEPROM for 32k/32k RAM/ROM split or 64k ROM after boot
* 99% Compatable with code designed for V1.X (UART Interrupt was removed)
	
Video coming sometime this summer...
	
## Known Issues for V2.0:
* Reset logic only seems to work sometimes
	* PIO can not be reset without manually shorting M1 pin to ground (possibly related)
* Voltage regulator footprint is designed for TO-220FP, not an issue per say but LF33 is easier to find in non-FP package
* Interrupt logic for peripheral chips is open drain, schematic and glue logic does not reflect this
	* To enable interrupts the CTC & PIO /INT lines must be shorted together, pulled high through a resistor, and wired to Z80 /INT
* RAM Banking is wired incorrectly and lacks appropriate logic
	* Manually bodging the top 4 lines of the RAM chip and an unused OR gate could allow for a simple banking system