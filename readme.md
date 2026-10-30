# Direct-Syscall Auditing Tool

A lightweight Linux utility written in C and raw assembly that executes system calls directly via CPU instructions (`syscall` on x86-64, `svc` on ARM) bypassing standard libraries (`libc`). Designed for security auditing, rootkit/hook detection research, and low-level kernel boundary analysis.

---

## 🚀 The Concept

Standard Linux applications invoke system calls through `libc` wrappers (e.g., `glibc` or `musl`), which handle register setup, error checking, and sometimes additional instrumentation or security checks. 

This utility bridges user space and kernel space **directly** by:
1. Manually configuring CPU registers according to the target architecture's ABI (Application Binary Interface).
2. Executing raw syscall instructions without standard library mediation.
3. Comparing direct syscall behavior against standard wrapper behavior to detect potential hooked syscall tables, inline user-space hooks, or security monitor bypasses.

---

## 🛠️ Features

* **Bypass `libc` Interception:** Directly invokes kernel services to evade basic user-space API hooks (often used by security solutions or debuggers).
* **Cross-Architecture Support:** Implements raw assembly stubs for **x86-64** (`syscall`) and **ARM64** (`svc #0`).
* **Audit & Comparison Mode:** Traces execution paths and measures discrepancies between standard library calls and direct kernel entry.
* **Zero Dependencies:** Built standalone with minimal footprint, relying solely on compiler intrinsics and inline assembly.

---

## 📂 Project Structure

```text
direct-syscall-auditor/
├── include/
│   ├── auditor.h       # Core definitions and structures
│   └── arch.h          # Architecture-specific register mappings
├── src/
│   ├── main.c          # CLI argument parsing and orchestrator
│   ├── audit.c         # Audit logic and comparison engine
│   └── x86_64.S        # Raw assembly stubs for x86-64
├── Makefile            # Build configuration
└── README.md'
