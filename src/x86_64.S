
; Name : raw_syscall 
; Author : Paschal Ahanmisi 


;===================================================================================================================
;long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
; ==================================================================================================================

; x86_64 LINUX OS ABI COnvention 
;====================================================================================
; syscallNo ||  return || arg0 ||  arg1 ||  arg2 ||  arg3  ||  arg4  || arg5
; rax       ||  rax    || rdi  || rsi   || rdx   || r10    || r8    ||  r9 
;====================================================================================
SECTION .text
global raw_syscall 

raw_syscall : 
	; Register set up 
	mov rax , rdi ; mov the system call number to rax 
	syscall ; Calls the system call
	ret ; return to caller  
