.global _start
.intel_syntax


.section .text

_start:

  ;mov dword ptr[%esp],0x0a434241
  push 0x0a434241
  mov %eax,4
  mov %ebx,1
  mov %ecx,%esp
  mov %edx,4
  int 0x80

  ;exit code
  mov %eax,1
  mov %ebx,69
  int 0x80

 
