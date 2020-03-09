#ifndef LEXER_H
# define LEXER_H

typedef struct			s_token
{
	int					token_type;
	char				*content;
}						t_token;
	
t_list					*lexer(char *line);

#endif
