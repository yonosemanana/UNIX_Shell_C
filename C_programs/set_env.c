#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "myfuncs.h"

#define	BUFSIZE	200
#define ENV_VAR_TEST	"MY_VAR"	// Name of environment variable to test



int main (int argc, char *argv[]) {

	char *env_var; // getenv() return pointer to read-only memory with actual environment variable
       	char var[BUFSIZE*2], buf[BUFSIZE], my_var[BUFSIZE];
	int l;
	strncpy(my_var, ENV_VAR_TEST, BUFSIZE); // Name of environment variable to test

	printf("Enter environment variable to test (default: %s):\n", ENV_VAR_TEST);
	fgets(my_var, BUFSIZE, stdin);
	strip_newline(my_var);

	if ((env_var = getenv(my_var)) == NULL) {
		printf("Environment variable %s not defined. Enter its value:\n", my_var);
		fgets(buf, BUFSIZE, stdin);
		strip_newline(buf);
		snprintf(var, BUFSIZE*2, "%s=%s", my_var, buf);
		putenv(var);
	}
	else {
		printf("Environment variable %s is %s.\n", my_var, env_var);
		printf("Do you want to change its value (Y/N)? [N]\n");
		fgets(buf, BUFSIZE, stdin);
		strip_newline(buf);
		if ( strcmp(buf, "Y") == 0 || strcmp(buf, "y") == 0 ) {
			printf("Enter new value:\n");
			fgets(buf, BUFSIZE, stdin);
			strip_newline(buf);
			snprintf(var, BUFSIZE*2, "%s=%s", my_var, buf);
			putenv(var);
		}
	}
	env_var = getenv(my_var);
	printf("%s=%s\n", my_var, env_var);

	return 0;
}
