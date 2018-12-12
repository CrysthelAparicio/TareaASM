;****************************************************************************************************************************
;removesp:   Remueve los espacios innecesarios de un texto (terminado en cero)
;
;Entrada:  ESI apunta al texto fuente
;               EDI Apunta al texto destino 
;****************************************************************************************************************************
removesp:
     push esi
     push edi
     push ax
     mov ah,1  ; empezamos ignorando espacios
     mov al,[esi]        
     cmp al,0
      je removesp_ponercerofinal    ; la cadena estaba vacía
removesp_next:
     mov al,[esi]
     inc esi
     cmp al,0
     je removesp_findestring
     cmp al,' '
     je removesp_esespacio
     mov ah,0
     jmp removesp_caracteraceptado
 removesp_esespacio:
     cmp ah,1
     je removesp_next
     mov ah,1
 removesp_caracteraceptado:
    mov [edi],al
    inc edi
    jmp removesp_next
 removesp_findestring:
    cmp ah,1
    jne removesp_continuar
    dec edi
 removesp_continuar:
 removesp_ponercerofinal:
    mov byte ptr [edi],0
    pop ax
    pop edi
    pop esi
    ret