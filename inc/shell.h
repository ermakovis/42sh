#ifndef SHELL_H
# define SHELL_H

#include "libft.h"
#include "utils.h"
#include "read_line.h"
#include "lexer.h"
#include "parser.h"
#include "execute.h"

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdarg.h>


typedef struct				s_shell
{
	char					*shell_name;
	char					*line;
	t_list					*tl;
	t_ast					*ast;
	t_read_line				*rl;
}							t_shell;

t_shell						*g_shell;
#endif
