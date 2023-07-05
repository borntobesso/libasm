NAME = libasm.a

NASM = nasm

SYSTEM = $(shell uname -s)

CC = clang

CFLAGS = -Wall -Wextra -Werror -g3

SRC_DIR = ./src

OBJ_DIR = ./obj

SRCS = $(notdir $(wildcard $(SRC_DIR)/*.s))

OBJS = $(SRCS:.s=.o)

DEPS = $(SRCS:.s=.d)

MAIN = main.c

EXEC = tester

#$(patsubst PATTERN, POST_SUBSTITUTE_PATTERN, VARIABLE)
OBJECTS = $(patsubst %.o,$(OBJ_DIR)/%.o,$(OBJS))

DEPS = $(OBJECTS:.o=.d)

ifeq ($(SYSTEM), Linux)
	NASMFLAGS = -f elf64
else ifeq ($(SYSTEM), Darwin)
	NASMFLAGS = -f macho64
else
	NASMFLAGS = -f elf64
endif

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	@$(NASM) $(NASMFLAGS) $< -o $@
	@echo "Compiled "$<" successfully!"

all: $(NAME)

$(NAME): $(OBJECTS)
	@ar rcs $(NAME) $(OBJECTS)
	@echo "Created "$(NAME)" successfully!"
	
$(EXEC): $(NAME)
	@$(CC) $(CFLAGS) $(MAIN) -L. -lasm -fPIE -o $@
	@echo "Created "$(EXEC)" successfully!"

clean:
	@rm -rf $(OBJ_DIR)
	@echo "Removed "$(OBJ_DIR)" successfully!"

fclean: clean
	@rm -f $(NAME) $(EXEC)
	@echo "Removed "$(NAME), $(EXEC)" successfully!"

re: fclean all

-include $(DEPS)

test: $(EXEC)

.PHONY: all test clean fclean re