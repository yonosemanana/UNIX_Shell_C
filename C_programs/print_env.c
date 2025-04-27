#include <stddef.h>
#include <stdio.h>

#define N	60	

extern char **environ;

int main (int argc, char *argv[]) {
	
	int i;
	printf("Program name is %s\n", argv[0]);
	printf("Number of arguments of the program is %d\n", argc-1);
	for (i = 1; i < argc; i++)
		printf("argv[%d] = %s\n", i, argv[i]);
	for (i = 0; i < N; i++)
		if (environ[i] != NULL)
			printf("environ[%d] = %s\n", i, environ[i]);
	return 0;
}
