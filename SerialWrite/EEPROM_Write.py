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
	f = open(sys.argv[1], "r")
except:
	print("Python Serial ERROR : Could not find file!")
	sys.exit(1)

if ser.isOpen():
	print("Open!")

fileSize = 4*1024 #min(os.path.getsize(sys.argv[1]), 1024*4)

bArr = open(sys.argv[1], "rb")

for i in range(0, fileSize):
	byte = bArr.read(1)
	
	print(byte.hex())
	ser.write(byte)
	
	#time.sleep(.1)
	
