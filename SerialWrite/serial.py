import serial
import sys

port = "COM3"
baud = 9600

ser = serial.Serial(port, baud, timeout=1)

#open file
f = open(str(sys.argv[1]), "r")

if ser.isOpen():
    print("Open!")

for x in f:
    print(x)
    ser.write(x);
