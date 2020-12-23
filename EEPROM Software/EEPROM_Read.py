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
	
#open file

try:
	f = open("rom.dat", "wb")
	f2 = open("input.dat", "wb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)

amt = 32*1024
if len(sys.argv) >= 2:
	amt = int(sys.argv[1])
	
fileSize = min(32*1024, amt)

for i in range(0, fileSize):
	high = struct.pack("B", ((i >> 8) & 0xff))
	low = struct.pack("B", (i & 0xff))
	
	#print(i)
	ser.write(READ_INST)
	
	ser.write(high)
	
	ser.write(low)
	
	ser.write(low)
	
	f.write(ser.read(1))

	#time.sleep(.1)
	
