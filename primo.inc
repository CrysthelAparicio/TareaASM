;******************************************************************************
;primo: retorna 1 si un numero es primo y 0 si no lo es
;   entrada:ax tiene el numero a evaluar
;   salida: cx retorna 1 si el numero es primo, 0 si no es primo
;******************************************************************************

primo:
    push bx
    push dx
    mov bx,2
    mov cx,1
inicio:
    mov dx,0
    push ax
    div bx
    pop ax
    cmp dx,0
    je no_primo
    inc bx
    cmp bx,ax
    je fin
    jne inicio
no_primo:
    mov cx,0
fin:
    pop dx
    pop bx
    ret
    