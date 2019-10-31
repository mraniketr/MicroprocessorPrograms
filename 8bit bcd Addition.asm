.model small
.data
num1 db 10,13,"Enter first no: $"
num2 db 10,13,"Enter Second no: $"
result db 10,13,"Result: $"

.code
mov ax,@data
mov ds,ax

lea dx,num1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov cl,04h
ror al,cl
mov bh,al
mov ah,01h
int 21h
sub al,30h
add bh,al

lea dx,num2
mov ah,09h
int 21h
mov ah,01h
int 21h

sub al,30h
ror al,cl
mov bl,al

mov ah,01h
int 21h
sub al,30h
add al,bl

add al,bh
daa

mov ch,00h
adc ch,00h
add ch,30h

mov bh,al
mov bl,al
and bl,0F0h
ror bl,cl
add bl,30h

and bh,0Fh
add bh,30h

lea dx,result
mov ah,09h
int 21h

mov dl,ch
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h

mov dl,bh
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
