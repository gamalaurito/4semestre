#define tipo char
#include "pila.h"
#include <string.h>
typedef long unsigned int size_t;

int main() {
	Pila p;
	create(&p);
	char pala[50];
	fgets(pala, 50, stdin);
	size_t tam = strlen(pala);	
	char c;
	for(size_t i = 0; i < tam - 1; i++) {
		c = pala[i];
		//printf("%c %d\n", c, c);
		if(c == 40 || c == 91 || c == 123)
			push(&p, c);
		else {
			if(empty(p)) {
				c = 0;
				break;
			}
			char aux = front(p);
			if(c == 41 && aux == 40)
				pop(&p);
			else if(c == 93 && aux == 91)
				pop(&p);
			else if (c == 125 && aux == 123)
				pop(&p);
			else {
				c = 0;
				break;
			}
		}
	}
	if(!c) {
		printf("Cadena no balanceada \n");
		return 0;
	}
	else
		printf("Cadena balanceada\n");
	return 0;
}


