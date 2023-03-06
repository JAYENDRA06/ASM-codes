.model small
.stack 100h

.data
    string db 'jayendra$'
    count dw 8
    pos db -1
    word1 db 'y$'
    msg1 db 'found at $'
    msg2 db 'not found$'

.code

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    lea si, string
    mov cx, count
    loop1:
    inc pos
    cmp cx, 0
    je notfound
    mov bl, [si]
    cmp bl, word1[0]
    je found
    inc si
    dec cx
    jmp loop1
    
    found:
    lea dx, msg1
    mov ah, 9
    int 21h
    mov dl, pos
    add dl, 30h
    mov ah, 2
    int 21h
    jmp ending
    
    notfound:
    lea dx, msg2
    mov ah, 9
    int 21h
    
    ending:
    mov ah,04ch
    int 21h
    
    main endp
end