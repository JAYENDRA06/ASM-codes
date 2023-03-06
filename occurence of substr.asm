;jayendra awasthi
;20BCE0536

data segment
    str db 'jayendra$'
    substr db 'end$'
    len1 db 0
    len2 db 0
    msg1 db 10,13,'string : $'
    msg2 db 10,13,'substring : $'
    msg3 db 10,13,'substring found at position : $'
    pos db -1
    rtn db '-1$'
data ends

display macro msg

    mov ah,9
    lea dx,msg
    int 21h
endm

code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax
        display msg1
        display str
        display msg2
        display substr
        lea si,str
    nxt1:
        cmp [si],'$'
        je done1
        inc len1
        inc si
        jmp nxt1
    done1:
        lea di,substr
    nxt2:
        cmp [di],'$'
        je done2
        inc len2
        inc di
        jmp nxt2
    done2:
        display msg3
        lea si,str
        mov al,len1
        sub al,len2
        mov cl,al
        mov ch,0
    first:
        inc pos
        mov al,[si]
        cmp al,substr[0]
        je cmpr
        inc si
        loop first
    cmpr: inc si
        mov al,[si]
        cmp al,substr[1]
        jne notequal
        inc si
        mov al,[si]
        cmp al,substr[2]
        je equal
    notequal:
        mov pos,-1
        display rtn
        jmp exit
    equal:
        mov dl,pos
        add dl,30h
        mov ah,2
        int 21h
    exit: mov ah,4ch
    int 21h
code ends
end start