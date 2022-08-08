CC = pasmo
FILENAME = halt
MODE = --bin
PROG = minipro

prog:	$(FILENAME).asm
	$(CC) $(MODE) $(FILENAME).asm $(FILENAME).bin

clean:
	rm -f *.bin *.rel

write:
	$(PROG) -S -p SST39SF040 -w $(FILENAME).bin
