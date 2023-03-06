;jayendra awasthi
;20BCE0536
.model small  
.data  
    num1 db 8  
    num2 db 4  
.code 
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov bl, [num2]
    mov bh, 0
    mov cl, 9 ;count for 8-bit numbers
    mov dl, [num1]
    mov ah, 0
    
    loop1:
    dec cl
    cmp cl, 0
    je terminate
    
    mov al, 1
    and al, bl
    cmp al, 1
    jne continue
    
    add ah, 1 ;making CF = 0
    add bh, dl
    jmp cont
    
    continue:
    add ah, 1 ;making CF = 0
    cont:
    rcr bx, 1
    jmp loop1
    
    terminate:
    mov ax, bx
    
endp main
end  