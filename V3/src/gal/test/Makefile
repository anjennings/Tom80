# Path to commandline gal assembler
CC = "/home/aidan/GALasm/src/galasm"
PROG = "minipro"

SRC = logic

all:	$(SRC)
	$(CC) $(SRC).pld

write: $(SRC).pld $(SRC).jed
	$(PROG) -p ATF16V8BQL -w $(SRC).jed

clean:
	rm -f *.chp *.fus *.pin *.jed

