;jayendra awasthi
;20BCE0536

data segment
        
    zero dw 0
    val dw ?
    count dw 15
    checker dw ? 
    
ends

code segment
    
    mov ax,06cf1h
    mov [val],ax
    mov [checker],08000h
    
    
    loopit:
        mov cx,[val]
        xor cx,[checker]
        cmp cx,0
        jz innerloopit
        
        mov cx,[val]
        and cx,[checker]
        cmp cx,[checker]
        jz print0
        jnz print1
        
        continue:
        shl [val],1
        dec count 
        
        cmp [zero],1
        jnz loopit
        
    innerloopit:
        mov dl,'1'
        mov ah,02h
        int 21h
        dec count
        
        looping:
            cmp [count],0
            jnz ending
            mov dl,'0'
            mov ah,02h
            int 21h
            dec count
            cmp [zero],1
            jnz looping
        
        
        
    
    print1:
        mov dl,'1'
        mov ah,02h
        int 21h
        cmp [zero],1
        jnz continue
    
    print0:
        mov dl,'0'
        mov ah,02h
        int 21h
        cmp [zero],1
        jnz continue
        
    ending:
    
ends
