;***********************************************************************************************
; bintotxt convierte un numero que està en binario a texto
; 
; entrada
;       ax    es el nùmero a convertir
;       edx  debe apuntar a donde se colocarà el texto    
; salida
;       edx  apuntarà al siguiente caracter despues de haber puesto el texto  
;********************************************************************************************** 

bin2txt:
    push ax
    push bx
    push dx
    push word ptr 10
bin2txt_siguientedigito:
    cmp ax,0
    je bin2txt_sacardigitos 
    mov bx,10
    mov dx,0
    div bx
    push dx
    jmp bin2txt_siguientedigito
bin2txt_sacardigitos:
    mov cx,0
bin2txt_lazo2:
    cmp cx,10
    je bin2txt_elfin 
    pop cx
    cmp cx,10
    je bin2txt_salte
    add cl,48
    mov [edi],cl
bin2txt_salte:
    inc edi
    jmp bin2txt_lazo2
bin2txt_elfin:
    pop dx
    pop bx
    pop ax
    ret