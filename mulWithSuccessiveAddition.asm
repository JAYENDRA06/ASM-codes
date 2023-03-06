;jayendra awasthi
;20BCE0536
.model small
.stack 100h
.data
    num1 db 8
    num2 db 9
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cl, [num1]
    mov ch, 0
    mov bx, cx
    mov dl, [num2]
    
    loop1:
    dec dl
    cmp dl, 0
    je terminate
    add cx, bx
    jmp loop1
    
    terminate:
    mov ax, cx
 
endp main
end