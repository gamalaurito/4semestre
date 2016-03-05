#include <math.h>

typedef struct  OPERANDO {
	int operan;
	char ban;
} operando;

typedef operando* dato;

int operacion(int op1, char op, int op2) {
	if(op == '+') {
		op1 = op1 + op2;
	}
	else if(op == '-') {
		op1 = op1 - op2;
	}
	else if(op == '*') {
		op1 = op1 * op2;
	}
	else if(op == '/') {
		op1 = op1 / op2;
	}
	else {
		for(int i = 0, aux = op1; i < op2; i++) {
			op1 *= aux;
		}
	}
	return op1;
}

char opera(char c) {
	if(c == '+' || c == '/' || c == '-' || c == '*' || c == '^')
		return 1;
	return 0;
}