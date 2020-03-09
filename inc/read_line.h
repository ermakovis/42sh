#ifndef READ_LINE_H
# define READ_LINE_H

#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

typedef struct				s_read_line
{
	char					*line;
	t_list					*history;
}							t_read_line;

char				*read_line(char *prompt);

#endif
