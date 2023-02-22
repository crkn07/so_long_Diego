# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: drubio-m <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/25 20:18:27 by drubio-m          #+#    #+#              #
#    Updated: 2023/02/22 17:27:28 by drubio-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = lolo.c
SRC_DIR = ./src
BONUS =
OBJS = $(SRC:.c=.o)
BONUS_OBJS = $(BONUS:.c=.o)
C = gcc
FLAGS = -Wall -Wextra -Werror
NAME = so_long
RM = rm -rf
FLAGS = -Wall -Wextra -Werror

#INCLUDE = -lmlx -framework OpenGL -framework AppKit

LIBFT_DIR = ./libft/
LIBFT_A = libft.a
LIBFT = -L$(LIBFT_DIR) $(LIBFT_DIR)$(LIBFT_A)


#GNL_FT = get_next_line.c get_next_line_utils.c
#GNL = $(addprefix get_next_line/, $(GNL_FT))

#ifeq ($(UNAME),Darwin)
	MLX_PATH = minilibx_opengl/
	MINILIBX:= -L $(MLX_PATH) $(MLX_PATH)libmlx.a -lmlx -framework OpenGL -framework AppKit
#else
#	MLX_PATH = minilibx_linux/
#	MINILIBX:= -L $(MLX_PATH) $(MLX_PATH)libmlx.a -lmlx -lXext -lX11
#endif

GREEN='\033[32m'
GRAY='\033[2;37m'
NONE='\033[0m'

all: $(NAME)
	@echo " \033[36m[ OK ] | READY TO PLAY!\033[0m"

.SILENT: $(OBJS)
$(NAME): $(OBJS)
	@echo " \033[33m[ .. ] | Compiling minilibx..\033[0m"
	@make -C $(MLX_PATH)
	@echo $(CURSIVE)$(GREEN) " - Making libft..." $(NONE)
	@sleep 3
	@make bonus -C $(LIBFT_DIR)
	@echo $(CURSIVE)$(GREEN) " - Compiling $(NAME)" $(NONE)
	@gcc $(FLAGS) $(OBJS) $(MINILIBX) $(LIBFT) -o $(NAME)
	@sleep 3
	@echo $(CURSIVE)$(GREEN) " - Compiled" $(NONE)


B = .

bonus: $(B)

$(B): $(OBJ) $(BONUS_OBJS)
	$(C) $(FLAGS) $(SRC)
	ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
clean:
	$(RM) $(OBJS) $(BONUS_OBJS) $(LIBFT_A)
fclean: clean
	@echo $(CURSIVE)$(GREEN) " - Removing $(NAME)..." $(NONE)
	@sleep 1
	@$(RM) $(NAME) $(BONUS_OBJS) $(OBJS)
	@make -C $(LIBFT_DIR) fclean
	@echo $(CURSIVE)$(GREEN) " - Clean!" $(NONE)
re: fclean
	@sleep 2
	@echo $(CURSIVE)$(GREEN) " - Compiling again..." $(NONE)
	@sleep 3
	@make all


.PHONY: all fclean clean re
