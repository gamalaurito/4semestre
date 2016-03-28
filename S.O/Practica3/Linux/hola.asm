segment .bss			;Segmento de datos
	cadena db 50 			;Cadena a alamacenar

segment .text			;Segmento de código
	global _start		;punto de entrada (ld)

_start:					;Inicio del programa
	mov edx, 50d		;longitud del bufer	
	mov ecx, cadena 	;Cadena a leer
	mov ebx, 0			;Entrada estandar
	mov eax, 3			;llamada al sistema "sys_read"
	int 0x80			;Interrupcion de C.S
	mov edx, 50d		;Longitud de cadena
	mov ecx, cadena 	;Cadena a escribir
	mov ebx, 1			;Salida estandar
	mov eax, 4			;"sys_write"
	int 0x80			;Interrumpcion de C.S
	mov eax, 1			;"sys_exit"
	int 0x80			;Interrumpcion de C.S
	
