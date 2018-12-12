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
    Titulo    db "Primo",0
      m_inicio1 db "El numero "
      numero1 db "   "
      Mensaje1   db " es primo ",0
      m_inicio2 db "El numero "
      numero2 db "   "
      Mensaje2 db " no es primo",0  
    
.code
include primo.inc
include bintotext.inc
start:
    mov ax,48
    call primo
    cmp cx,1
    je es_primo
    jne no_es_primo
es_primo:
    movzx esi,ax
    mov edi,offset numero1
    call bintotxt
    push MB_OK
    push offset Titulo
    push offset m_inicio1
    jmp final
 no_es_primo:
    movzx esi,ax
    mov edi,offset numero2
    call bintotxt
    push MB_OK
    push offset Titulo
    push offset m_inicio2
    
final:
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

