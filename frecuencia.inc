;********************************************************************
;frecuencia_lista: dada una lista de valores terminada en 0
;                   muestra otra con su respectiva frecuencia
;   entrada:edi apunta a la string donde se guarda la nueva lista
;           esi apunta al primer numero de la lista
;   salida: esi apunta al inicio de la lista
;           edi apunta al final de la string donde se guarda la nueva lista
;********************************************************************

frecuencia_lista:
    push ax
    push bx
    push dx
    push esi
inicio:
    push esi
    mov word ptr ax,[esi]
    mov bx,1
volver:
    add esi,2
    mov word ptr dx,[esi]
    cmp dx,0
    je continuar
    cmp dx,ax
    jne volver
    mov [esi],word ptr 255
    inc bx
    jmp volver
continuar:
    cmp ax,255 
    je continuar3
    call bintotxt
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov byte ptr [edi],' '
    inc edi
    mov ax,bx
    call bintotxt
    mov byte ptr [edi],0Dh 
    inc edi
    mov byte ptr [edi],0Ah
    inc edi
continuar3:
    pop esi
    add esi,2
    mov word ptr dx,[esi]
    cmp dx,0
    je fin
    jne inicio
fin:
    pop esi
    pop dx
    pop bx
    pop ax
    ret