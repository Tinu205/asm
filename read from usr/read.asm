.global _start
.intel_syntax


.section .bss
  buffer: .space 100

.section .text

_start:
  mov %eax,3
  mov %ebx,0
  lea %ecx,[buffer]
  mov %edx,100
  int 0x80

  mov %eax,4
  mov %ebx,1
  lea %ecx,[buffer]
  mov %edx,100
  int 0x80

  mov %eax,1
  mov %ebx,69
  int 0x80
  

.section .data
