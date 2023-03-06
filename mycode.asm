;searching a character using linear search in string-8086
.model small
.stack 100h
.data
	text db 'jayendra awasthi'
	count dw 16
	search db 'd'
	found db 'string Found$'
	notfound db 'string not Found$'
.code
main proc
    	mov ax,@data
		mov dx,ax

		mov es,ax
		mov cx,count

		mov di,offset text
		mov al,search

		repne scasb				;repeat scan string if not equal
		jz yes

		lea dx,notfound
		mov ah,09h
		int 21h
		jmp over

        yes:	
        lea dx,found
		mov ah,09h
		int 21h
		
        over:
        mov ah,4ch
		int 21h
		
		main endp
end