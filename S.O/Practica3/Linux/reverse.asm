SYS_EXIT 	equ 1
SYS_READ 	equ 3
SYS_WRITE 	equ 4
STEDIN 		equ 0
STDOUT 		equ 1

segment .data
	read db 0
	tam  db 0 

segment .bss
	cadlec	resb 50;
	cads	resb 500;

segment .text
	global _start

_start:
	mov EDI, cads
	call scanf

scanf:
	cmp BYTE [read], 10
	je imprimir
	inc BYTE [read]
	mov edx, 50d
	mov ecx, cadlec
	mov ebx, STEDIN
	mov eax, SYS_READ
	int 0x80
	mov ESI, cadlec
	mov BYTE [tam], 0
	call voltear

voltear:
	cmp BYTE [ESI], '@'
	je ajuste
	inc ESI
	inc BYTE [tam]
	call voltear

ajuste:
	dec ESI
	call agregar

agregar:
	cmp BYTE [tam], 0 
	je scanf
	mov dl, [ESI]
	mov [EDI], dl
	inc EDI
	dec ESI
	dec BYTE [tam]
	call agregar

imprimir:
	mov BYTE [EDI], 0xA
	mov edx, 500d
	mov ecx, cads
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80
	call exit

exit:
	mov eax, SYS_EXIT
	int 0x80
