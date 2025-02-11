# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lposse <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/30 19:41:48 by lposse            #+#    #+#              #
#    Updated: 2025/02/05 18:31:54 by lposse           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror
LIBFT_DIR = Libft
LIBFT_OBJS = Libft/objs/ft_atoi.o Libft/objs/ft_bzero.o Libft/objs/ft_calloc.o Libft/objs/ft_isalnum.o Libft/objs/ft_isascii.o Libft/objs/ft_isalpha.o Libft/objs/ft_isdigit.o Libft/objs/ft_isprint.o Libft/objs/ft_itoa.o Libft/objs/ft_memchr.o Libft/objs/ft_memcmp.o Libft/objs/ft_memcpy.o Libft/objs/ft_memmove.o Libft/objs/ft_memset.o Libft/objs/ft_putchar_fd.o Libft/objs/ft_putendl_fd.o Libft/objs/ft_putnbr_fd.o Libft/objs/ft_putstr_fd.o Libft/objs/ft_split.o Libft/objs/ft_strchr.o Libft/objs/ft_strdup.o Libft/objs/ft_striteri.o Libft/objs/ft_strjoin.o Libft/objs/ft_strlcat.o Libft/objs/ft_strlcpy.o Libft/objs/ft_strlen.o Libft/objs/ft_strmapi.o Libft/objs/ft_strncmp.o Libft/objs/ft_strnstr.o Libft/objs/ft_strrchr.o Libft/objs/ft_strtrim.o Libft/objs/ft_substr.o Libft/objs/ft_tolower.o Libft/objs/ft_toupper.o
SRCS = basic_functions.c ft_printf_general.c ft_printf_functions.c
OBJS = $(SRCS:.c=.o)
NAME = libftprintf.a


all: $(NAME)

$(LIBFT_OBJS):
	@echo "Compilando libft..."
	$(MAKE) -C $(LIBFT_DIR)

$(NAME): Makefile $(LIBFT_OBJS) $(OBJS)
	@echo "Creando libftprintf.a..."
	ar rcs $(NAME) $(OBJS) $(LIBFT_OBJS)

%.o: %.c ft_printf.h
	$(CC) $(CFLAGS) -I. -c $< -o $@

clean:
	$(MAKE) clean -C $(LIBFT_DIR)
	rm -f $(OBJS)

fclean: clean
	$(MAKE) fclean -C $(LIBFT_DIR)
	rm -f $(NAME)

re: fclean all
