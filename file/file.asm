				SECTION .data
	file_name: db 'myfile.txt'
	msg:	   db 'Welcome to tutorials point'
	len		   equ $-msg
	msg_done:  db  'written to file',10
	len_done:  equ $-msg_done

				SECTION .bss
	fd_out resb 1
	fd_in resb 1
	info resb 26

				SECTION .text
		global main
	main:

	;create file
		mov eax,8
		mov ebx,file_name
		mov ecx,0777
		int 0x80
		mov [fd_out],eax

	;write into file
		mov edx,len
		mov ecx,msg
		mov ebx,[fd_out]
		mov eax,4
		int 0x80

	;close file
		mov eax,6
		mov ebx,[fd_out]

	;write file writing complete
		mov eax,4
		mov ebx,1
		mov ecx,msg_done
		mov edx,len_done
		int 0x80

	;open file for reading

		mov eax,5
		mov ebx,file_name
		mov ecx,0
		mov edx,0777
		int 0x80
		mov [fd_in],eax

	;read from file

		mov eax,3
		mov ebx,[fd_in]
		mov ecx,info
		mov edx,26
		int 0x80
	;close the file
		mov eax,6
		mov ebx,fd_in

	;print the info
		mov eax,4
		mov ebx,1
		mov ecx,info
		mov edx,26
		int 0x80

	;exit program
		mov eax,1
		int 0x80