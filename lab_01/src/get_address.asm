vec_seg dw 0
vec_off dw 0
crlf db 13, 10, '$'


start:
    mov ax, 3508h
    int 21h

    mov ax, es
    mov [vec_seg], ax

    mov [vec_off], bx

    mov ax, [vec_seg]
    call print_hex

    mov dl, ':'
    mov al, 02h
    int 21h

    mov ax, [vec_off]
    call print_hex

    mov dx, crlf
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h




print_hex:

    push ax
    push bx
    push cx
    push dx

    mov bx, ax
    mov cx, 4

next_digit:

    rol bx, 4
    mov dl, bl

    and dl, 0Fh

    cmp dl, 9
    jbe digit
    
    add dl, 7

digit:
    add dl, '0'

    mov ah, 02h
    int 21h

    loop next_digit

    pop dx
    pop cx
    pop bx
    pop ax

    ret
