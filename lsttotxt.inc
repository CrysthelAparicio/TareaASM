;**********************************************
;lsttotxt
;entrada  esi -> lista_val
;              edi -> string
;
;**********************************************
lsttotxt:
    push esi
    push edi
    push ax
lsttotxt_inicio:
    mov ax,[esi]
    add esi,2
    cmp ax,0
    je lsttotxt_a_ret 
    call bintotxt 
    mov byte ptr [edi],','
    add edi,1
    jmp lsttotxt_inicio
lsttotxt_a_ret:
    pop ax
    pop edi
    pop esi
    ret