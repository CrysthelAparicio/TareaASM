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
      szDlgTitle     db "Numero Mayor",0
      szMsg         db "El mayor entre "
      listat            db "              es "
      mayort        db "         ",0
       datos dw 40,2000,150
.code
         ;acá va el código
include bintotxt.inc
    include lsttotxt.inc
start:
    mov bx,0
    mov esi,offset datos
inicio:
    mov ax,[esi]
    add esi,2
    cmp ax,0
    je valor_mayor
    cmp ax,bx
    jle inicio
    mov bx,ax
    jmp inicio
valor_mayor:
    mov ax,bx
    mov edi,offset mayort
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