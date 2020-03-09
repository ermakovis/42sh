#include "shell.h"
#include <readline/readline.h>
#include <readline/history.h>

char				*read_line(char *prompt)
{
	return (readline(prompt));
}
