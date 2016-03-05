#include <stdio.h>
#include <stdlib.h>
#define new(dato, dato1) (dato)malloc(sizeof(dato1));
#define ban 0

typedef struct tda {
	tipo valor;
	struct tda *sig;
}NODO;

typedef NODO** PILA;
typedef NODO* Nodo;
typedef NODO* Pila;

void create(PILA p);
void push(PILA p, tipo x);
void clear(PILA p);
int empty(Nodo p);
tipo front(Nodo p);
tipo pop(PILA p);

void create(PILA p) {
	(*p)= NULL;
}

void push(PILA p, tipo x) {
	Nodo nuevo = new(Nodo, NODO);
	nuevo -> valor = x;
	nuevo -> sig = (*p);
	(*p) = nuevo;
}

void clear(PILA p) {
	Nodo aux = (*p);
	while(*p) {
		(*p) = aux -> sig;
		free(aux);
		aux = (*p);
	}
}

int empty(Nodo p) {
	return (p == NULL);
}

tipo front(Nodo p) {
	return p -> valor;
}

tipo pop(PILA p) {
	if(empty(*p))
		return ban;
	tipo a = (*p) -> valor;
	Nodo aux = (*p);
	(*p) = aux -> sig;
	free(aux);
	return a;
}