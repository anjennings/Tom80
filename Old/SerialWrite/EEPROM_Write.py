import serial
import sys
import os
import time
import struct

READ_INST = struct.pack("B", 0x72)
WRITE_INST = struct.pack("B", 0x77)

port = 'COM3'
baud = 38400

try:
	ser = serial.Serial(port = 'COM3', baudrate = 38400, timeout = 1)

	
except:
	print("Python Serial ERROR : Could not open serial port, make sure your board is plugged in.")
	sys.exit(1)
	
#open file specified in the args
try:
	f = open(sys.argv[1], "rb")
	f2 = open("wrInput.dat", "wb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)


#File size is maxed at 32k, anything past that is ignored
fileSize = min((32*1024), min(os.path.getsize(sys.argv[1]), sys.argv[2]))


for i in range(0, fileSize):
	high = struct.pack("B", ((i >> 8) & 0xff))
	low = struct.pack("B", (i & 0xff))
	data = f.read(1).hex()
	
	print(i)
	ser.write(WRITE_INST)
	f2.write(WRITE_INST)
	
	ser.write(high)
	f2.write(high)
	
	ser.write(low)
	f2.write(low)
	
	ser.write(data)
	f2.write(data)

	
