
;###############################################################################
;paint:
;   entrada: ax fila inicial
;         bx columna inicial
;         esi apuntador al texto
;   salida:  ax factorial retornado
;############################################################################### 

paint:
    call paint_moverpuntero
    cmp byte ptr [edi],'-'
    je paint_pintarder
    ret
paint_pintarder:
    mov byte ptr [edi],'*'
    inc bx
    push ax
    push bx
    call paint
    pop bx
    pop ax
    call paint_moverpuntero
    cmp byte ptr [edi],'-'
    je paint_pintarabajo
paint_pintarabajo:
    dec bx
    inc ax
    push ax
    push bx
    call paint
    pop bx
    pop ax
    call paint_moverpuntero
    cmp byte ptr [edi],'-'
    je paint_pintarizq
paint_pintarizq:
    dec ax
    dec bx
    push ax
    push bx
    call paint
    pop bx
    pop ax
    call paint_moverpuntero
    cmp byte ptr [edi],'-'
    je paint_pintararriba
paint_pintararriba:
    inc bx
    dec ax
    push ax
    push bx
    call paint
    pop bx
    pop ax
    call paint_moverpuntero
    cmp byte ptr [edi],'-'
    je paint_pintar
    ret
paint_pintar:
    mov byte ptr [edi],'*'
    ret
paint_moverpuntero:
    push dx
    push eax
    mov dx,10
    mul dx
    add ax,bx
    and eax,0ffh
    mov edi,offset mensaje
    add edi,eax
    pop eax
    pop dx
    ret