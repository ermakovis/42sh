# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcase <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/06 11:31:10 by tcase             #+#    #+#              #
#    Updated: 2019/11/12 20:41:21 by tcase            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=42sh

CC=gcc
FLAGS=-g -lreadline #-Wall -Werror -Wextra

SRC_DIR=	./src
RL_DIR=		./src/read_line
LX_DIR=		./src/lexer
PR_DIR=		./src/parser
EXE_DIR=	./src/execute
BIN_DIR=	./src/builtin
UT_DIR=		./src/utils
LIB_DIR=	./libft
OBJ_DIR=	./obj

SRC_NAME=	main.c
RL_NAME=	read_line.c
LX_NAME=	lexer.c lexer_find_quotes.c lexer_check_operator.c lexer_type_token.c
PR_NAME=	parser.c
BIN_NAME=
EXE_NAME=	execute.c
UT_NAME=	ut_init.c\
			ut_cleanup.c
			
		

RL 	= $(addprefix $(OBJ_DIR)/, $(RL_NAME:.c=.o))
LX 	= $(addprefix $(OBJ_DIR)/, $(LX_NAME:.c=.o))
PR 	= $(addprefix $(OBJ_DIR)/, $(PR_NAME:.c=.o))
EXE = $(addprefix $(OBJ_DIR)/, $(EXE_NAME:.c=.o))
BIN = $(addprefix $(OBJ_DIR)/, $(BIN_NAME:.c=.o))
UT 	= $(addprefix $(OBJ_DIR)/, $(UT_NAME:.c=.o))
SRC = $(addprefix $(OBJ_DIR)/, $(SRC_NAME:.c=.o))
OBJ = $(SRC) $(RL) $(LX) $(PR) $(BIN) $(EXE) $(UT) 
INC = -I ./inc -I $(LIB_DIR)/inc

all: $(NAME)

$(NAME) : $(OBJ)
	@make -s -C $(LIB_DIR)
	@$(CC) -o $(NAME) $(SRC) $(RL) $(LX) $(PR) $(EXE) $(UT) $(BIN)\
		$(LIB_DIR)/libft.a $(INC) -lcurses $(FLAGS)
	@printf "\033[0m\033[35m%-40s\033[1m\033[34m%s\033[0m\n" "Compilation" "Done"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(RL_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(LX_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(PR_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(EXE_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(UT_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

$(OBJ_DIR)/%.o: $(BIN_DIR)/%.c
	@$(CC) -o $@ -c $< $(INC) $(FLAGS)
	@printf "\033[0m\033[36m%-40s\033[1m\033[34m%s\033[0m\n" "$(notdir $<)" "Done"

clean:
	@make clean -s -C $(LIB_DIR)
	@rm -f $(OBJ)
	@printf "\033[0m\033[33m%-40s\033[1m\033[34m%s\033[0m\n" "Clean" "Done"

fclean: clean
	@make fclean -s -C $(LIB_DIR)
	@find . -type f -name ".*.swp" -exec rm -f {} \;
	@rm -rf *test*
	@rm -rf $(NAME)*
	@printf "\033[0m\033[33m%-40s\033[1m\033[34m%s\033[0m\n" "Full Clean" "Done"

re:	fclean all

.PHONY: all, clean, fclean, re
