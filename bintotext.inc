;****************************************************************
;bin to text: Dado un numero binario de 16 bits, lo convierte a cadena,(no le agrega el cero)
;   entrada:ax el numero a convertir
;           edi direccion donde se colocara el resultado
;             
;   salida: edi apunta al siguiente caracter despues de la conversion
;           
;
;***************************************************************
bintotxt:
    push ax
    push bx
    push dx
    mov bx,10
    push bx    
bintotxt_metsigd:
    cmp ax,0
    je bintotxt_sacsigd
    mov dx,0
    div bx
    push dx
    jmp bintotxt_metsigd
    
bintotxt_sacsigd:
    pop ax
    cmp al,10
    je bintotxt_elfin
    add al,48
    mov [edi],al
    inc edi
    jmp bintotxt_sacsigd
    
bintotxt_elfin: 
    pop dx
    pop bx
    pop ax
    ret

    ; --------------------------------------------------------
    ; The following are the same function calls using MASM
    ; "invoke" syntax. It is clearer code, it is type checked
    ; against a function prototype and it is less error prone.
    ; --------------------------------------------------------

    ; invoke MessageBox,0,ADDR szMsg,ADDR szDlgTitle,MB_OK
    ; invoke ExitProcess,0

