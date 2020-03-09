#include "shell.h"

bool				check_loop(void)
{
	return (true);
}

int					main(int argc, char **argv, char **env)
{
	ut_init(env);
	while (check_loop())
	{
		g_shell->line = read_line("%> ");
		g_shell->tl = lexer(g_shell->line);
		g_shell->ast = parser(g_shell->tl);
		execute(g_shell->ast);
	}
	ut_cleanup(0, NULL);
}
