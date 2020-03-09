#ifndef PARSER_H
# define PARSER_H

typedef struct		s_ast
{
	int				node_type;
	t_token			*token;
	struct s_ast	*left;
	struct s_ast	*right;
}					t_ast;

t_ast				*parser(t_list *tokens);

#endif
