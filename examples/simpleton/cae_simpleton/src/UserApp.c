#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#define PERSONALITY_SIG "simpleton"
#include <convey/usr/cny_comp.h>

typedef unsigned long long uint64;

extern long cpInc();
extern void cpIncMem();

int main(int argc, char *argv[])
{
	// The cnycc compiler always defines __CONVEY for use with preprocessor directives.
	// You can use it with more complex projects to compile with both gcc and cnycc.
#ifdef __CONVEY
	printf("Program compiled with cnycc\n");
#else
	printf("Program compiled with gcc.\n");
#endif

	// Get personality signature
	// The "pdk" personality is the PDK sample vadd personality
	cny_image_t        sig1, sig2;
	int stat;
	cny_get_signature(PERSONALITY_SIG, &sig1, &sig2, &stat);
	
	if (stat) {
		printf("***ERROR: cny_get_signature() Failure: %d\n", stat);
		printf("Make sure you set your environmental variables!\n");
		exit(1);
	}
	
	// Make first coprocessor call
	uint64 value = 10;
	value = l_copcall_fmt(sig1, cpInc, "A", value);
	printf("Value is now %u (should be 11)\n", value);


	// Allocate memory; make second coprocessor call
	// Requires cross bar to be enabled in main Makefile
  	uint64 *address = (uint64 *) cny_cp_malloc(8);
	*address = 20;
	copcall_fmt(sig1, cpIncMem, "A", address);
	printf("Value is now %u (should be 21)\n", *address);
	
	return 0;
}
