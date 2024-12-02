.global _start
.intel_syntax noprefix
.section .text

_start:
  push 68
  push 1
  call add_two
  add  esp, 8

  mov  ebx, eax
  mov  eax, 1
  int  0x80

  .type add_two, @function
add_two:
  push ebp               
  mov  ebp, esp          
  mov  ebx, [ebp+8]
  mov  ecx, [ebp+12]
  add  ebx, ecx

  mov  eax, ebx
  mov  esp, ebp
  pop  ebp
  ret


