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

#open binary file specified in the args
try:
	f = open(sys.argv[1], "rb")
	ft = open(sys.argv[1]+".trm", "wb")
except:
	print("Python Serial ERROR : Could not open file!")
	sys.exit(1)
	
#User can set the start point in the file to begin the trim
amt = 40960
if len(sys.argv) >= 3:
	amt = int(sys.argv[2])
	
#File begins at 40960 (0xA000) by default
fileStart = min((40960), amt)

fileSize = os.path.getsize(sys.argv[1]);

if (fileSize <= fileStart):
	print("File start exceeds filesize!")
	sys.exit(1)
	
nullData = f.read(amt)
goodData = f.read(fileSize - fileStart)

ft.write(goodData)

f.close()
ft.close()