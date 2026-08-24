.model small          

stack segment para stack 'stack'
    dw 100h dup(0)
stack ends

data segment word 'data'
    num1 dw 003ch ;60 in decimal format
    num2 dw 000fh ;15 in decimal format
    gcd dw ?      ;variable to store result
    l_count dw ?  ;variable to store loop counter
data ends

code segment word 'code' ;instructing mapping of registers to segments to assembler
    assume cs:code, ds:data, ss:stack
    
main proc
              
    ;initialize data segment
    mov ax, data
    mov ds, ax              
    
    ;initialze loop counter
    xor cx, cx
    
    ;loading values into registers
    mov ax, num1
    mov bx, num2
          
    ;increment loop counter
    back:                  
    inc cx                    
    
    cmp ax, bx
    je result   ;if AX==BX, GCD if found
    jnc ahead   ;if AX>BX, jump to AHEAD
    sub bx, ax  ;if AX<BX, BX=BX-AX
    jmp back
    
    ahead:
    sub ax, bx  ;AX=AX-BX
    jmp back
    
    result:
    mov gcd, ax     ;for storing gcd result
    mov l_count, cx ;store total loops
    
    mov ah, 4ch
    int 21h         
   
main endp  

code ends

end main