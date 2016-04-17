segment .data
	handleConsola			dd	1				;Primer argumento para la llamada al sistema _WriteConsoleA()	
	mensaje1 db 'Ingrese la primer cadena:',0xA 	
	mensaje2 db 'Ingrese la segunda cadena:',0xA 	
	mensaje3 db 'Ingrese la tercer cadena:',0xA 	
	mensajefinal db	'La cadena final es:', 0xA		
	longitudCadena 			dd 	1				;tercer argumento 
	caractEscritos			dd 	1				;Cuarto argumento 
	caractLeidos			dd 	1				;Cuarto argumento 
	ultimoArgumento			dd 	1				;Quinto argumento

segment .bss
cad1 resb 50			
	cad2 resb 50			
	cad3 resb 50			
	cadenafinal resb 150

segment .text	
	global _main
	extern _GetStdHandle@4							;Acceso externo a la llamada al sistema _GetStdHandle()
	extern _WriteConsoleA@20						;Acceso externo a la llamada al sistema _WriteConsoleA()
	extern	_ReadConsoleA@20
	extern _ExitProcess@4	

_main:

imprimir1:
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
	push dword mensaje1
	push dword [handleConsola]
	call _WriteConsoleA@20

leer1:
	xor	eax,eax
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
	push	dword cad1
	push	dword [handleConsola]
	call	_ReadConsoleA@20

imprimir2:
	xor		eax,eax
	push dword -11							
	call _GetStdHandle@4					
	mov [handleConsola],eax					
	xor eax,eax								
	mov eax,27d								
	mov [longitudCadena],eax				
	xor eax,eax								
	mov eax,0d								
	mov [ultimoArgumento],eax				
	push dword [ultimoArgumento]
	push dword caractEscritos
	push dword [longitudCadena]
	push dword mensaje2
	push dword [handleConsola]
	call _WriteConsoleA@20

leer2:
	xor	eax,eax
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
	push	dword cad2
	push	dword [handleConsola]
	call	_ReadConsoleA@20
	

imprimir3:
	xor		eax,eax
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
	push dword mensaje3
	push dword [handleConsola]
	call _WriteConsoleA@20

leer3:
	xor	eax,eax
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
	push	dword cad3
	push	dword [handleConsola]
	call	_ReadConsoleA@20

;Asignamos las cadenas
	mov edi,cadenafinal	
	inc edi
	mov esi,cad1	
	mov eax,cad2
	mov ebx,cad3
	mov ecx,0

	loop:			
		mov dl,byte[esi]	
		cmp dl,0xA	
		je caso1										
		mov byte[edi],dl
		inc edi	
		inc esi
		jmp loop1
	caso1:
		inc ecx
		jmp loop1
	;mover cadena 2
	loop1:			
		mov dl,byte[eax]	
		cmp dl,0xA	
		je caso2										
		mov byte[edi],dl
		inc edi	
		inc eax
		jmp loop2
	caso2:
		inc ecx
		jmp loop2
	;mover cadena 3
	loop2:			
		mov dl,byte[ebx]	
		cmp dl,0xA	
		je caso3									
		mov byte[edi],dl
		inc edi	
		inc ebx
		jmp loop
	caso3:
		inc ecx
		jmp verifica
	verifica:
		cmp ecx,3
		je salida
		mov ecx,0
		jmp loop
	
	salida:
		inc edi
		mov byte [edi],0xA 
imprimir4:
	xor		eax,eax
	push dword -11							
	call _GetStdHandle@4					
	mov [handleConsola],eax					
	xor eax,eax								
	mov eax,20d								
	mov [longitudCadena],eax				
	xor eax,eax								
	mov eax,0d								
	mov [ultimoArgumento],eax				
	push dword [ultimoArgumento]
	push dword caractEscritos
	push dword [longitudCadena]
	push dword mensajefinal
	push dword [handleConsola]
	call _WriteConsoleA@20

imprimir5:
	xor		eax,eax
	push dword -11							
	call _GetStdHandle@4					
	mov [handleConsola],eax					
	xor eax,eax								
	mov eax,19d								
	mov [longitudCadena],eax				
	xor eax,eax								
	mov eax,0d								
	mov [ultimoArgumento],eax				
	push dword [ultimoArgumento]
	push dword caractEscritos
	push dword [longitudCadena]
	push dword cadenafinal
	push dword [handleConsola]
	call _WriteConsoleA@20

salir:		
	push dword 0
	call _ExitProcess@4
