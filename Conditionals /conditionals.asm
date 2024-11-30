.global _start

.intel_syntax

.section .text
  mov %ebx,10
  mov %ecx ,9

  cmp %ebx,%ecx
  jge end_block
  mov %ebx,0

end_block:
  mov %eax,1
  mov %ebx,69
  int 0x80
