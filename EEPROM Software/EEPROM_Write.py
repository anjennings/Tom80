'''

Write To EEPROM via Serial
	Usage:
	$ python EEPROM_Write.py fileName fileSize
		-fileName : path to binary file
		-fileSize : number of bytes to write from ROM starting at address 0

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
	
#open binary file specified in the args
try:
	f = open(sys.argv[1], "rb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)

#User can set the size of the data they wish to write if most of the binary is unused
amt = 32*1024
if len(sys.argv) >= 3:
	amt = int(sys.argv[2])

#File size is maxed at 32k, anything past that is ignored
fileSize = min((32*1024), os.path.getsize(sys.argv[1]), amt)

#For each address location on the rom, write the value found in the file
#Command Syntax for Write:
#	Byte 1 : Command, 0x77 for read
#	Byte 2 : High Byte of Address
#	Byte 3 : Low Byte of Address
#	Byte 4 : Value to Write
#	Upon recieving all 4 bytes, the programmer will reply with a single byte indicating that the write is complete

for i in range(0, fileSize):
	high = struct.pack("B", ((i >> 8) & 0xff))
	low = struct.pack("B", (i & 0xff))
	data = f.read(1)
	
	#Send instruction
	ser.write(WRITE_INST)
	
	#Send High Byte of Address
	ser.write(high)
	
	#Send Low Byte of Address
	ser.write(low)
	
	#Send Data to Write
	ser.write(data)
	
	#Wait for reply
	rec = ser.read(1)
