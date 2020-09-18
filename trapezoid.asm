

org  100h    ;It defines where the machine code is to be placed in memory
                 


   
; initializing the start point
x_initial equ 100     
y_initial equ 100

length    equ 40     ; defining a proper length for the lines 
color     equ 15     ; let the color be white

; set video mode 13h - 320x200

code:   mov ah, 0
        mov al, 13h     ;we choose graphical mode. 40x25. 256 colors. 320x200 pixels. 1 page.
        int 10h       



;initialiing start point , and preparing the print pixel interrupt
       
       mov ah, 0ch         ; setting the int 10h interrupt to change pixel color
       mov al, color       ; setting the pixel color
       mov cx, x_initial   ; cx will change with x value
       mov dx, y_initial   ; dx will change with y value  
       
; draw first line:       
line1: 
       int 10h             ; print the pixel using the interrupt int 10h   
       inc cx
       dec dx              ; because pixels are counted downwards and i want to draw upwards
       cmp cx, x_initial+length   ;the loop condition 
       jc line1
 
; draw second line:


line2: 
       int 10h             ; print the pixel
       inc cx       
       cmp cx, x_initial+2*length
       jc line2            ; we use jc to loop as long as x is smaller than the final value
 
; draw third line:


line3: 
       int 10h             ; print the pixel    
       inc cx
       inc dx         ; now i'm going downwards
       cmp cx, x_initial+3*length
       jc line3 
    
    
; draw fourth line:
line4: 
       int 10h        ; print the pixel    
       dec cx         ; now i'm going backward with cx
       cmp cx, x_initial
       JNC line4      ;here we loop with JNC instead to stop at minimum value as cx is decreasing
 





ret       ;termination

