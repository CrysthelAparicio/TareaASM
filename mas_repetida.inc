;**************************************************************************
;mas_repetida: encuentra la letra que mas se repite en un texto
;   entrada:esi debe apuntar a la primera letra del texto
;           edi debe apuntar a donde se desea guardar el mas repetido
;   salida: ah guarda la letra mas repetida  
;           al guarda la cantidad de veces que esta en el texto
;           esi se queda al inicio del texto
;**************************************************************************

mas_repetida:
    push bx
    push esi
    mov ah,[esi]
    mov al,1
inicio:
    push esi
    mov bh,[esi]
    mov bl,1
contar_letra:
    inc esi
    cmp byte ptr [esi],0
    je comp_letra_ant
    cmp [esi],bh
    jne contar_letra
    inc bl
    jmp contar_letra
comp_letra_ant:
    cmp bl,al
    jle aumentar_esi
    mov ah,bh
    mov al,bl
    jle aumentar_esi
aumentar_esi:
    pop esi
    inc esi
    cmp byte ptr [esi],0
    jne inicio
    je fin
fin:
    pop esi
    pop bx
    mov byte ptr [edi],ah
    ret