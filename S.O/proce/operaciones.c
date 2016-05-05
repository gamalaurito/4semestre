#include "ura.h"
typedef dato tipo;
#include "pila.h"
#include <string.h>

int main() {
	Pila p;
	dato aux1;
	create(&p);
	printf("Ingrese su cadena\n");
	char pala[50];
	fgets(pala, 50, stdin);
	size_t tam = strlen(pala);	
	char c;
	char ban1 = 0;
	int num = 0;
	for(size_t i = 0; i < tam - 1; i++) {
		c = pala[i];
		if(c == '(')
			continue;
		else if(c == ')') {
			if(empty(p)) {
				printf("Cadena desbalanceada\nRevise su entrada por favor\n");
				ban1 = 1;
				break;
			}
			else {
				if(!num)
					num = pop(&p)->operan;
				char op = pop(&p)->operan;
				int n1 = pop(&p)->operan;
				aux1 = new(dato, operando);
				//printf("%d %c %d\n", n1, op, num);
				aux1 -> operan = operacion(n1, op, num);
				push(&p, aux1);
				num = 0;
			}
		}
		else {
			if(opera(c)) {
				aux1 = new(dato, operando);
				if(num) {
					aux1 -> operan = num;
					push(&p, aux1);
					num = 0;
				}
				aux1 = new(dato, operando);
				aux1 -> operan = c;
				push(&p, aux1);
			}
			else {
				num = (c - '0') + num*10;
			}
		}
	}
	if(ban1)
		return 0;
	aux1 = pop(&p);
	printf("%d\n", aux1 -> operan);
	return 0;
}
