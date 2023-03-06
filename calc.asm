;jayendra awasthi
;20BCE0536

start:
mov si,1000h ;[si]=number1   [si+2]=number2   [si+4]=operation to be performed
mov ax,[si]
mov bx,[si+2]
mov cx,[si+4]

;1=addition
;2=subtraction
;3=multiplication
;4=division

cmp cx,0001
jz addition
cmp cx,0002
jz subtraction
cmp cx,0003
jz multiplication
cmp cx,0004
jz division


addition:
    add ax,bx
    jmp pend
    
subtraction:
    sub ax,bx
    jmp pend
    
multiplication:
    imul bx
    jmp pend
    
division:
    idiv bx
    jmp pend
    
pend:
    int 21h
    end
end start