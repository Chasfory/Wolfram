
##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile
##

SRC =	verifArguments.hs\
		rules.hs\
		main.hs\

NAME	=	Wolfram

RM	=	rm -f

all:		$(NAME)

$(NAME):
	@ghc -Wall $(SRC) -o $(NAME)

clean:
		$(RM) $(SRC:.hs=.hi)
		$(RM) $(SRC:.hs=.o)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY: $(NAME) all clean fclean re