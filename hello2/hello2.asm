;hello world with procedure
;constants.
SYS_WRITE	equ 4
STDOUT 		equ 1
SYS_EXIT	equ 1

; Implements the write system call
%macro write_string 2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


			SECTION .data
msg: db "hello world with procedure",10
len	 equ $-msg

			SECTION .text
	global main
main:
;use macro.
	write_string msg,len
	int 0x80
	
;call exit 
	call exit
	int 0x80

;procedure
exit:
	mov eax,SYS_EXIT
	ret