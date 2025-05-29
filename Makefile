CC = cc

CFLAGS = -Wall -Wextra -Werror -Imlx_linux -g

RM = rm -f

NAME = cub3D

SRCS =	cub3d.c \
		main.c

OBJS = $(SRCS:.c=.o)

LIBFT = libft/libft.a

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) -Lmlx_linux -lmlx_Linux -L/usr/lib -lXext -lX11 -lm -lz -o $(NAME) $(LIBFT)

$(LIBFT):
	make -C libft/

%.o: %.c
	$(CC) $(CFLAGS) -I/usr/include -O3 -c $< -o $@

all: $(NAME)

clean:
	$(RM) $(OBJS)
	make clean -C libft/

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT)

re: fclean all

.PHONY: all clean fclean re
