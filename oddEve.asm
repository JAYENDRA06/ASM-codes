;jayendra awasthi
;20BCE0536

.data

    sum dw ?
    nums dw ?

start:
    
    
    mov di,1000h
    mov si,2000h
    mov nums,si ;so the 10 even numbers will be at location 2000h
    mov [di],00
    mov ax,01
    mov bx,02
    
    
    temp:
       
        mov dx,000
        mov cx,ax
        div bx
        cmp dx,0000 ;if number is even dx register will have value 0 when number will be divided by 2
        jz even
    cont:
        mov ax,cx
        inc ax
        cmp ax,0021
        jnz temp
        jz ending
    
    even: ;when number is even, add that number to the sum and put that number in array stored at si or nums 
        
        mov [si],cx
        add [di],cx
        inc si
        cmp cx,0000
        jnz cont

    ending:
        
        mov ax,[di]
        mov [sum],ax ;the sum will be stored at location sum ,here that is 00000h
        int 21h 
        end
        
end start