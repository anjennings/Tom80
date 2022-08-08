CC = pasmo
FILENAME = write
MODE = --bin
PROG = minipro

prog:	$(FILENAME).asm
	$(CC) $(MODE) $(FILENAME).asm $(FILENAME).bin

clean:
	rm -f *.bin *.rel

write:
	$(PROG) -p 39SF040 -w $(FILENAME).bin
