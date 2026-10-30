
#ifndef MY_SYSCAL_AUDIT_H
#define MY_SYSCAL_AUDIT_H

#if defined(__cplusplus)
extern "C" long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
#else
long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
#endif

#endif 
