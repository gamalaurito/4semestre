SYS_EXIT 	equ 1
SYS_READ 	equ 3
SYS_WRITE 	equ 4
STDIN 		equ 0
STDOUT 		equ 1

segment .data
	cad db 13,10
	count db 20h
	max db 30h

segment .text
	global _start

_start:
	call printf

aumento:
	cmp BYTE [max], 39h
	je exit
	inc BYTE [max]
	call printf

printf:
	mov edx, 1
	mov ecx, max
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	call salto

salto:
	mov edx, 2
	mov ecx, cad
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	jmp aumento

exit:
	mov eax, SYS_EXIT		;Numero de llamada al sistema "sys_exit"
	int 0x80				;Interrupcion de llamada all sistema del kernel Linux
