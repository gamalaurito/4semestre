segment .data
	handleConsola			dd	1				;Primer argumento para la llamada al sistema _WriteConsoleA()
	longitudCadena 			dd 	1				;tercer argumento 
	caractEscritos			dd 	1				;Cuarto argumento 
	ultimoArgumento			dd 	1				;Quinto argumento
segment .bss
	salida resb 10
	
segment .text

global _main
extern _GetStdHandle@4							;Acceso externo a la llamada al sistema _GetStdHandle()
extern _WriteConsoleA@20						;Acceso externo a la llamada al sistema _WriteConsoleA()
extern _ExitProcess@4

_main:	push dword -11							;Argumento pasado por pila y usado por _GetStdHandle para la salida estandar
		call _GetStdHandle@4					;Invocacion de _GetStdHandle
		mov [handleConsola],eax					;Devolucion del manejador de consola para escritura en registro eax

		mov ecx, 0			;seteo ecx en 0
    	mov eax, 48
loop:
	mov  [ salida + ecx], eax	;guardo numero en el buffer
    inc  eax
	inc  ecx			;incremento ecx en 1
    cmp  ecx, 10		;comparo el caracter de mi cadena con 0 que es un espacio, \n o \r
    jne loop

imprimir:
		xor eax,eax								;limpieza del registro eax
		mov eax,10d								;longitud de la cadena
		mov [longitudCadena],eax				;se guarda la longitud de la cadena
		xor eax,eax								;limpieza del registro eax
		mov eax,0d								;Es el valor del ultimo argunto de _WriteConsoleA()
		mov [ultimoArgumento],eax				;Se guarda el valor del ultimo arguneto en memoria

		push dword [ultimoArgumento]
		push dword caractEscritos
		push dword [longitudCadena]
		push dword salida
		push dword [handleConsola]
		call _WriteConsoleA@20


		push dword 0
		call _ExitProcess@4