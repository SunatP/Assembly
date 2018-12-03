; Author Sunat Praphanwong 6088130
section .text
    global _main
    extern _printf
    extern _scanf

section .bss
    result: resb 4
    temp: resb 4

section .data
    start db "Input Number", 10, 0      ; 10 is go to new line , 0 is finish in this this
    output db "Average is %d", 0,0
    input db "%d",0

_main:
    enter 0,0
    pusha

;start to input number
push start                      
call _printf

add esp, 4              
push temp                   ; keep input in temp
push input                  ;selecting the format in input
call _scanf
add esp,8

mov eax, [temp]
add [result], eax


;2nd to input number
push start
call _printf

add esp, 4
push temp
push input
call _scanf
add esp,8

mov eax, [temp]
add [result], eax


;3rd to input number
push start
call _printf

add esp, 4
push temp
push input
call _scanf
add esp,8

mov eax, [temp]
add [result], eax


;start to calculate

mov edx, 0 
mov eax, [result]
mov ebx, 3
div ebx

push eax
push output
call _printf
add esp,8

pusha
push 0
ret 


