;jayendra awasthi
;20BCE0536

data segment
    
    zero db 0
    val db ?
    eight db ?
ends

stack segment
    dw 128 dup(0)
ends   

code segment 
    start:
    mov ax,@data
    mov ds,ax
    

    mov bl,0f1h ;hex value to be converted to binary
    
    repeat:
        mov [eight],8
        mov [val],bl
        and [val],11110000B
        shr [val],4  
           
        
        loopit:
            mov ch,[val]
            and ch,[eight]
            cmp ch,0
            jnz print1
            jz print0
            
            continue:
            shr [eight],1
            cmp [eight],0
            jnz loopit
        
        shl bl,4
        cmp bl,0
        jnz repeat
        
        cmp [zero],1
        jnz ending
        
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