;jayendra awasthi
;20BCE0536
.model small
.stack 100h
.data
    size db 8
.code
main proc    
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov ch, [size] ;size of array
    mov bh, -1 
    
    loop1:
    mov si, 1000h ;array stored at location 1000h
    inc bh
    
    cmp bh, ch
    je terminate
    
    mov cl, ch
    sub cl, bh
    
    loop2:
    cmp cl, 1
    je loop1
    mov dh, [si]
    cmp dh, [si+1]
    jng continue
    xchg dh, [si+1] ;swapping
    mov [si], dh
    
    continue:
    dec cl
    inc si
    jmp loop2 
    
    terminate:
    
endp main
end