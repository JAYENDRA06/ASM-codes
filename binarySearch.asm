;jayendra awasthi
;20BCE0536

.data

    begin dw ?
    end dw ?
    two dw ?
    num dw ?

start:
    
    mov [begin],0000
    mov [end],0020
    mov [two],0002
    
    mov [num],0003 ;number to be searched for
    
    mov si,1000h ;starting index of array
           
    
    temp:
        
        mov dx,0000
        mov ax,[begin] ;using ax to store mid count
        add ax,[end]
        div [two]
        add ax,dx ;adding the remainder
    
        mov bp,ax
        mov cx,[si+bp]
        cmp cx,[num]
        je found
        jg greater
        jng smaller
        
        continueExecution:
        
            mov cx,[begin]
            cmp cx,[end]
            jge notFound
            
        cmp [two],0000 ;will always jump
        jnz temp
        
    greater: ;if middle value of array is greater than the number to be found then end=mid-1
    
        dec ax
        mov [end],ax
        cmp [two],0000  ;will always jump
        jnz continueExecution
    
    smaller: ;if middle value of array is smaller than the number to be found then begin=mid+1
    
        inc ax
        mov [begin],ax
        cmp [two],0000  ;will always jump
        jnz continueExecution
        
    found: ;if number found then assign ax 1(indicating found) and dx with the index of found number
    
        mov ax,bp
        mov dx,0000
        div [two]
        mov dx,ax
        mov ax,0001
        cmp [two],0000  ;will always jump
        jnz ending
        
    notFound: ;if number not found then assign ax with 0(indicating not found)
    
        mov ax,0000
           
    ending:
        
        int 21h
        end
    
end start       