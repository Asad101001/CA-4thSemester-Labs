data segment data
    p dw 1234h
    q dw 5678h
    r dw ?
data ends

stack segment stack
    dw 100h
stack ends

code segment
    assume cs:code, ds:data, ss:stack
  

start:
mov ax, data 
mov ds, ax

mov ax, stack
mov ss, ax
mov sp, 100h

mov ax, p
mov bx, q

push ax
push bx
add ax, bx
mov r, ax
push r    

mov ax, 0
mov bx, 0
mov cx, 0

pop cx
pop bx
pop ax

mov ah, 4Ch
int 21h
code ends

end start

    