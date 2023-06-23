NAME = libasm.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SRC_DIR = ./src

OBJ_DIR = ./obj

SRCS = $(notdir $(wildcard $(SRC_DIR)/*.s))

OBJS = $(SRCS:.s=.o)

DEPS = $(SRCS:.s=.d)

#$(patsubst PATTERN, POST_SUBSTITUTE_PATTERN, VARIABLE)
OBJECTS = $(patsubst %.o,$(OBJ_DIR)/%.o,$(OBJS))

DEPS = $(OBJECTS:.o=.d)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@ -MD
	@echo "Compiled "$<" successfully!"

all: $(NAME)

$(NAME): $(OBJECTS)
	@ar rcs $(NAME) $(OBJECTS)
	@echo "Created "$(NAME)" successfully!"

clean:
	@rm -rf $(OBJ_DIR)
	@echo "Removed "$(OBJ_DIR)" successfully!"

fclean: clean
	@rm -f $(NAME)
	@echo "Removed "$(NAME)" successfully!"

re: fclean all

-include $(DEPS)

.PHONY: all clean fclean re