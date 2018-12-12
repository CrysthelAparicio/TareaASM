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
      Titulo        db "Fibbonacchi"
      Mensaje   db "El elemento  "
      datot         db "        de la serie es "
      resultadot db "              ",0
      dato          dw 3
.code
;******************************************************************************************************
;fib
;   entrada:   AX la posición del numero fibonnacci
;   salida:      AX el número de fibonnacci
;***************************************************************************************************** 
fib:
   push bx
   push cx
   cmp ax,1
   jle casobase
   dec ax
   mov bx,ax 
   call fib 
   mov cx,ax
   mov ax,bx
   dec ax
   call fib
   add ax,cx
   jmp aret 
casobase:
aret:      
  pop cx
  pop bx
  ret
include bintotxt.inc

         ;acá va el código
start:
    mov ax,dato
    mov edi,offset datot
    call bintotxt
    call fib
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