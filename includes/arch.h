
#ifndef MY_SYSCAL_AUDIT_H
#define MY_SYSCAL_AUDIT_H
#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
#if defined(__cplusplus)
extern "C" long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
#else
extern long raw_syscall(long number , long arg0 , long arg1 , long arg2 , long arg3 , long arg4 , long arg5 );
#endif

ssize_t sys_read(unsigned int fd , char* buf , size_t count ){
	#if defined(__x86_64__) || defined(__amd64__) || defined(_M_X64)
		return raw_syscall(0x00LL,(long)fd , (long) buf , (long)count , 0 ,0 ,0 );
	#elif defined(__aarch64__) || defined(_M_ARM64)
	#endif 
}

pid_t sys_getpid(void){

	#if defined(__x86_64__) || defined(__amd64__) || defined(_M_X64)
		return (pid_t) raw_syscall(0x27LL , 0,0,0,0,0,0);
	#elif defined(__aarch64__) || defined(_M_ARM64)
	#endif 
}

#endif 
