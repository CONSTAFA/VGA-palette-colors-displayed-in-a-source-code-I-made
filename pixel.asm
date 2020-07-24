.model small
.stack 256
stack_seg segment
stack_seg ends
data_seg segment
data_seg ends
code_seg segment
assume cs:code_seg,ds:data_seg,ss:stack_seg
start:
mov ax,data_seg
mov ds,ax
mov ah,0h		 ;set video function
mov al,13h	     ;set video mode
int 10h

;mov AH,4Fh        ;Super VGA support
;mov AL,07h        ;Display Start Control
;mov BH,00h        ;Reserved and must be 0
;mov BL,00h        ;Select Display Start
;mov CX,32         ;First Displayed Pixel in Scan Line

mov ah,0ch			;write pixel
mov al,00			;in al color
mov dx,100			;The required line number
mov cx,32			;The required colomn number
mov bh,00			;video mode 0
verder:
int 10h
inc al
inc cx
cmp cx,288
jne verder
mov ax,4ch
int 21h
code_seg ends
end start