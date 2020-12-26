'''

Read From EEPROM via Serial
	Usage:
	$ python EEPROM_READ.py fileSize
		-fileSize : number of bytes to read from ROM starting at address 0
		
	creates a file in the same directory called rom.dat that contains the contents of the ROM

'''

import serial
import sys
import os
import time
import struct

READ_INST = struct.pack("B", 0x72)
WRITE_INST = struct.pack("B", 0x77)

port = 'COM3'
baud = 38400

#Open serial on COM3, baud must match firmware on the board
try:
	ser = serial.Serial(port = 'COM3', baudrate = 38400, timeout = 1)

	
except:
	print("Python Serial ERROR : Could not open serial port, make sure your board is plugged in.")
	sys.exit(1)
	
#open rom.dat
try:
	f = open("rom.dat", "wb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)

#Optional argument, if value specified is less than 32k then use that value
#Maximum file that can be read is 32k
amt = 32*1024
if len(sys.argv) >= 2:
	amt = int(sys.argv[1])
	
fileSize = min(32*1024, amt)

#For each address location on the rom, read the value stored there
#Command Syntax for Read:
#	Byte 1 : Command, 0x72 for read
#	Byte 2 : High Byte of Address
#	Byte 3 : Low Byte of Address
#	Byte 4 : Unused for Read
#	Upon recieving all 4 bytes, the programmer will reply with a single byte

for i in range(0, fileSize):
	high = struct.pack("B", ((i >> 8) & 0xff))
	low = struct.pack("B", (i & 0xff))
	
	#Send Read Instruction
	ser.write(READ_INST)
	
	#Send High Byte of Address
	ser.write(high)
	
	#Send Low Byte of Address
	ser.write(low)
	
	#Final byte is unused, repeat low byte
	ser.write(low)
	
	#Read reply by programmer and write directly to file
	f.write(ser.read(1))
	