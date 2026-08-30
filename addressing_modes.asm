DATA SEGMENT WORD 'DATA' 
    
    my_var dw 0000h
    array db 10h, 20h, 30h
    
DATA ENDS

CODE SEGMENT WORD 'CODE'
    
ASSUME CS:CODE DS:DATA
    

start:

mov ax, data
mov ds, ax


; 1. Immediate addressing mode
; The data is constant value given directy in the instruction, reducing flexibility.

mov ax, 5555h

; 2. Register Addressing Mode
; The data is moved from one register to another register.     

mov bx, ax

; 3. Direct Addressing Mode 
; The memory address of the data is given directly in the instruction  

mov [my_var], bx    

; 4. Register Indirect Addressing Mode
; The memory address is held inside a base or index register <BX, BP, SI, DI>.

mov bx, offset my_var
mov cx, [bx] 

; 5. Based Addressing Mode
; Memory address is the sum of base register <BX for data segment & BP for stack segment> and 8-bit or 16-bit displacement.

mov bx, offset array
mov al, [bx + 01h]

; 6. Indexed Addressing Mode
; The memory address is the sum of an index register <SI or DI, used data segment> and a displacement.
mov si, 02h
mov ah, [array + si]

; 7. Based-Indexed Addressing Mode
; Memory address is the sum of base register, index register and optional displacement. 
   
mov bx, offset array
mov si, 01h
mov dl, [bx + si]
        
        
        
mov ax, 4C00h
int 21h

CODE ENDS

END START