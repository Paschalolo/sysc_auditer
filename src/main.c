#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <errno.h>
#include <arch.h>
#include <pthread.h>
/* Declaration of our raw assembly dispatcher in x86_64.S */

void audit_getpid(void) {
    printf("[*] Auditing System Call: sys_getpid (Number: %d)\n", SYS_getpid);

    /* Path A: Standard Libc Wrapper */
    errno = 0;
    pid_t libc_pid = getpid();
    int libc_errno = errno;

    /* Path B: Direct Raw Assembly Syscall */
    errno = 0;
    long direct_ret = (long) sys_getpid(); 
    int direct_errno = errno;

    printf("--------------------------------------------------\n");
    printf("  [Libc Wrapper]   -> PID: %d | Errno: %d\n", libc_pid, libc_errno);
    printf("  [Direct Syscall] -> PID: %ld | Errno: %d\n", direct_ret, direct_errno);
    printf("--------------------------------------------------\n");

    if ((long)libc_pid == direct_ret && libc_errno == direct_errno) {
        printf("[+] VERIFICATION PASSED: Direct syscall matches libc wrapper. No user-space hooks detected.\n");
    } else {
        printf("[!] ANOMALY DETECTED: Discrepancy found between libc and direct kernel execution!\n");
    }
}

int main() {
    printf("=== Direct-Syscall Auditing Tool ===\n");
    
    if (getuid() != 0) {
        printf("[!] Note: Running as non-root user (some system calls may return EPERM).\n");
    }

    audit_getpid();

    return EXIT_SUCCESS;
}
