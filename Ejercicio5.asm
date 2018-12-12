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
      Titulo        db "Factorial"
      Mensaje   db "El factorial de "
      datot         db "        es "
      resultadot db "              ",0
      dato          dw 5
.code
;******************************************************************************************************
;fact
;   entrada:   AX el numero a sacarle el factorial
;   salida:      AX el factorial del número
;***************************************************************************************************** 
fact:
   push dx
   push bx
   cmp ax,1
   jle casobase
   mov bx,ax
   dec ax
   call fact
   mul bx
   jmp aret
casobase:
   mov ax,1
aret:      
  pop bx
  pop dx
  ret
include bintotxt.inc

         ;acá va el código
start:
    mov ax,dato
    mov edi,offset datot
    call bintotxt
    call fact
    mov edi,offset resultadot
    call bintotxt
    push MB_OK
    push offset Titulo
    push offset Mensaje
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