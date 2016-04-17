segment	.data
	handleConsola			dd	1				;Primer argumento para la llamada al sistema _WriteConsoleA()	
	longitudCadena 			dd 	1				;tercer argumento 
	caractEscritos			dd 	1				;Cuarto argumento 
	caractLeidos			dd 	1				;Cuarto argumento 
	ultimoArgumento			dd 	1				;Quinto argumento
	cadf	db	'Llega',0xA
	cad0	db	'Ingrese el primer numero',0xA
	cad1	db	'Ingrese el segundo numero',0xA
	cad2	db	'1) Suma',0xA
	cad3	db	'2) Restar',0xA
	cad4	db	'3) Multiplicar',0xA
	cad5	db	'4) Dividir',0xA
	cad6	db	'5) Salir',0xA
	n11 db   0d					;guarda el primer numero
	n21 db   0d					;guarda el segundo numero
segment .bss
	cadena  resb   5			; usada para lectura
	cade 	resb   5			; usada para impresion
	aux 	resb   5			; usada para impresion
segment	.text
 	global	_main
 	extern _GetStdHandle@4							;Acceso externo a la llamada al sistema _GetStdHandle()
	extern _WriteConsoleA@20						;Acceso externo a la llamada al sistema _WriteConsoleA()
	extern	_ReadConsoleA@20
	extern _ExitProcess@4	
_main:
		num1:
			push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,25d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad0
			push dword [handleConsola]
			call _WriteConsoleA@20

			xor	eax,eax
			push dword -10							
			call _GetStdHandle@4					
			mov [handleConsola],eax	
			xor		eax,eax
			mov		eax,5d
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

			mov ecx, cadena			;guardo mi cadena en eax
	    	mov eax, 0				;seteo eax en 0
	    	jmp s110				;mando a colocar el primer numero
	    	mov edx,10d
	    	xor eax,eax
	    n1d1:
	    	jmp s120				;meto el segundo numero
	    n1d2:
	    	jmp s130				;meto el tercer numero
	    num2:
	    	push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,26d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad1
			push dword [handleConsola]
			call _WriteConsoleA@20

	    	xor	eax,eax
			push dword -10							
			call _GetStdHandle@4					
			mov [handleConsola],eax	
			xor		eax,eax
			mov		eax,5d
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

	    	mov ecx, cadena			;guardo mi cadena en eax
	    	mov eax, 0				;seteo eax en 0
	    	jmp s210				;mando a colocar el primer numero
	    	mov edx,10
	    n2d1:
	    	cmp byte [ecx+1],0d	; reviso si termina la cadena
	    	je menu
	    	;mul edx					;multiplico por diez
	    	jmp s220				;meto el segundo numero
	    n2d2:
	    	cmp byte [ecx+2],0d	;reviso si termina la cadena
	    	je menu
	    	;mul edx					;multiplico por diez
	    	jmp s230				;meto el tercer numero
	    menu:
	    	; uno
	    	push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,8d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad2
			push dword [handleConsola]
			call _WriteConsoleA@20
		    ; dos
		    push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,10d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad3
			push dword [handleConsola]
			call _WriteConsoleA@20
		    ; tres
		    push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,15d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad4
			push dword [handleConsola]
			call _WriteConsoleA@20
		    ; cuatro
		    push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,11d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad5
			push dword [handleConsola]
			call _WriteConsoleA@20
		    ; cinco
		    push dword -11							
			call _GetStdHandle@4					
			mov [handleConsola],eax					
			xor eax,eax								
			mov eax,9d								
			mov [longitudCadena],eax				
			xor eax,eax								
			mov eax,0d								
			mov [ultimoArgumento],eax				
			push dword [ultimoArgumento]
			push dword caractEscritos
			push dword [longitudCadena]
			push dword cad6
			push dword [handleConsola]
			call _WriteConsoleA@20

			; seleccion de operacion
		    xor	eax,eax
			push dword -10							
			call _GetStdHandle@4					
			mov [handleConsola],eax	
			xor		eax,eax
			mov		eax,4d
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

	    	;regresamos los valores a los registros
	    	mov eax,[n11]
	    	mov ecx,[n21]
    	
    		;se manda el flujo a la operacion
    		sig:
		    	cmp byte [cadena],49d
		    	je sumar
		    	cmp byte [cadena],50d
		    	je restar
		    	cmp byte [cadena],51d
		    	je multiplicar
		    	cmp byte [cadena],52d
		    	je dividir
		    	cmp byte[cadena],53d
		    	je salir

		    sumar:
		    	add eax,ecx			;lo sumamos
		    	jmp imprimir

		    restar:
		    	sub eax,ecx			;lo restamos
		    	jmp imprimir
		    
		    multiplicar:
				mov edx, ecx
		    	mul edx
		    	jmp imprimir
		    
		    dividir:  					
		    	mov al,[n11]
		    	mov bl,[n21]
		    	mov dx,0
		    	mov ah,0
		    	div bl
		    	mov [cade],ax
		    	mov eax,[cade]
		    	jmp imprimir

		    imprimir:
		    	mov ecx,0
		    	mov [cade],ecx
		    	add [cade],eax
		    	cmp byte [cade],100d
		    	jge caso3
		    	cmp byte [cade],10d
		    	jge caso2
		    	cmp byte [cade],0d
		    	jge caso1
		    	jmp caso3

		    caso1:						;numero de 1 digitos
				add eax,48d
				mov [cade],eax

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
				push dword cade
				push dword [handleConsola]
				call _WriteConsoleA@20
	    	jmp salir	

	  		caso2:						;numero de 2 digitos
	    		xor edx, edx
	    		mov [cade],eax
	    		xor eax,eax

		    	mov eax,[cade]
		    	mov bl,10	
		    	mov dx,0
		    	mov ah,0
		    	div bl
		    	mov [cade],ax
		    	mov [aux],ah

			    mov  ecx, [cade]		;El resultado se guarda en eax, se manda a ecx
			    add  ecx, 48d          	;Se convierte a ASCII
			    mov  [cadena], ecx	    ;Se guarda en la cade
			    xor ecx, ecx
			    mov  ecx, [aux]			;El residuo se guarda en edx, se pasa a ecx
			    add  ecx, 48d           ;Se convierte a ASCII
			    mov  [cadena+1], ecx		;Se guarda el segundo valor
			    
			    xor  edx, edx			;limpio edx
			    xor  eax, eax			;limpio eax	

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
				push dword cadena
				push dword [handleConsola]
				call _WriteConsoleA@20
		    	jmp salir

		    caso3:						;numero de 3 digitos
		    	xor edx, edx

		    	mov [cade],eax
		    	xor eax,eax

				mov eax,[cade]
		    	mov bl,100	
		    	mov dx,0
		    	mov ah,0
		    	div bl
		    	mov [cade],ax
		    	mov [aux],ah

		    	mov  ecx, [cade]		;El resultado se guarda en eax, se manda a ecx
			    add  ecx, 48d          	;Se convierte a ASCII
			    mov  [cadena], ecx	    ;Se guarda en la cade
			    xor ecx, ecx

			    mov eax,[aux]
		    	mov bl,10	
		    	mov dx,0
		    	mov ah,0
		    	div bl
		    	mov [cade],ax
		    	mov [aux],ah
		    	
		    	mov  ecx, [cade]		;El resultado se guarda en eax, se manda a ecx
			    add  ecx, 48d          	;Se convierte a ASCII
			    mov  [cadena+1], ecx	    ;Se guarda en la cade
			    xor ecx, ecx
			    mov  ecx, [aux]			;El residuo se guarda en edx, se pasa a ecx
			    add  ecx, 48d           ;Se convierte a ASCII
			    mov  [cadena+2], ecx		;Se guarda el segundo valor

			    push dword -11							
				call _GetStdHandle@4					
				mov [handleConsola],eax					
				xor eax,eax								
				mov eax,3d								
				mov [longitudCadena],eax				
				xor eax,eax								
				mov eax,0d								
				mov [ultimoArgumento],eax				
				push dword [ultimoArgumento]
				push dword caractEscritos
				push dword [longitudCadena]
				push dword cadena
				push dword [handleConsola]
				call _WriteConsoleA@20
		    	jmp salir
	salir:		
		push dword 0
		call _ExitProcess@4	
    ;empieza a evaluar el digito
    s110:
		cmp byte [ecx],48d
		jne s111
		add eax,0
		jmp n1d1
	s111:
		cmp byte [ecx],49d
		jne s112
		add eax,1
		jmp n1d1
	s112:
		cmp byte [ecx],50d
		jne s113
		add eax,2
		jmp n1d1
	s113:
		cmp byte [ecx],51d
		jne s114
		add eax,3
		jmp n1d1
	s114:
		cmp byte [ecx],52d
		jne s115
		add eax,4
		jmp n1d1
	s115:
		cmp byte [ecx],53d
		jne s116
		add eax,5
		jmp n1d1
	s116:
		cmp byte [ecx],54d
		jne s117
		add eax,6
		jmp n1d1
	s117:
		cmp byte [ecx],55d
		jne s118
		add eax,7
		jmp n1d1
	s118:
		cmp byte [ecx],56d
		jne s119
		add eax,8
		jmp n1d1
	s119:
		cmp byte [ecx],57d
		;jne s110
		add eax,9
		jmp n1d1
    s120:
		cmp byte [ecx+1],48d
		jne s121
		mov edx,10d
		mul edx
		add eax,0
		jmp n1d2
	s121:
		cmp byte [ecx+1],49d
		jne s122
		mov edx,10d
		mul edx
		add eax,1
		jmp n1d2
	s122:
		cmp byte [ecx+1],50d
		jne s123
		mov edx,10d
		mul edx
		add eax,2
		jmp n1d2
	s123:
		cmp byte [ecx+1],51d
		jne s124
		mov edx,10d
		mul edx
		add eax,3
		jmp n1d2
	s124:
		cmp byte [ecx+1],52d
		jne s125
		mov edx,10d
		mul edx
		add eax,4
		jmp n1d2
	s125:
		cmp byte [ecx+1],53d
		jne s126
		mov edx,10d
		mul edx
		add eax,5
		jmp n1d2
	s126:
		cmp byte [ecx+1],54d
		jne s127
		mov edx,10d
		mul edx
		add eax,6
		jmp n1d2
	s127:
		cmp byte [ecx+1],55d
		jne s128
		mov edx,10d
		mul edx
		add eax,7
		jmp n1d2
	s128:
		cmp byte [ecx+1],56d
		jne s129
		mov edx,10d
		mul edx
		add eax,8
		jmp n1d2
	s129:
		cmp byte [ecx+1],57d
		jne c11;
		mov edx,10d
		mul edx
		add eax,9
		jmp n1d2
	c11:
		add [n11],eax 			;guardamos numero de 1 digito
		jmp num2;

	s130:
		cmp byte [ecx+2],48d
		jne s131
		mov edx,10d
		mul edx
		add eax,0
		jmp c13
	s131:
		cmp byte [ecx+2],49d
		jne s132
		mov edx,10d
		mul edx
		add eax,1
		jmp c13
	s132:
		cmp byte [ecx+2],50d
		jne s133
		mov edx,10d
		mul edx
		add eax,2
		jmp c13
	s133:
		cmp byte [ecx+2],51d
		jne s134
		mov edx,10d
		mul edx
		add eax,3
		jmp c13
	s134:
		cmp byte [ecx+2],52d
		jne s135
		mov edx,10d
		mul edx
		add eax,4
		jmp c13
	s135:
		cmp byte [ecx+2],53d
		jne s136
		mov edx,10d
		mul edx
		add eax,5
		jmp c13
	s136:
		cmp byte [ecx+2],54d
		jne s137
		mov edx,10d
		mul edx
		add eax,6
		jmp c13
	s137:
		cmp byte [ecx+2],55d
		jne s138
		mov edx,10d
		mul edx
		add eax,7
		jmp c13
	s138:
		cmp byte [ecx+2],56d
		jne s139
		mov edx,10d
		mul edx
		add eax,8
		jmp c13
	s139:
		cmp byte [ecx+2],57d
		jne c12
		mov edx,10d
		mul edx
		add eax,9
		jmp c13
	c12:
		add [n11],eax				;guardamos numero de 2 digitos	
		jmp num2
	c13:
		add [n11],eax				;guardamos numero de 3 digitos	
		jmp num2

	;empieza a evaluar el digito
    s210:
		cmp byte [ecx],48d
		jne s211
		add eax,0
		jmp n2d1
	s211:
		cmp byte [ecx],49d
		jne s212
		add eax,1
		jmp n2d1
	s212:
		cmp byte [ecx],50d
		jne s213
		add eax,2
		jmp n2d1
	s213:
		cmp byte [ecx],51d
		jne s214
		add eax,3
		jmp n2d1
	s214:
		cmp byte [ecx],52d
		jne s215
		add eax,4
		jmp n2d1
	s215:
		cmp byte [ecx],53d
		jne s216
		add eax,5
		jmp n2d1
	s216:
		cmp byte [ecx],54d
		jne s217
		add eax,6
		jmp n2d1
	s217:
		cmp byte [ecx],55d
		jne s218
		add eax,7
		jmp n2d1
	s218:
		cmp byte [ecx],56d
		jne s219
		add eax,8
		jmp n2d1
	s219:
		cmp byte [ecx],57d
		;jne s210
		add eax,9
		jmp n2d1
    s220:
		cmp byte [ecx+1],48d
		jne s221
		mov edx,10d
		mul edx
		add eax,0
		jmp n2d2
	s221:
		cmp byte [ecx+1],49d
		jne s222
		mov edx,10d
		mul edx
		add eax,1
		jmp n2d2
	s222:
		cmp byte [ecx+1],50d
		jne s223
		mov edx,10d
		mul edx
		add eax,2
		jmp n2d2
	s223:
		cmp byte [ecx+1],51d
		jne s224
		mov edx,10d
		mul edx
		add eax,3
		jmp n2d2
	s224:
		cmp byte [ecx+1],52d
		jne s225
		mov edx,10d
		mul edx
		add eax,4
		jmp n2d2
	s225:
		cmp byte [ecx+1],53d
		jne s226
		mov edx,10d
		mul edx
		add eax,5
		jmp n2d2
	s226:
		cmp byte [ecx+1],54d
		jne s227
		mov edx,10d
		mul edx
		add eax,6
		jmp n2d2
	s227:
		cmp byte [ecx+1],55d
		jne s228
		mov edx,10d
		mul edx
		add eax,7
		jmp n2d2
	s228:
		cmp byte [ecx+1],56d
		jne s229
		mov edx,10d
		mul edx
		add eax,8
		jmp n2d2
	s229:
		cmp byte [ecx+1],57d
		jne c21
		mov edx,10d
		mul edx
		add eax,9
		jmp n2d2
	c21:
		add [n21],eax						;guardamos numero de 1 digito
		jmp menu
	s230:
		cmp byte [ecx+2],48d
		jne s231
		mov edx,10d
		mul edx
		add eax,0
		jmp c23
	s231:
		cmp byte [ecx+2],49d
		jne s232
		mov edx,10d
		mul edx
		add eax,1
		jmp c23
	s232:
		cmp byte [ecx+2],50d
		jne s233
		mov edx,10d
		mul edx
		add eax,2
		jmp c23
	s233:
		cmp byte [ecx+2],51d
		jne s234
		mov edx,10d
		mul edx
		add eax,3
		jmp c23
	s234:
		cmp byte [ecx+2],52d
		jne s235
		mov edx,10d
		mul edx
		add eax,4
		jmp c23
	s235:
		cmp byte [ecx+2],53d
		jne s236
		mov edx,10d
		mul edx
		add eax,5
		jmp c23
	s236:
		cmp byte [ecx+2],54d
		jne s237
		mov edx,10d
		mul edx
		add eax,6
		jmp c23
	s237:
		cmp byte [ecx+2],55d
		jne s238
		mov edx,10d
		mul edx
		add eax,7
		jmp c23
	s238:
		cmp byte [ecx+2],56d
		jne s239
		mov edx,10d
		mul edx
		add eax,8
		jmp c23
	s239:
		cmp byte [ecx+2],57d
		jne c22
		mov edx,10d
		mul edx
		add eax,9
		jmp c23
	c22: 
		add [n21],eax						;guardamos numero de 2 digitos
		jmp menu
	c23:
		add [n21],eax						;guardamos numero de 3 digitos
		jmp menu