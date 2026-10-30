; Name raw_syscall 
; Author : Ahanmisi Paschal 


;===================================================================================================================
;long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
; ==================================================================================================================

; ARM64 LINUX OS ABI COnvention 
;====================================================================================
; syscallNo ||  return || arg0 ||  arg1 ||  arg2 ||  arg3  ||  arg4  || arg5
; x8       ||   x0    || x0    || x1   || x2     || x3    ||  x4    ||  x5 
;====================================================================================


section .text 
global raw_syscall 


raw_syscall : 
	mov x8 , x0 ; moves register value from x0 to x8 


	mov x0 , x1 ; moves register value from x1 to x0 


	mov x1 , x2 ; moves register value from x2 to x1 


	mov x2 , x3 ; moves register value from x3 to x2 


	mov x3 , x4 ; moves register from x4 to x3


	mov x4 , x5; moves register value from x5 to x4


	mov x5 , x6 ; moves register value from x6 to x5 


	mov x6 , x7 ; moves register value from x7 to x6
	svc #0 ; This si the system call to the operating sytem 
	ret ; return 
