CFLAGS = -g -O0 --std=gnu99

.PHONY: clean

default : pokefp makebin

makebin : makebin.c
	gcc -o makebin $(CFLAGS) makebin.c

pokefp : main.o pokefp2float.o
	gcc -o pokefp $(CFLAGS) main.c pokefp2float.S

main.o : main.c

pokefp2float.o : pokefp2float.S
	gcc -c $(CFLAGS) -gstabs+ pokefp2float.S

clean :
	rm -f *.o
	rm -f pokefp
	rm -f makebin

