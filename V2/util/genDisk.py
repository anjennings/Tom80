initfs = 9984
freedata = (77*26*128) - initfs;

image = open("A.IMG", 'w')
image.write("\xe5"*(initfs))
image.write("\x00"*(freedata))
