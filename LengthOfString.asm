.model small
.stack 100h
.data
    var1 DB 100 DUP("$")
    msg DB 'Enter the string $'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg ;load effective address
    ;or mov dx, offset msg
    mov ah, 09h  ;print string whose offset is stored in DX register and that is terminated using $
    int 21h
    
    mov bl, 0 ;count the length of string
    mov si, offset var1
    
    l1: mov ah, 1 ;one character  will be inputted and stored in al
    int 21h
    cmp al,13 ;ASCII value of ENTER  
    je printstring
    mov [si], al
    inc si
    inc bl
    jmp l1
    printstring:
    mov dl, bl
    mov ah, 2 ;print anything stored in dl
    add dl,48
    int 21h

    mov ah,4ch
    int 21h
    
    main endp
end