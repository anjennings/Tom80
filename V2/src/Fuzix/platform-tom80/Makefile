
CSRCS = devtty.c uart.c pio.c
CSRCS += devices.c main.c devprop.c ctc.c

DISCSRCS = discard.c

ASRCS = crt0.s tom80.s
ASRCS += tricks.s commonmem.s

DSRCS = ../dev/blkdev.c ../dev/mbr.c

AOBJS = $(ASRCS:.s=.rel)
COBJS = $(CSRCS:.c=.rel)
DISCOBJS = $(DISCSRCS:.c=.rel)
DOBJS = $(patsubst ../dev/%.c,%.rel, $(DSRCS))
DISCARD_DOBJS = $(patsubst ../dev/%.c,%.rel, $(DISCARD_DSRCS))

OBJS  = $(AOBJS) $(COBJS) $(DOBJS) $(DISCOBJS) $(DISCARD_DOBJS)

CROSS_CCOPTS += -I../dev/

JUNK = *.rel *.lst *.asm *.sym *.rst

all:	$(OBJS)

$(AOBJS): %.rel: %.s
	$(CROSS_AS) $(ASOPTS) $<

$(COBJS): %.rel: %.c
	$(CROSS_CC) $(CROSS_CCOPTS) -c $<

$(DOBJS): %.rel: ../dev/%.c
	$(CROSS_CC) $(CROSS_CCOPTS) -c $<

$(DISCOBJS): %.rel: %.c
	$(CROSS_CC) $(CROSS_CCOPTS) $(CROSS_CC_SEGDISC) -c $<

$(DISCARD_DOBJS): %.rel: ../dev/%.c
	$(CROSS_CC) $(CROSS_CCOPTS) $(CROSS_CC_SEGDISC) -c $<

clean:
	rm -f $(OBJS) $(JUNK)  core *~  fuzix.com 

# cfloader.bin: cfloader.s
#	sdasz80 -o cfloader.s
#	sdldz80 -i cfloader.rel
#	makebin -s 65536 cfloader.ihx cfloader.tmp
#	dd if=cfloader.tmp bs=256 skip=254 | dd bs=128 count=1 of=cfloader.bin

# biosloader.bin: biosloader.s
#	sdasz80 -o biosloader.s
#	sdldz80 -i biosloader.rel
#	makebin -s 65536 biosloader.ihx biosloader.tmp
#	dd if=biosloader.tmp bs=256 skip=238 | dd bs=128 count=1 of=biosloader.bin

image: diskimage

IMAGES = $(FUZIX_ROOT)/Images/$(TARGET)

diskimage: #image

	cp ../fuzix.bin $(IMAGES)/fuzix.com
	 cp ../fuzix.bin ../../../cpmtools/fuzix/fuzix.com

foo:

# old_diskimage:
	# Bootable Binary
	#cp ../fuzix.bin $(IMAGES)/fuzix.com
	# 80 track root floppy
	#(cd $(FUZIX_ROOT)/Standalone/filesystem-src; ./build-mini-filesystem $(ENDIANFLAGH) $(FUZIX_ROOT)/Images/$(TARGET)/root.dsk 128 2560)
	# CF IDE
	# Make a blank disk image with partition
	# dd if=$(FUZIX_ROOT)/Standalone/filesystem-src/parttab.40M of=$(IMAGES)/disk.img bs=40017920 conv=sync
	# Add the file system
	# dd if=$(IMAGES)/filesys.img of=$(IMAGES)/disk.img bs=512 seek=2048 conv=notrunc
	# Add the loader
	# dd if=biosloader.bin of=$(IMAGES)/disk.img bs=512 seek=0 conv=notrunc
	# Add the kernel
	# dd if=../fuzix.bin of=$(IMAGES)/disk.img bs=512 seek=1 conv=notrunc
	# Make an emulator image of it
	#cat $(FUZIX_ROOT)/Standalone/filesystem-src/idehdr.40M $(IMAGES)/disk.img > $(IMAGES)/emu-ide.img
