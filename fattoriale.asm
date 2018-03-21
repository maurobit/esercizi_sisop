extern scanf, printf, exit
global main

segment .text
main:

push imsg
call printf

push x
push ifmt
call scanf

push dword[x]
fattoriale:
prologo:
push ebp
mov ebp,esp

sub esp, 4 ;alloco uno spazione nello stack

corpo:
mov eax,1
mov ecx, [ebp+8]
cmp ecx,1
jz epilogo

mov ecx,[ebp+8]
sub ecx,1
push ecx
call fattoriale
mov [ebp-4],eax
mul dword[ebp+8]

epilogo:
add esp, 4 ;inutile perchèdopo ripristino esp
mov esp,ebp
pop ebp
ret

push eax
push ofmt
call printf

call exit

segment .rodata
imsg: db 'Inserisci un numero intero: ',0
ifmt: db '%d',0
ofmt: db 'Fattoriale: %d',10,0

segment .bss
x: resd 1
