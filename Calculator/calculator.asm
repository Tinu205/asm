.global _start
.intel_syntax noprefix 

.section .data
  first_num :.ascii "Enter first number: "
  f_len     =.-first_num
  second_num:.ascii "Enter second number: "
  s_len     =.-second_num
  operation :.ascii "Enter the operation to be performed: "
  op_len    =.-operation
  sol_prom  :.ascii "The solution is: "
  sol_len   =.-sol_prom
  buffer    : .byte 0 

.section .bss
  num1      : .skip 4 
  num2      : .skip 4  
  solution  : .skip 4
  
.section .text
_start:
  #prompt for first number
  mov  eax, 4
  mov  ebx, 1
  lea  ecx,[first_num]
  mov  edx, f_len
  int  0x80
  
  #Read first number
  mov  eax, 3
  mov  ebx, 0 
  lea  ecx, [buffer]
  mov  edx, 10
  int  0x80

  lea  ecx, [buffer]
  call convert_int
  mov  [num1], eax 

  #prompt for second number 
  mov  eax, 4
  mov  ebx, 1
  lea  ecx, [second_num]
  mov  edx, s_len
  int  0x80
  
  #read second number 
  mov  eax, 3 
  mov  ebx, 0 
  lea  ecx, [buffer]
  mov  edx, 10 
  int  0x80 

  lea  ecx, [buffer]
  call convert_int
  mov  [num2], eax 

  #Read the operator prompt
  mov  eax, 4
  mov  ebx, 1
  lea  ecx, [operation]
  mov  edx, op_len
  int  0x80
  #Read the operator 
  mov  eax, 3
  mov  ebx, 0  
  lea  ecx, [buffer]
  mov  edx, 1 
  int 0x80 
 
  #Write the solution prom 
  mov eax, 4
  mov ebx, 1 
  lea ecx, [sol_prom]
  mov edx, sol_len
  int 0x80

  #Do the math 
  mov  al, [buffer]
  cmp  al, 43
  je   addition
  call exit_code
  #cmp ecx,'45'
  #cmp ecx,'42'
  #cmp ecx,'47'

  #Addition
addition: 
  mov  eax, [num1]
  add  eax, [num2]
  mov  [solution], eax
  
  lea  ecx, [buffer]
  call int_to_string

  mov  eax, 4
  mov  ebx, 1 
  lea  ecx, [solution]
  mov  edx, 1
  int  0x80
  call exit_code

  .type int_to_string,  @function 
int_to_string:
  xor  ebx, ebx 
  mov  ebx, 10 
  xor  edx, edx 
  xor  esi, esi 

convert_digit:
  xor  edx, edx
  div  ebx 
  add  dl,'0'
  push dx
  inc  esi 
  test eax, eax
  jnz  convert_digit

write_digit:
  pop  ax 
  mov  [ecx], al
  inc  ecx 
  dec  esi 
  jnz  write_digit
  ret

  .type convert_int, @function
convert_int:
  xor  eax, eax 
  lea  ecx, [ecx]

convert_loop:
  mov  bl, byte [ecx]
  cmp  bl, 10
  je   end_convert
  sub  bl, '0'
  imul eax, eax, 10
  add  eax, ebx 
  inc  ecx
  jmp  convert_loop

  .type end_convert, @function 
end_convert:
  ret 
exit_code:
  #exit code
  mov  eax, 1
  mov  ebx, 0
  int  0x80


