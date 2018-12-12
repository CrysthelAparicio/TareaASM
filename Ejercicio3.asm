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
    Titulo    db "Letra mas repetida",0
      Mensaje1 db "En el texto "
      texto db "UNIVERSIDAD TECNOLÓGICA CENTROAMERICANA"
      Mensaje2   db " la letra mas repetida es la "
      letra db "    ",0  
      
      

.code
include mas_repetida.inc
include bintotext.inc
start:
    mov esi,offset texto
    mov edi,offset letra
    call mas_repetida

    push MB_OK
    push offset Titulo
    push offset Mensaje1
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

