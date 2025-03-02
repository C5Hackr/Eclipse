#include <Windows.h>
#include <iostream>
#include <signal.h>
#include "Eclipse.h"

#pragma warning(disable: 6031)

#pragma region Math Stuff
int factorial(int n) {
	if (n == 0 || n == 1) {
		return 1;
	}
	else {
		return n * factorial(n - 1);
	}
}
int fibonacci(int n) {
	if (n <= 1) {
		return n;
	}
	else {
		return fibonacci(n - 1) + fibonacci(n - 2);
	}
}
void printArray(int arr[], int size) {
	int i;
	for (i = 0; i < size; i++) {
		printf("%d ", arr[i]);
	}
}
void modifyArray(int arr[], int size) {
	int i;
	for (i = 0; i < size; i++) {
		arr[i] *= 2;
	}
}

#define SQUARE(x) ((x) * (x))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

// Structure definition
struct Person {
	char name[50];
	int age;
};

int gcd(int a, int b) {
	if (b == 0)
		return a;
	else
		return gcd(b, a % b);
}
void swap(int* xp, int* yp) {
	int temp = *xp;
	*xp = *yp;
	*yp = temp;
}
void bubbleSort(int arr[], int n) {
	for (int i = 0; i < n - 1; i++) {
		for (int j = 0; j < n - i - 1; j++) {
			if (arr[j] > arr[j + 1]) {
				swap(&arr[j], &arr[j + 1]);
			}
		}
	}
}
#pragma endregion

EXTERN_C __declspec(dllexport) int testCCode(int numberArgument)
{
	OBF_START();

	// Arg test
	printf("Arg 1 is: %d | Function will return %d + 1\n", numberArgument, numberArgument);

	// Arithmetic operations
	int a = 5, b = 3;
	int result = a + b * 2 - 1;

	// Logical operations
	int x = 10, y = 20;
	int logical_result = (x > y) && (x != 0);

	// Control structures
	if (a > b) {
		printf("a is greater than b\n");
	}
	else {
		printf("b is greater than or equal to a\n");
	}

	// Pointers and arrays
	int arr[5] = { 1, 2, 3, 4, 5 };
	int* ptr = arr;
	printf("First element of array: %d\n", *ptr);
	printf("Third element of array: %d\n", *(ptr + 2));

	// Loops
	printf("Array elements: ");
	printArray(arr, 5);
	printf("\n");

	// Function call
	int factorial_result = factorial(5);
	printf("Factorial of 5: %d\n", factorial_result);

	// Fibonacci sequence
	printf("Fibonacci sequence up to 10: ");
	int i;
	for (i = 0; i < 10; i++) {
		printf("%d ", fibonacci(i));
	}
	printf("\n");

	// Dynamic memory allocation
	int* dynamic_array = (int*)malloc(3 * sizeof(int));
	dynamic_array[0] = 10;
	dynamic_array[1] = 20;
	dynamic_array[2] = 30;
	printf("Dynamic array elements: ");
	printArray(dynamic_array, 3);
	free(dynamic_array);

	// Bitwise operations
	int num1 = 10, num2 = 5;
	printf("Bitwise AND: %d\n", num1 & num2);
	printf("Bitwise OR: %d\n", num1 | num2);
	printf("Bitwise XOR: %d\n", num1 ^ num2);

	// Sizeof operator
	printf("Size of int: %lu bytes\n", sizeof(int));

	OBF_END();

	return numberArgument;
}

EXTERN_C __declspec(dllexport) void testCCode2(const char* stringArg, int numberArg)
{
	OBF_START();

	// Arg test
	printf("Arg 1 is: %s\n", stringArg);
	printf("Arg 2 is: %d\n", numberArg);

	// String manipulation
	char str1[20] = "Hello";
	char str2[20] = "World";
	char str3[40];

	// String concatenation
	strcpy(str3, str1);
	strcat(str3, " ");
	strcat(str3, str2);
	printf("Concatenated string: %s\n", str3);

	// String length
	printf("Length of str1: %lu\n", strlen(str1));

	// String comparison
	printf("Comparison of str1 and str2: %d\n", strcmp(str1, str2));

	// Structures
	struct Person person1;
	strcpy(person1.name, "John Doe");
	person1.age = 30;

	struct Person person2 = { "Jane Doe", 25 };

	printf("Person 1: %s, %d\n", person1.name, person1.age);
	printf("Person 2: %s, %d\n", person2.name, person2.age);

	// Dynamic memory
	int* arr = (int*)malloc(5 * sizeof(int));
	if (arr == NULL) {
		printf("Memory allocation failed!\n");
		return;
	}
	for (int i = 0; i < 5; i++) {
		arr[i] = i + 1;
	}
	printf("Dynamic array elements: ");
	for (int i = 0; i < 5; i++) {
		printf("%d ", arr[i]);
	}
	printf("\n");
	free(arr);

	// Macros
	int num = 4;
	int max_val = MAX(10, 20);
	printf("Square of %d: %d\n", num, SQUARE(num));
	printf("Max of 10 and 20: %d\n", max_val);

	// Recursive functions
	int gcd_result = gcd(48, 18);
	printf("GCD of 48 and 18: %d\n", gcd_result);

	// Sorting algorithms
	int sortArr[] = { 64, 34, 25, 12, 22, 11, 90 };
	int n = sizeof(sortArr) / sizeof(sortArr[0]);
	bubbleSort(sortArr, n);
	printf("Sorted array: ");
	for (int i = 0; i < n; i++) {
		printf("%d ", sortArr[i]);
	}
	printf("\n");

	OBF_END();
}

EXTERN_C __declspec(dllexport) void DemoFunction()
{
	int InputNum = 0;
	float a = 0;
	float b = 0;
	float result = 0;
	do
	{
		printf("Type number to choose the algorithm\n");
		printf(" 1. + \n 2. - \n 3. *\n 4. / \n 5. ^ \n 6. square \n ");
		printf("7. log \n 8.floor \n 9. ceil \n 10.Exit\n InputNum: ");
		scanf("%d", &InputNum);
		switch (InputNum)
		{
		case(1):
		{
			OBF_START();
			printf("Enter First Number: ");
			scanf("%f", &a);
			printf("Enter Second Number: ");
			scanf("%f", &b);
			result = a + b;
			printf("%.2f + %.2f = %.2f\n", a, b, result);
			OBF_END();
			break;
		}
		case(2):
		{
			OBF_START();
			printf("Enter First Number: ");
			scanf("%f", &a);
			printf("Enter Second Number: ");
			scanf("%f", &b);
			result = a - b;
			printf("%.2f - %.2f = %.2f\n", a, b, result);
			OBF_END();
			break;
		}
		case(3):
		{
			OBF_START();
			printf("Enter First Number: ");
			scanf("%f", &a);
			printf("Enter Second Number: ");
			scanf("%f", &b);
			result = a * b;
			printf("%.2f * %.2f = %.2f\n", a, b, result);
			OBF_END();
			break;
		}
		case(4):
		{
			OBF_START();
			printf("Enter Dividend: ");
			scanf("%f", &a);
			printf("Enter Divisor: ");
			scanf("%f", &b);
			if (b == 0) {
				printf("Please check the divisor that can not be zero.\n");
			}
			else {
				result = a / b;
				printf("%.2f / %.2f = %.2f\n", a, b, result);
			}
			OBF_END();
			break;
		}
		case(5):
		{
			OBF_START();
			printf("Enter the number ");
			scanf("%f", &a);
			printf("Enter the second number ");
			scanf("%f", &b);
			printf("first number to the power of second number is %.2f \n ", pow(a, b));
			OBF_END();
			break;
		}
		case(6):
		{
			OBF_START();
			printf("Enter the radicand ");
			scanf("%f", &a);
			printf("square root is %.2f \n", sqrt(a));
			OBF_END();
			break;
		}
		case(7):
		{
			OBF_START();
			printf("Enter the log ");
			scanf("%f", &a);
			printf("the log is %.2f \n", log(a));
			OBF_END();
			break;
		}
		case(8):
		{
			OBF_START();
			printf("Enter the number ");
			scanf("%f", &a);
			printf("the float is %.2f \n", floor(a));
			OBF_END();
			break;
		}
		case(9):
		{
			OBF_START();
			printf("Enter the number ");
			scanf("%f", &a);
			printf("the ceil is %.2f \n", ceil(a));
			OBF_END();
			break;
		}
		case(10):
		{
			OBF_START();
			printf("Thank you for using code !!\n");
			OBF_END();
			break;
		}
		default:
		{
			printf("Invalid number.\n");
		}
		}
	} while (InputNum);
}

/*
__declspec(noinline) void DemoFunction(void* DummyArgument) //Function type must have the __declspec(noinline) attribute, and use OBF_START and OBF_END macros to encrypt function code, you need to encrypt the function as many times as you have a OBF_START/END pair.
{
	OBF_START();
	printf("[ourfunction] - hello world!\n");
	OBF_END();
}
*/

int main()
{
	printf("Encrypting code section (Execution will pause once encryption is finished for inspection in x64dbg/IDA dump)...\n");
	ObfuscateFunction((uintptr_t)testCCode); //Encrypt testCCode.
	ObfuscateFunction((uintptr_t)testCCode2); //Encrypt testCCode2.
	system("pause");

	printf("[START!]\n");

	printf("[======================testCCode========================]\n");
	int returnValue = (int)testCCode(15); //Execute Encrypted Function.
	printf("testCCode return value is: %d\n", returnValue);

	printf("[======================testCCode2=======================]\n");
	testCCode2("abcd", 123); //Execute Encrypted Function.

	printf("[=====================DemoFunction======================]\n");
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 1st pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 2nd pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 3rd pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 4th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 5th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 6th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 7th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 8th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 9th pair.
	ObfuscateFunction((uintptr_t)DemoFunction); //Encrypt DemoFunction 10th pair.
	DemoFunction(); //Execute Encrypted Function.

	printf("[END!]\n");

	system("pause");
	exit(0);
}
