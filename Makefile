all:
	gcc -DHAVE_ENDIAN_H *.c && ./a.out
a:
	gcc -DHAVE_ENDIAN_H -fsanitize=address,undefined *.c && ./a.out
m:
	gcc -DHAVE_ENDIAN_H -fsanitize=memory *.c && ./a.out

clean:
	rm -rf *.out *.o
