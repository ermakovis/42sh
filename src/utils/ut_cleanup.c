#include "shell.h"

void		ut_cleanup(int exit_code, char *format, ...)
{
	char	*ext_format;
	va_list args;


	if (format && (ext_format =\
		ft_powerjoin("%s: %s\n", g_shell->shell_name, format)))
	{
		va_start(args, format);
		vdprintf(STDERR_FILENO, ext_format, args);
		va_end(args);
		ft_strdel(&ext_format);
	}
	ft_strdel(&g_shell->shell_name);
	ft_memdel((void**)&g_shell);
	exit (exit_code);
}
