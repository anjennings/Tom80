'''

Write To SRAM via Serial
	Usage:
	$ python quickload.py fileName fileSize
		-fileName : path to binary file
		-fileSize : number of bytes to write from ROM starting at address 0

'''

import serial
import sys
import os
import time
import struct
from datetime import datetime

#shamelessly stolen
def remove_prefix(text, prefix):
    return text[text.startswith(prefix) and len(prefix):]

READ_INST = struct.pack("B", 0x72)
WRITE_INST = struct.pack("B", 0x77)

port = 'COM5'
baud = 115200

#Open serial on COM5, baud must match Tom80 on the board
try:
	ser = serial.Serial(port = 'COM5', baudrate = 115200, timeout = 1)

	
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
amt = 18 * 1024
if len(sys.argv) >= 3:
	amt = int(sys.argv[2])

#File size is maxed at 24k, anything past that is ignored
fileSize = min((18*1024), os.path.getsize(sys.argv[1]), amt)

RAM_START = 0xA000

#ser.write('\n');
#ser.write('\n');
#ser.write('\n');

for i in range(0, fileSize):
	high = ((RAM_START+i) >> 8) & 0xff #struct.pack("B", (((RAM_START+i) >> 8) & 0xff))
	low = ((RAM_START+i) & 0xff) # struct.pack("B", ((RAM_START+i) & 0xff))
	data = f.read(1)
	
	high_ascii = format(high,"02X") #remove_prefix(hex(high), '0x')
	low_ascii = format(low, "02X") #remove_prefix(hex(low), '0x')
	data_ascii = remove_prefix(str(hex(int.from_bytes(data, "big"))), '0x')
	
	print(high_ascii+low_ascii+'<'+data_ascii, flush=True)
	#print(low_ascii.capitalize(), flush=True)
	#print('<', flush=True)
	#print(str(hex(int.from_bytes(data, "big"))).capitalize())
	#print(' ', flush=True)
	
	#Send instruction
	#ser.write(high)
	
	#Send High Byte of Address
	#ser.write(low)
	
	#Send Low Byte of Address
	#ser.write('<')
	
	#Send Data to Write
	#ser.write(data)
	
	#Wait for reply
	time.sleep(.001)

print('\nWrite success!')
print(datetime.now().strftime("%H:%M:%S"))