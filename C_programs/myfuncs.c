#include <string.h>

void strip_newline(char *s) {
	int l;
	l = strlen(s);

	if (l > 0 && s[l-1] == '\n')
		s[l-1] = '\0';
}
