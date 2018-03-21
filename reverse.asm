extern scanf, printf, exit, malloc
global main

segment .text
main:

push imsg1
call printf

push dword n
push ifmt
call scanf

push dword [n]
push imsg2
call printf

mov eax, [n]
mov ecx,4
mul ecx
push eax
call malloc
mov [p],eax

mov ecx,0
scrittura:

cmp ecx,[n]
jz lettura

mov eax,4
mul ecx

mov edx,[p]
add eax,edx
push eax
push ifmt
call scanf

add ecx,1

jmp scrittura

lettura:

mov eax,[n]
sub eax,1
mov [n],eax

mov eax,-1
cmp [n],eax
jz finelettura

mov eax,[n]
mov ecx,4
mul ecx
add eax,[p]

push eax
push ofmt
call printf
jmp lettura

finelettura:

call exit

segment .rodata
imsg1: db 'Inserisci il numero di elementi: ',0
imsg2: db 'Inserisci i %d elementi: ',0
ifmt: db ' %d',0
ofmt: db ' %d',0

segment .bss
n: resd 1
p: resd 1
