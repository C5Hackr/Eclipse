# Eclipse

---

A unique introduction to native runtime obfuscation.

---

**Eclipse** is an advanced runtime function obfuscator for **native C/C++ applications on Windows**. It obfuscates function code at runtime, relocates the function to a new memory region, and redirects execution using vectored exception handling. This technique prevents dynamic/dumped analysis, makes debugging difficult, and ensures that the original function code never exists in its true form inside of the original .text section during normal execution, and when combined with a packer, makes static analysis difficult.

---

## 🔥 Features

- **Runtime Function Encryption** – Obfuscates function code dynamically to prevent dynamic/dumped analysis.
- **Exception-Based Execution Handling** – Uses `VEH` (Vectored Exception Handling) to redirect and execute functions when accessed.
- **Junk Code Injection** – Inserts meaningless instructions into the original function to mislead disassembly.
- **Dynamic Function Relocation** – Relocates function code to prevent predictable memory access.
- **Anti-Debugging Protection** – Throws execution traps and invalid memory accesses.
- **Control Flow Obfuscation** – Breaks function execution flow with VEH redirections.

---

## 📥 Installation

Eclipse requires **Windows** and Capstone disassembler.

```sh
# Clone the repository
git clone https://github.com/C5Hackr/Eclipse.git
cd eclipse

# Install Capstone (if not already installed)
# Windows users: Make sure capstone_x86.lib and capstone_x64.lib are available
```

---

## 🚀 Usage

To mark a function for obfuscation, wrap it with `OBF_START` and `OBF_END` and call `ObfuscateFunction()`:

```c
#include <Windows.h>
#include "Eclipse.h"

void SecretFunction()
{
    OBF_START();
    printf("This is a hidden function!\n");
    OBF_END();
}

int main()
{
    ObfuscateFunction((uintptr_t)SecretFunction);
    SecretFunction();
    return 0;
}
```

---

## 🛠️ How It Works

Eclipse implements **self-modifying code** techniques combined with runtime obfuscation. Here’s a **step-by-step breakdown**:

### 1️⃣ **Marking Functions for Encryption**

```c
OBF_START();
// Function logic here
OBF_END();
```

Eclipse scans for these markers to **determine function boundaries**.

### 2️⃣ **Obfuscating the Function**

- The function is copied to a new memory region using `RelocateFunction()`.
- Junk instructions are injected into the original function’s location.
- The original function is replaced with a **mov [INVALID_MEMORY], 1 + JUNK** instructions or **invalid instructions** to trigger an exception.

### 3️⃣ **Intercepting Execution (VEH Handler)**

When execution reaches an obfuscated function, a **exception** occurs, triggering the VEH handler:

```c
LONG WINAPI VEHObfuscationHandler(PEXCEPTION_POINTERS exceptions)
```

It detects access to an obfuscated function and **redirects execution** to its relocated copy.

---

## 🔍 Disassembly Example

After obfuscation, a function might look like this:

```asm
Obfuscated Function (Before Execution):
-------------------------------------
0x00400000:  48:C70425 00000000 010000  ; MOV [INVALID_MEMORY], 1 (Trigger a ACCESS_VIOLATION exception to jump into the VEH handler)
0x00400011:  ?? ?? ?? ?? ??             ; Junk code
0x00400016:  90 90 90 90 90             ; Junk code (NOP sled)

Relocated Function (At Runtime):
--------------------------------
0x7FFF0000:  40 53           ; PUSH RBX
0x7FFF0002:  49 8B D1        ; MOV RDX, R9
0x7FFF0005:  E9 78 56 34 12  ; JMP 0x12345678
0x7FFF0010:  CC              ; INT3 (Breakpoint for returning to original caller via VEH handler)
```

---

## 📊 Execution Flow Diagram

```
+------------+     Access Obfuscated Function    +--------------------+
|  Original  |  ----------------------------->   |  ACCESS_VIOLATION  |
|  Function  |                                   |    (Exception)     |
+------------+                                   +--------------------+
      |                                                    |
      v                                                    v
+------------------+    Decrypt & Execute        +--------------------+
| VEH Exception    | ------------------------->  | Relocated Function |
| Handler Redirect |                             | (Executes Safely)  |
+------------------+                             +--------------------+
```

---

## 🐞 Anti-Debugging Techniques

Eclipse disrupts debugging tools using:

- **Access Violation/Illegal Instruction Traps** (Triggers VEH handler to redirect execution)

---

## ❌ Potential Flaw & Fix

### 🛑 Flaw:

A determined reverse engineer could inject a **DLL** into the process to locate the new memory sections and copy the original code back into the **.text section**. However, this is challenging because:
- They would need to determine **which function belongs where**.
- They would have to correctly **relocate jumps, calls, and memory references** to restore execution flow.
- After the code is restored they would need to dump the process and then reverse it with a disassembler such as IDA PRO.

### ✅ Fix:

To mitigate this, **runtime obfuscation** should be applied after the function is relocated inside `RelocateFunction()`.

#### 🔧 Implementation:
- **Encrypt part of the relocated function** and decrypt it **only when needed**.
- **Runtime x86_64 obfuscation** to make reversing the code much harder.

This additional layer will make it nearly impossible to **reconstruct the original function reliably**.

---

## ⚠️ Limitations

- Only works on **Windows (x86/x64)**.
- Not all operations are supported within the relocation operation.

---

## 🏆 Credits

- Uses **Capstone Disassembly Engine** for function relocation.
- Inspired by **runtime packers and virtualization based obfuscation techniques**.

---

Feel free to contribute!
