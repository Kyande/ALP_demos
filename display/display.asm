;setup  constant
SYS_EXIT	equ 1
SYS_WRITE	equ 4
SYS_READ	equ 3
STD_IN		equ 0
STD_OUT		equ 1

;macros
%macro read 2
	mov eax,SYS_READ
	mov ebx,STD_IN
	mov ecx,%1
	mov edx,%2
	int 0x80
%endmacro

%macro write 2
	mov eax,SYS_WRITE
	mov ebx,STD_OUT
	mov ecx,%1
	mov edx,%2
	int 0x80
%endmacro

;setup data section
			SECTION .data
msg1:	db "please enter statement",10
len1	equ $-msg1

;setup bss section
			SECTION .bss
var		resb 50
var2	resb 50

;setup code section
			SECTION .text
	global main
main:
;prompt user for input
	
	write 	msg1,len1

;read input from user
	
	read 	var,50

;load

	mov ecx,50
	mov esi,var
	rep	lodsb

;store
	
	mov ecx,50
	mov edi,var2
	rep stosb

;scan



;print

	write 	edi,50

;exit
	mov eax,SYS_EXIT
	int 0x80