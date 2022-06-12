'''

Rom Image Generator (R.I.G.)
Given multiple binaries, create a ROM image with each file stored at a specified offset
	Usage:
	$ python rig.py [--c configfile] file1.bin file2.bin ...
		-cfgFile : config file with start point for each binary
		-file# : path to binary file

'''

import sys
import os
import argparse
import io
import struct

parser = argparse.ArgumentParser()
parser.add_argument('--c', help="Path to configuration file", type=open, required=False)
parser.add_argument("files", help="Path to binary file(s)", nargs="+",) #type=argparse.FileType('rb'),
args = parser.parse_args()

configFile = args.c			#Config file (if it exists)
binFiles = args.files		#Binary file(s)
fileOffsets = dict()		#Dictionary of files and offsets

print(binFiles)

if configFile is None:
	#Ask user for bounds and generate config file 
	print("Got no config!")
	
	for i in binFiles:
		
		fileSize = os.path.getsize(i)
		print(fileSize)
		while True:
			try:
				foo = int(input("Start location (hex) for " + str(i) + "? (" + hex(fileSize) + " bytes) : "), 16)
				if foo > int('7FFF', 16):
					raise Exception("Error, invalid address (0x0000 - 0x7FFF)")
					
				if (foo + fileSize) > int('7FFF', 16):
					raise Exception("Error, filesize extends outsize of image bounds (0x0000 - 0x7FFF) : " + str(hex(foo+ fileSize)))
					
			except ValueError as e:
				print("Error, invalid address (0x0000 - 0x7FFF)")
				continue
				
			except Exception as er:
				print(er)
				continue
				
			break
		
		fileOffsets[open(i, 'rb')] = foo
		
	configFile = open("config.cfg", 'w')
	for key, value in fileOffsets.items():
		configFile.write(hex(value))
	configFile.close()
	
else:
	#Config file exists already, just populate the dict
	offsets = configFile.readlines()
	for i in range(0, len(offsets)):
		fileOffsets[open(str(binFiles[i]), 'rb')] = int(offsets[i], 16)

	
#Create binary file and place each element at its location specified in config file
outputFile = open("rom.bin", 'wb')	

#write binary files to corresponding location in output file
for key, value in fileOffsets.items():
	fileContents = key.read()#bytes(key.read(), 'cp1252')
	outputFile.seek(value)
	outputFile.write(fileContents)

print("Output to rom.bin")