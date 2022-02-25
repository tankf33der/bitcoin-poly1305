#include <stdlib.h>
#include "poly1305.h"

typedef uint8_t u8;

#define ARRAY(name, size) \
    u8 name[size]; \
    for(size_t i = 0; i < size; i++) name[i] = 123;

int main(void) {
    ARRAY(out, 32);
    ARRAY(in , 32);
    ARRAY(key, 32);

	poly1305_auth(out, in,  0, key);
	poly1305_auth(out, in, 32, key);

	return 0;
}
