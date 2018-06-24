;constants
exit_int	equ 1
std_out		equ 1
std_in		equ 0
read_int	equ 3
write_int	equ 4


			SECTION .data

	msg db "enter character:",10
	lenm	equ $-msg

			SECTION .bss
	var resb 8

			SECTION .text
	global main
main:
	mov eax,write_int
	mov ebx,std_out
	mov ecx,msg
	mov edx,lenm
	int 0x80

	mov eax,read_int
	mov ebx,std_in
	mov ecx,var
	mov edx,8
	int 0x80

start:
	mov eax,write_int
	mov ebx,std_out
	mov ecx,[var]
	mov edx,8
	mov esi,9
	dec esi
	cmp esi,0
	jne start
	int 0x80

	mov eax,exit_int
	int 0x80