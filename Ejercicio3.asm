      .386
      .model flat,stdcall    
      option casemap :none  
      
      include \masm32\include\windows.inc
      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc
      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib

.data
      titulo       db "Letra que mas se repite",0
      mensaje db " "
      text db "Hola amiguitos, soy Gocu",13,10
      aux db "letra que mas se repite: "
      resultado db "  ",0

.code
include bin2txt.inc

start:
  mov ax,0
  mov dx,0
  mov esi,offset text
  mov edi,esi
  add edi,1
  mov ecx,offset aux

  lazo:
    cmp esi,ecx
    jge salida
    cmp edi,ecx
    jge cicloaux

 equal:
    mov bh,[esi]
    cmp bh,[edi]
    je repetido
    add edi,1
    jmp lazo

  repetido:
    inc ax
    add edi,1
    jmp lazo

  cicloaux:
    add esi,1
    mov edi,esi
    add edi,1

    cmp ax,dx
    jge cicloFrecuencia
    mov ax,0
    jmp equal

   cicloFrecuencia:
    mov dx,ax
    mov bl,bh
    mov ax,0
    jmp equal
  
  salida:
    mov edi,offset resultado
    mov [edi],bl
    push MB_OK
    push offset titulo
    push offset mensaje
    push 0
    call MessageBox
    push 0
    call ExitProcess

end start
