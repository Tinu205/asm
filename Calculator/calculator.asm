.global _start
.intel_syntax noprefix 

.section .data
  first_num : .ascii "Enter first number: \n"
  f_len = . - first_num

  second_num: .ascii "Enter second number: \n"
  s_len = . - second_num

  operation : .ascii "Enter the operation to be performed: \n"
  op_len = . - operation

  buffer    : .byte 0 


.section .bss
  num1      : .skip 4 
  num2      : .skip 4  
  

.section .text
_start:
  #prompt for first number
  mov eax, 4
  mov ebx, 1
  lea ecx,[first_num]
  mov edx, f_len
  int 0x80
  
  #Read first number
  mov eax, 3
  mov ebx, 0 
  lea ecx, [buffer]
  mov edx, 10
  int 0x80

  lea ecx, [buffer]
  call convert_int
  mov [num1],eax 

  #prompt for second number 
  mov eax, 4
  mov ebx, 1
  lea ecx,[second_num]
  mov edx, s_len
  int 0x80
  
  #read second number 
  mov eax, 3 
  mov ebx, 0 
  lea ecx, [buffer]
  mov edx, 10 
  int 0x80 

  lea ecx,[buffer]
  call convert_int
  mov [num2], eax 

#Read the operator 
  mov eax, 4
  mov ebx, 1
  lea ecx,[operation]
  mov edx, op_len
  int 0x80
  
#exit the program
  call exit_code

  .type convert_int, @function
convert_int:
  xor eax,eax 
  lea ecx ,[ecx]

convert_loop:
  mov  bl , byte [ecx]
  cmp  bl , 10
  je   end_convert
  sub  bl , '0'
  imul eax,eax,10
  add eax,ebx 
  inc ecx
  jmp convert_loop

  .type end_convert, @function 
end_convert:
  ret 
exit_code:
  #exit code
  mov eax,1
  mov ebx,0
  int 0x80


