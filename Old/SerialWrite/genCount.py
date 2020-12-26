import sys
import os
    
#open file
f = open("sequent.bin", 'w+b')

byte_arr = [0]

for i in range(1, 128):
    byte_arr.append(i)

	
binary_format = bytearray(byte_arr)
f.write(binary_format)
	
print("done!")

f.close()
    
