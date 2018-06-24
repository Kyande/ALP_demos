;hello world with procedure
;constants.
SYS_WRITE	equ 4
STDOUT 		equ 1
SYS_EXIT	equ 1

			SECTION .data
msg: db "hello world with procedure",10
len	 equ $-msg

			SECTION .text
	global main
main:
;call procedure.
	call print
	int 0x80
	
;exit 
	mov eax,SYS_EXIT
	int 0x80

;procedure
print:
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg
	mov edx,len
	ret