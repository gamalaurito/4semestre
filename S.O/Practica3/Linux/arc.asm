segment .data
cadena db 'Programa en ensamblador para linux', 0xA ;cadena a imprimir
segment .text ;Segmanto de codigo
	global _start ; punto de inicio del programa
_start:
	mov edx, 38d	;longitud de la cadena
	mov ecx, cadena	;cadana a escribir
	mov ebx, 1		;salida estandar
	mov eax, 4 		;Numero de llamada al sistema "sys_write"
	int 0x80		;Interrupción de la llamadas al sistema del kernel de Linux
	mov eax, 1		;Numero de llamada al sistema "sys_exit"
	int 0x80		;Interrupcion de llamada all sistema del kernel Linux

