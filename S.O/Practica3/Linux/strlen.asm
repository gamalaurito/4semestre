SYS_EXIT 	equ 1
SYS_READ 	equ 3
SYS_WRITE 	equ 4
STDIN 		equ 0
STDOUT 		equ 1

segment .data
	num db 0

segment .bss
	string  resb 100
	valor   resb 5
	aux 	resb 5

segment .text
	global _start

_start:
	mov edx, 100d
	mov ecx, string
	mov ebx, STDIN
	mov eax, SYS_READ
	int 0x80
	mov ESI, string
	call strlen

strlen:
	cmp BYTE [ESI], '@'
	je dividendo
	inc BYTE [num]
	inc ESI
	call strlen

dividendo:
	mov AX, [num]
	mov bl, 10
	mov EDI, valor
	mov BYTE [EDI], '@'
	inc EDI
	call dividir

dividir:
	cmp AX, 0
	je cambio
	div bl
	add AH, '0'
	mov [EDI], AH
	inc EDI
	mov [num], AL
	mov AX, [num]
	call dividir

cambio:
	mov ESI, aux
	call voltear
 
 voltear:
 	cmp BYTE [EDI], '@'
 	je resul
 	mov dl, [EDI]
 	mov [ESI], dl
 	inc ESI
 	dec EDI
 	call voltear

resul:
	mov BYTE [ESI], 0xA
	mov edx, 5d
	mov ecx, aux
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	call exit

exit:
	mov eax, SYS_EXIT
	int 0x80