import serial
import sys
import os
import time

port = 'COM3'
baud = 9600

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

fileSize = os.path.getsize(sys.argv[1])
a = 0

bArr = open(sys.argv[1], "rb")

for i in range(0, int(sys.argv[2])):
	byte = bArr.read(1)
	
	print(byte.hex())
	ser.write(byte)
	
	time.sleep(.2)
	
