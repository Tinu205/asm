.global _start
.intel_syntax noprefix 


.section .text
_start:
  mov eax, 4
  mov ebx, 1
  lea ecx,[first_num]
  mov edx, f_len
  int 0x80


  #exit code
  mov eax,1
  mov ebx,0
  int 0x80


.section .data
  first_num : .ascii "Enter first number: \n"
  f_len = . - first_num
  second_num: .ascii "Enter second number: \n"
  operation : .ascii "Enter the operation to be performed: \n"

  
.section .bss


