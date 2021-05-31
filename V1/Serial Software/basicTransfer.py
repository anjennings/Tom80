'''

Send tinyBasic code to Tom80 via serial
	Usage:
	$ python basicTransfer.py fileName
		-fileName : path to tinyBasic file

'''

import serial
import sys
import os
import time
import struct

port = 'COM5'
baud = 115200

#Open serial on COM5, baud must match firmware on the board
try:
	ser = serial.Serial(port = 'COM5', baudrate = 115200, timeout = 1)

	
except:
	print("Python Serial ERROR : Could not open serial port, make sure your board is plugged in.")
	sys.exit(1)
	
#open binary file specified in the args
try:
	f = open(sys.argv[1], "rb")
	ff = open("ser.bin", "wb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)

#File size is maxed at 32k, anything past that is ignored
fileSize = os.path.getsize(sys.argv[1])

#For each address location on the rom, write the value found in the file
#Command Syntax for Write:

ser.write(13)
ser.write(13)
ser.write(13)


for i in range(0, fileSize):
	
	#Send character
	data = f.read(1)
	
	if data != b'\n':
		ser.write(data)
		time.sleep(.005)
		
		
ser.write(13)