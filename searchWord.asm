.model small
.stack 100h
.data
    var1 db 'jayendra$'
    var2 db 'xnd$'
    msg1 db 'found$'
    msg2 db 'not found$'
    
.code
main proc
    mov ax, @data
    mov si, offset var1
    mov di, offset var2
    mov cx, 0 
    
    loop1:
    inc si
    mov ax, [di]
    cmp ax, [si] 
    jne loop1
    
    loop2:
    cmp [di], "$"
    je found
    cmp [si], "$"
    je notfound
    mov ax, [di]
    cmp ax, [si]
    jne partLoop1  ;reset di and si
    
    inc di
    inc si
    inc cx
    jmp loop2
    
    
    partLoop1:
    inc cx
    sub si, cx
    sub di, cx
    mov cx, 0
    jmp loop1
    
    found:
    lea dx, msg1
    mov ah, 09h
    int 21h
    jmp ending
    
    notfound:
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    ending:
    mov ah, 4ch
    int 21h
    
    main endp
end