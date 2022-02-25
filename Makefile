all:
	gcc -DHAVE_ENDIAN_H *.c && ./a.out
a:
	gcc -DHAVE_ENDIAN_H -fsanitize=address,undefined *.c && ./a.out
m:
	gcc -DHAVE_ENDIAN_H -fsanitize=memory *.c && ./a.out
l:
	gcc -DHAVE_ENDIAN_H -fPIC -c poly1305.c -o poly1305.o
	gcc -shared -Wl,-soname,libbitcoinp.so.0 -o libbitcoinp.so.0 poly1305.o -lc
	cp -uf libbitcoinp.so.0 /usr/local/lib
	ldconfig

clean:
	rm -rf *.out *.o
