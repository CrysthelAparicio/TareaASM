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
    Titulo    db "Frecuencia",0
      titulos db "Numero Repeticiones",0Dh, 0Ah
      Mensaje   db "                                                                                                             ",0
      lista dw 23,21,22,13,23,13,0  

.code
include frecuencia.inc
include bintotext.inc

start:
    mov edi,offset Mensaje
    mov esi, offset lista
    call frecuencia_lista
    push MB_OK
    push offset Titulo
    push offset titulos
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

