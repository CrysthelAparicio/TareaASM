; #########################################################################
      .386
      .model flat, stdcall    
      option casemap :none   ; case sensitive

; #########################################################################

      include \masm32\include\windows.inc
      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc

      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib

; #########################################################################
.data
      ;acá van los datos
      szDlgTitle     db "Numero Menor",0
      szMsg         db "El elemento menor de la lista "
      listat            db "                                              es "
      menort        db "            ",0
       datos dw 12,20,30,12,4,8,16
.code
         ;acá va el código
include bintotxt.inc
    include lsttotxt.inc
start:
    mov bx,9999
    mov esi,offset datos
inicio:
    mov ax,[esi]
    add esi,2
    cmp ax,0
    jle valor_menor
    cmp ax,bx
    jge inicio
    mov bx,ax
    jmp inicio
valor_menor:
    mov ax,bx
    mov edi,offset menort
    call bintotxt
    mov esi,offset datos
    mov edi,offset listat
    call lsttotxt
    push MB_OK
    push offset szDlgTitle
    push offset szMsg
    push 0
    call MessageBox
    push 0
    call ExitProcess

    ; --------------------------------------------------------
    ; The following are the same function calls using MASM
    ; "invoke" syntax. It is clearer code, it is type checked
    ; against a function prototype and it is less error prone.
    ; --------------------------------------------------------

    ; invoke MessageBox,0,ADDR szMsg,ADDR szDlgTitle,MB_OK
    ; invoke ExitProcess,0

end start