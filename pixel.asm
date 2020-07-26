.model small
.stack 256
stack_seg segment
;empty
stack_seg ends
;empty
data_seg segment
;empty
data_seg ends

code_seg segment

assume cs:code_seg,ds:data_seg,ss:stack_seg

start:
mov ax,data_seg  ;empty
mov ds,ax 		 ;empty
mov ah,00	 	 ;set video function in a-high
mov al,13h	     ;set video mode 13 in a-low, 256 colors VGA resolution 
				 ;320 width X 200 long (h stands for hexadecimal)
int 10h			 ;call set video function

;mov AH,4Fh        ;Super VGA support
;mov AL,07h        ;Display Start Control
;mov BH,00h        ;Reserved and must be 0
;mov BL,00h        ;Select Display Start
;mov CX,32         ;First Displayed Pixel in Scan Line

mov ah,0ch			;set function write pixel (h stands for hexadecimal)
mov al,00			;in al color number beginning with color 0 
mov cx,32			;the required colomn number. 32 - 256 - 32 width (total 320 pixels)
mov dx,100			;the required line number. 
					;beginning at the half of the screen line 100
mov bh,00			;video page 0 (dunno what this is doing)
verder:
int 10h  			;call put on pixel
inc al				;increase with 1 color number
inc cx				;next pixel number in column
cmp cx,288			;compare colomn number reached 256 colors (256 + 32 width)
jne verder			;jump if not equal verder
mov ax,4ch			;set function quit to MS-Dos
int 21h				;call function quit to MS-Dos
code_seg ends
end start