FILENAME = "main.c"

test:
	#propeller-elf-gcc.exe -v 
	propeller-elf-gcc.exe -I . -L . -I "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/Utility/libsimpletools" -L "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/Utility/libsimpletools/cmm/" -I "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/TextDevices/libsimpletext" -L "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/TextDevices/libsimpletext/cmm/" -I "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/Protocol/libsimplei2c" -L "C:/Users/Aidan/Documents/SimpleIDE/Learn/Simple Libraries/Protocol/libsimplei2c/cmm/" -o "cmm/Hello Message.elf" -O0 -mcmm -Wall -m32bit-doubles -fno-exceptions -std=c99 $(FILENAME) -lm -lsimpletools -lsimpletext -lsimplei2c -lm -lsimpletools -lsimpletext -lm -lsimpletools -lm
	#propeller-load -s cmm/Hello Message.elf
	#propeller-elf-objdump -h cmm/Hello Message.elf