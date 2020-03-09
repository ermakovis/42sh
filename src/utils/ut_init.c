#include "shell.h"

int				ut_init(char **env)
{
	if (!(g_shell = ft_memalloc(sizeof(t_shell))))
		exit (EXIT_FAILURE);
	g_shell->shell_name = ft_strdup("42sh");

	return (EXIT_SUCCESS);
}
