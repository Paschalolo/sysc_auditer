
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

	mov rdi , rsi ; mov arg0 to rdi 

	mov rsi , rdx ; mov arg1 to rsi 

	mov rdx , rcx; mov arg2 to rdx

	mov r10 , r8 ; mov arg3 to r10 

	mov r8 , r9 ; mov arg4 to r8  

	mov r9 , qword[rsp + 8] ; mov arg5 to r9 This si pushed to the stack in a regular procedure call

	syscall ; Calls the system call


	ret ; return to caller  
