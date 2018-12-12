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
     titulo db "Paint",0
     mensaje db "xxxxxxxx",13,10
             db "x------x",13,10
             db "x-----xx",13,10
             db "x---xxxx",13,10
             db "x-xx---x",13,10
             db "x--xx-x",13,10
             db "x------x",13,10
             db "xxxxxxxx",13,10,13,10
             db "xxxxxxxx",13,10
             db "x------x",13,10
             db "x-----xx",13,10
             db "x---x-xx",13,10
             db "x-xx--xx",13,10
             db "xx--xx-x",13,10
             db "x------x",13,10
             db "xxxxxxxx",0
     fila dw 2
     columna dw 3
.code
include pintar.inc
include bintotxt.inc
start:
    mov ax,fila
    mov bx,columna
    call paint
aimprimir:
    push MB_OK
    push offset titulo
    push offset mensaje
    push 0
    call MessageBox
    push 0
    call ExitProcess
end start
    ; --------------------------------------------------------
    ; The following are the same function calls using MASM
    ; "invoke" syntax. It is clearer code, it is type checked
    ; against a function prototype and it is less error prone.
    ; --------------------------------------------------------

    ; invoke MessageBox,0,ADDR szMsg,ADDR szDlgTitle,MB_OK
    ; invoke ExitProcess,0


