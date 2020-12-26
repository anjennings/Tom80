import serial
import sys
import os
import time

port = 'COM3'
baud = 38400

try:
	ser = serial.Serial(port = "COM3", baudrate = baud, timeout = 1)
except:
	print("Python Serial ERROR : Could not open serial port, make sure your board is plugged in.")
	sys.exit(1)
	
#open file

try:
	f = open("rom.dat", "w")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)



fileSize = 32*1024 #min(os.path.getsize(sys.argv[1]), 1024*4)

for i in range(0, fileSize):
	byte = bArr.read(1)
	
	print(byte.hex())
	ser.write(byte)
	
	#time.sleep(.1)
	
