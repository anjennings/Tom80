# Path to commandline gal assembler
CC = ~/dev/GALasm/src/galasm
PROG = "minipro"

SRC = logic

all:	$(SRC).pld
	$(CC) $(SRC).pld

write: $(SRC).pld $(SRC).jed
	$(PROG) -p ATF16V8BQL -w $(SRC).jed

clean:
	rm -f *.chp *.fus *.pin *.jed

