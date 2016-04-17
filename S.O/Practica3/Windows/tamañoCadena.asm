segment .data
	handleConsola			dd	1				;Primer argumento para la llamada al sistema _WriteConsoleA()	
	longitudCadena 			dd 	1				;tercer argumento 
	caractEscritos			dd 	1				;Cuarto argumento 
	caractLeidos			dd 	1				;Cuarto argumento 
	ultimoArgumento			dd 	1				;Quinto argumento

segment	.bss
	cadena 			resb	50		;cadena definida con su tamaño en bytes
	salida			resb	4		;cadena definida con su tamaño en bytes
	outputBuffer    resb    4  		;buffer para almacenar mi numero al convertirlo

segment	.text
 	global	_main			
 	extern _GetStdHandle@4							;Acceso externo a la llamada al sistema _GetStdHandle()
	extern _WriteConsoleA@20						;Acceso externo a la llamada al sistema _WriteConsoleA()
	extern	_ReadConsoleA@20
	extern _ExitProcess@4	

_main:

	;leemos la cadena
	push dword -10							
	call _GetStdHandle@4					
	mov [handleConsola],eax	
	xor		eax,eax
	mov		eax,50d
	mov		[longitudCadena],eax
	xor		eax,eax
	mov		eax,0d
	mov		[ultimoArgumento],eax
	push	dword [ultimoArgumento]
	push	dword caractLeidos
	push	dword [longitudCadena]
	push	dword cadena
	push	dword [handleConsola]
	call	_ReadConsoleA@20

	mov eax, cadena				;guardo mi cadena en eax
    mov ecx, 0					;seteo ecx en 0

.loop:							;loop para contar longitud
    inc ecx						;incremento ecx en 1
    cmp byte [eax + ecx], 0		;comparo el caracter de mi cadena con 0 que es un espacio, \n o \r
    jne .loop					;hago un salto al inicio de mi loop

.if:							;loop para contar longitud			;incremento ecx en 1
    cmp ecx, 11					;comparo el caracter de mi cadena con 0 que es un espacio, \n o \r
    jg  .caso2					;hago un salto al inicio de mi loop

.caso1:
    add  ecx, -2				;resto 1 debido a que conté ecx una vez de mas		
    add  ecx, 0x30              ;agrego 30 en hexagesimal para volverlo ascii
    mov  [outputBuffer], ecx    ;guardo numero en el buffer

    xor eax,eax
    push dword -11							
	call _GetStdHandle@4					
	mov [handleConsola],eax					
	xor eax,eax								
	mov eax,1d								
	mov [longitudCadena],eax				
	xor eax,eax								
	mov eax,0d								
	mov [ultimoArgumento],eax				
	push dword [ultimoArgumento]
	push dword caractEscritos
	push dword [longitudCadena]
	push dword outputBuffer
	push dword [handleConsola]
	call _WriteConsoleA@20
	jmp salir

.caso2:
    add  ecx, -2
    xor  edx, edx		;limpio edx
    mov  eax, ecx		;ingreso ecx en eax
    mov  ebx, 10		;inserto 10 en edx
    idiv ebx			;divido eax entre ebx 
				
    mov  ecx, eax		;inserto eax en ecx
    add  ecx, 0x30              ;agrego 30 en hexagesimal para volverlo ascii
    mov  [salida], ecx	    	;guardo numero en el buffer
    mov  ecx, edx		;inserto eax en ecx

    add  ecx, 0x30              ;agrego 30 en hexagesimal para volverlo ascii
    mov  [salida+1], ecx	;guardo numero en el buffer

    xor eax,eax
    push dword -11							
	call _GetStdHandle@4					
	mov [handleConsola],eax					
	xor eax,eax								
	mov eax,2d								
	mov [longitudCadena],eax				
	xor eax,eax								
	mov eax,0d								
	mov [ultimoArgumento],eax				
	push dword [ultimoArgumento]
	push dword caractEscritos
	push dword [longitudCadena]
	push dword salida
	push dword [handleConsola]
	call _WriteConsoleA@20
 	
salir:		
	push dword 0
	call _ExitProcess@4