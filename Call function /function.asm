.global _start
.intel_syntax

.section .data
 message: .ascii "Hello, world\n"

.section .text
_start :

  call print_hello
  int 0x80

  mov %eax,1
  mov %ebx,69
  int 0x80

print_hello :
  mov %eax,4
  mov %ebx,1
  lea %ecx,[message]
  mov %edx,13
  int 0x80
  ret
