.global _start
.intel_syntax noprefix 



.section .data
  first_num : .ascii "Enter first number: \n"
  f_len = . - first_num
  second_num: .ascii "Enter second number: \n"
  s_len = . - second_num
  operation : .ascii "Enter the operation to be performed: \n"
  op_len = . - operation

 

.section .text
_start:
  mov eax, 4
  mov ebx, 1
  lea ecx,[first_num]
  mov edx, f_len
  int 0x80
  

  mov eax, 4
  mov ebx, 1
  lea ecx,[second_num]
  mov edx, s_len
  int 0x80


  mov eax, 4
  mov ebx, 1
  lea ecx,[operation]
  mov edx, op_len
  int 0x80



  #exit code
  mov eax,1
  mov ebx,0
  int 0x80
 
.section .bss


