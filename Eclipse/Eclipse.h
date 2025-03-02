#include <Windows.h>
#include "capstone/capstone/capstone.h"

#ifdef _WIN64
#pragma comment(lib, "libs\\capstone_x64.lib")
#else
#pragma comment(lib, "libs\\capstone_x86.lib")
#endif

#define USE_ILLEGAL_INSTRUCTION		FALSE

typedef struct {
	uintptr_t NewFunctionAddress;
	uintptr_t FunctionAddress;
	uintptr_t ReturnAddress;
	uintptr_t JumpBackAddress;
	SIZE_T functionSize;
} ObfuscatedFunctionList;

ObfuscatedFunctionList* ObfuscatedFunctions = NULL;
SIZE_T num_ObfuscatedFunctions = 0;

BOOL EclipseHandlerInitialized = FALSE;

#pragma optimize("", off)
EXTERN_C void EclipseBegin();
EXTERN_C void EclipseEnd();
#pragma optimize("", on)

#define OBF_START EclipseBegin
#define OBF_END EclipseEnd

EXTERN_C void EclipseHandler();

void* ResolveJmp(void* functionPointer)
{
#ifdef _DEBUG
	BYTE* address = (BYTE*)functionPointer;
	if (address[0] == 0xE9)
	{
		int32_t offset = *(int32_t*)(address + 1);
		return (void*)(address + 5 + offset);
	}
#endif
	return functionPointer;
}

void* calculate_jump_target(uint8_t* current_address)
{
	if (current_address[0] == 0xE9 || current_address[0] == 0xE8)
	{
		int32_t offset = *(int32_t*)(current_address + 1);
		uint8_t* target_address = current_address + 5 + offset;
		return (void*)target_address;
	}
	return NULL;
}

void generate_junk_code(void* address, int SIZE_OF_FUNCTION, BOOL Use_Illegal_Instruction)
{
	if (Use_Illegal_Instruction == FALSE)
	{
		void* src_func = (void*)ResolveJmp(EclipseHandler);

		if (!src_func)
		{
			return;
		}

		uint8_t* ptr = (uint8_t*)address;

		int bytes_to_copy = SIZE_OF_FUNCTION - (ptr - (uint8_t*)address);
		if (bytes_to_copy > 0)
		{
			memcpy(ptr, src_func, bytes_to_copy);
		}

		uint8_t* end_ptr = (uint8_t*)address + SIZE_OF_FUNCTION;

		for (int i = SIZE_OF_FUNCTION - 1; i >= 0; i--)
		{
			if (((uint8_t*)address)[i] == 0xC3)
			{
				return;
			}
		}

		for (int i = SIZE_OF_FUNCTION - 8; i < SIZE_OF_FUNCTION - 1; i++)
		{
			end_ptr[i - SIZE_OF_FUNCTION] = 0x90;
		}

		end_ptr[-1] = 0xC3;
	}
	else
	{
#if _WIN64
		memset(address, 0x1F, SIZE_OF_FUNCTION);
#else
		memset(address, 0xFE, SIZE_OF_FUNCTION);
#endif
	}
}

__declspec(noinline) void ObfuscateCodeSection(LPVOID address, int SIZE_OF_FUNCTION)
{
	DWORD oldProtect;
	VirtualProtect(address, SIZE_OF_FUNCTION, PAGE_EXECUTE_READWRITE, &oldProtect);
	generate_junk_code(address, SIZE_OF_FUNCTION, USE_ILLEGAL_INSTRUCTION);
	VirtualProtect(address, SIZE_OF_FUNCTION, oldProtect, &oldProtect);
}

__declspec(noinline) LONG WINAPI VEHObfuscationHandler(PEXCEPTION_POINTERS exceptions)
{
	if (exceptions->ExceptionRecord->ExceptionCode == EXCEPTION_ACCESS_VIOLATION || exceptions->ExceptionRecord->ExceptionCode == EXCEPTION_ILLEGAL_INSTRUCTION)
	{
		for (size_t i = 0; i < num_ObfuscatedFunctions; i++)
		{
			if ((uintptr_t)((uintptr_t)exceptions->ExceptionRecord->ExceptionAddress) == (uintptr_t)ObfuscatedFunctions[i].FunctionAddress)
			{
#ifdef _WIN64
				exceptions->ContextRecord->Rip = ObfuscatedFunctions[i].NewFunctionAddress;
#else
				exceptions->ContextRecord->Eip = ObfuscatedFunctions[i].NewFunctionAddress;
#endif
				return EXCEPTION_CONTINUE_EXECUTION;
			}
		}
		return EXCEPTION_CONTINUE_SEARCH;
	}
	else if (exceptions->ExceptionRecord->ExceptionCode == EXCEPTION_BREAKPOINT)
	{
		for (size_t i = 0; i < num_ObfuscatedFunctions; i++)
		{
			if ((uintptr_t)((uintptr_t)exceptions->ExceptionRecord->ExceptionAddress) == (uintptr_t)ObfuscatedFunctions[i].ReturnAddress)
			{
#ifdef _WIN64
				exceptions->ContextRecord->Rip = ObfuscatedFunctions[i].JumpBackAddress;
#else
				exceptions->ContextRecord->Eip = ObfuscatedFunctions[i].JumpBackAddress;
#endif
				return EXCEPTION_CONTINUE_EXECUTION;
			}
		}
		return EXCEPTION_CONTINUE_SEARCH;
	}
	else
	{
		return EXCEPTION_CONTINUE_SEARCH;
	}
}

void* AllocateMemoryNear(void* targetAddr, size_t size)
{
	SYSTEM_INFO sysInfo;
	GetSystemInfo(&sysInfo);

	uintptr_t minAddr = (uintptr_t)targetAddr - 0x7FFFFFFF;
	uintptr_t maxAddr = (uintptr_t)targetAddr + 0x7FFFFFFF;

	uintptr_t baseAddr = (uintptr_t)targetAddr;
	MEMORY_BASIC_INFORMATION mbi;

	for (uintptr_t addr = baseAddr; addr >= minAddr; addr -= sysInfo.dwAllocationGranularity)
	{
		if (VirtualQuery((LPCVOID)addr, &mbi, sizeof(mbi)) == 0)
		{
			continue;
		}
		if (mbi.State == MEM_FREE)
		{
			void* mem = VirtualAlloc((void*)addr, size, MEM_RESERVE | MEM_COMMIT, PAGE_EXECUTE_READWRITE);
			if (mem)
			{
				return mem;
			}
		}
	}

	for (uintptr_t addr = baseAddr; addr <= maxAddr; addr += sysInfo.dwAllocationGranularity)
	{
		if (VirtualQuery((LPCVOID)addr, &mbi, sizeof(mbi)) == 0)
		{
			continue;
		}
		if (mbi.State == MEM_FREE)
		{
			void* mem = VirtualAlloc((void*)addr, size, MEM_RESERVE | MEM_COMMIT, PAGE_EXECUTE_READWRITE);
			if (mem)
			{
				return mem;
			}
		}
	}

	return NULL;
}

void* RelocateFunction(void* func, size_t size)
{
	void* execMemory = AllocateMemoryNear(func, size);

	if (!execMemory)
	{
		return NULL;
	}
	
	csh handle;
	cs_insn* insn;
	size_t count;

#ifdef _WIN64
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK)
#else
	if (cs_open(CS_ARCH_X86, CS_MODE_32, &handle) != CS_ERR_OK)
#endif
	{
		return NULL;
	}

	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	count = cs_disasm(handle, (uint8_t*)func, size, (uint64_t)func, 0, &insn);
	if (count == 0)
	{
		cs_close(&handle);
		return NULL;
	}

	memcpy(execMemory, func, size);

	*(DWORD*)((uintptr_t)execMemory + size) = 0xCC;

	for (size_t i = 0; i < count; i++)
	{
		uint8_t* originalInstr = (uint8_t*)func + insn[i].address - (uint64_t)func;
		uint8_t* relocatedInstr = (uint8_t*)execMemory + insn[i].address - (uint64_t)func;

		BOOL isJump = cs_insn_group(handle, &insn[i], CS_GRP_JUMP);
		BOOL isCall = (insn[i].id == X86_INS_CALL);
		BOOL isRipRelative = FALSE;

#ifdef _WIN64
		if (insn[i].detail)
		{
			cs_x86* x86 = &(insn[i].detail->x86);
			for (int j = 0; j < x86->op_count; j++)
			{
				if (x86->operands[j].type == X86_OP_MEM && x86->operands[j].mem.base == X86_REG_RIP)
				{
					isRipRelative = TRUE;
					break;
				}
			}
		}
#endif

		if (isRipRelative)
		{
#ifdef _WIN64
			int32_t* disp = (int32_t*)(originalInstr + insn[i].size - 4);
			uint64_t originalTarget = (uint64_t)(originalInstr + insn[i].size + *disp);
			uint64_t relocatedTarget = originalTarget;

			int32_t newDisp = (int32_t)(relocatedTarget - (uint64_t)(relocatedInstr + insn[i].size));
			*(int32_t*)(relocatedInstr + insn[i].size - 4) = newDisp;
#endif
		}
		else if (isJump || isCall)
		{
#ifdef _WIN64
			int32_t* disp = (int32_t*)(originalInstr + insn[i].size - 4);
			uint64_t originalTarget = (uint64_t)(originalInstr + insn[i].size + *disp);
			uint64_t relocatedTarget = originalTarget;

			int32_t newDisp = (int32_t)(relocatedTarget - (uint64_t)(relocatedInstr + insn[i].size));

			if (insn[i].size < 4)
			{
				continue;
			}

			*(int32_t*)(relocatedInstr + insn[i].size - 4) = newDisp;
#else
			if (insn[i].size >= 6 && originalInstr[0] == 0xFF)
			{
				if (originalInstr[1] == 0x15 || originalInstr[1] == 0x25)
				{
					continue;
				}
			}

			if (!(originalInstr[0] == 0xE8 || originalInstr[0] == 0xE9))
			{
				continue;
			}

			int32_t* disp = (int32_t*)(originalInstr + 1);
			uint32_t originalTarget = (uint32_t)(originalInstr + insn[i].size + *disp);
			uint32_t relocatedTarget = originalTarget;

			int32_t newDisp = (int32_t)(relocatedTarget - (uint32_t)(relocatedInstr + insn[i].size));

			*(int32_t*)(relocatedInstr + 1) = newDisp;
#endif
		}
	}

	cs_free(insn, count);
	cs_close(&handle);

	memset(execMemory, 0x90, 5);
	
	DWORD oldProtect = 0;
	VirtualProtect(execMemory, size, PAGE_EXECUTE_READ, &oldProtect);

	return execMemory;
}

__declspec(noinline) void ObfuscateFunction(uintptr_t functionPointer)
{
	if (!EclipseHandlerInitialized)
	{
		EclipseHandlerInitialized = TRUE;
		AddVectoredExceptionHandler(1, &VEHObfuscationHandler);
	}

	num_ObfuscatedFunctions++;
	ObfuscatedFunctions = (ObfuscatedFunctionList*)realloc(ObfuscatedFunctions, num_ObfuscatedFunctions * sizeof(ObfuscatedFunctionList));
	ObfuscatedFunctionList* currentHookInfo = &ObfuscatedFunctions[num_ObfuscatedFunctions - 1];
	
	int SIZE_OF_FUNCTION = 0;
	functionPointer = (uintptr_t)ResolveJmp((void*)functionPointer);
	unsigned char* current_address = (unsigned char*)((void*)functionPointer);
	BOOL startCounting = FALSE;
	while (TRUE)
	{
		BYTE* ptr = (BYTE*)current_address;
		if (ptr[0] == 0xE9 || ptr[0] == 0xE8)
		{
			__try
			{
				uintptr_t calculated_target = (uintptr_t)ResolveJmp(calculate_jump_target(current_address));

				if (!startCounting && calculated_target == (uintptr_t)ResolveJmp(&EclipseBegin))
				{
					functionPointer = (uintptr_t)current_address;
					startCounting = TRUE;
				}

				if (startCounting && calculated_target == (uintptr_t)ResolveJmp(&EclipseEnd))
				{
					currentHookInfo->JumpBackAddress = (uintptr_t)(current_address + 5);

					DWORD oldProtect = 0;
					VirtualProtect(current_address, 5, PAGE_EXECUTE_READWRITE, &oldProtect);
					memset(current_address, 0x90, 5);
					VirtualProtect(current_address, 5, oldProtect, &oldProtect);
					break;
				}
			}
			__except (EXCEPTION_EXECUTE_HANDLER)
			{
			}
		}
		if (startCounting)
		{
			SIZE_OF_FUNCTION++;
		}
		current_address++;
	}

	currentHookInfo->FunctionAddress = functionPointer;
	currentHookInfo->functionSize = SIZE_OF_FUNCTION;

	currentHookInfo->NewFunctionAddress = (uintptr_t)RelocateFunction((void*)functionPointer, SIZE_OF_FUNCTION);
	currentHookInfo->ReturnAddress = (uintptr_t)currentHookInfo->NewFunctionAddress + SIZE_OF_FUNCTION;
	ObfuscateCodeSection((LPVOID)functionPointer, SIZE_OF_FUNCTION);
}
