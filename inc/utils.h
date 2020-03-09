#ifndef UTILS_H
# define UTILS_H

typedef struct			s_var
{
	void				*name;
	void				*value;
}						t_var;

typedef struct			s_bin
{
	char				*name;
	int					(*func)(char **arg);
}						t_bin;

int						ut_init(char **env);
void					ut_cleanup(int exit_code, char *format, ...);

#endif
