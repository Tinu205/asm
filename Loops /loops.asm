.global _start
.intel_syntax

.section .text

_start:
  mov %eax, 1
  mov %ebx,10
  mov %ecx,0
  mov %edx,0
loop:
  add %ecx,%ebx
  dec %ecx

end :
  cmp %edx,%ecx
  jg loop
  
  int 0x80
