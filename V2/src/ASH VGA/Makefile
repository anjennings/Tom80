#Specify location of assembler
CC = "pasmo"	
#Source filename	
FILENAME = ASH
#Libraries
MONNITOR_LIB = ASH.h
PIO_LIB = PIO.h
SERIAL_LIB = Serial.h
#Mode
MODE = --bin

ASH:	$(FILENAME).asm
	$(CC) $(MODE) $(FILENAME).asm $(FILENAME).bin