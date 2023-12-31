#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#define RESET "\033[0m"
#define RED "\033[31m"
#define GREEN "\033[32m"
#define BLUE "\033[1m\033[34m"

int main(void)
{
	printf("%sft_strlen() test\n%s", BLUE, RESET);

	printf("ft_strlen(\"Hello\") = %zu\n", ft_strlen("Hello"));
	printf("%sstrlen(\"Hello\") = %zu\n%s", GREEN, strlen("Hello"), RESET);
	printf("ft_strlen(\"\") = %zu\n", ft_strlen(""));
	printf("%sstrlen(\"\") = %zu\n%s", GREEN, strlen(""), RESET);
	// printf("ft_strlen(5) = %zu\n", ft_strlen(5));
	// printf("%sstrlen(5) = %zu\n%s", GREEN, strlen(5), RESET);
	printf("\n");
	printf("%sft_strcpy() test\n%s", BLUE, RESET);

	char dest[20];
	char dest2[20];
	printf("ft_strcpy(dest, \"Hello\") = %s\n", ft_strcpy(dest, "Hello"));
	printf("%sstrcpy(dest, \"Hello\") = %s\n%s", GREEN, strcpy(dest2, "Hello"), RESET);
	printf("ft_strcpy(dest, \"\") = %s\n", ft_strcpy(dest, ""));
	printf("%sstrcpy(dest, \"\") = %s\n%s", GREEN, strcpy(dest2, ""), RESET);
	// printf("ft_strcpy(dest, 5) = %s\n", ft_strcpy(dest, 5));
	// printf("%sstrcpy(dest, 5) = %s\n%s", GREEN, strcpy(dest2, 5), RESET);
	printf("\n");
	printf("%sft_strcmp() test\n%s", BLUE, RESET);

	printf("ft_strcmp(\"Hello\", \"Hello\") = %d\n", ft_strcmp("Hello", "Hello"));
	printf("%sstrcmp(\"Hello\", \"Hello\") = %d\n%s", GREEN, strcmp("Hello", "Hello"), RESET);
	printf("ft_strcmp(\"Hello\", \"Helloo\") = %d\n", ft_strcmp("Hello", "Helloo"));
	printf("%sstrcmp(\"Hello\", \"Helloo\") = %d\n%s", GREEN, strcmp("Hello", "Helloo"), RESET);
	printf("ft_strcmp(\"Hello\", \"Hell\") = %d\n", ft_strcmp("Hello", "Hell"));
	printf("%sstrcmp(\"Hello\", \"Hell\") = %d\n%s", GREEN, strcmp("Hello", "Hell"), RESET);
	printf("ft_strcmp(\"\", \"\") = %d\n", ft_strcmp("", ""));
	printf("%sstrcmp(\"\", \"\") = %d\n%s", GREEN, strcmp("", ""), RESET);
	printf("ft_strcmp(\"\", \"Hello\") = %d\n", ft_strcmp("", "Hello"));
	printf("%sstrcmp(\"\", \"Hello\") = %d\n%s", GREEN, strcmp("", "Hello"), RESET);
	printf("ft_strcmp(\"Hello\", \"\") = %d\n", ft_strcmp("Hello", ""));
	printf("%sstrcmp(\"Hello\", \"\") = %d\n%s", GREEN, strcmp("Hello", ""), RESET);
	// printf("ft_strcmp(5, 5) = %d\n", ft_strcmp(5, 5));
	// printf("%sstrcmp(5, 5) = %d\n%s", GREEN, strcmp(5, 5), RESET);

	printf("\n");
	printf("%sft_write() test", BLUE);
	printf("%s\n", RESET);

	printf("ft_write(1, \"Hello\\n\", 6) = %zd", ft_write(1, "Hello\n", 6));
	printf("%s\n", GREEN);
	printf("write(1, \"Hello\\n\", 6) = %zd", write(1, "Hello\n", 6));
	printf("%s\n", RESET);
	printf("ft_write(1, \"Hello\\n\", 0) = %zd", ft_write(1, "Hello\n", 0));
	printf("%s\n", GREEN);
	printf("write(1, \"Hello\\n\", 0) = %zd", write(1, "Hello\n", 0));
	printf("%s\n", RESET);
	// printf("ft_write(1, \"Hello\\n\", -1) = %zd\n", ft_write(1, "Hello\n", -1));
	// if (errno != 0)
	// 	printf("errno for ft_write(): %s\n", strerror(errno));
	// printf("%swrite(1, \"Hello\\n\", -1) = %zd\n%s", GREEN, write(1, "Hello\n", -1), RESET);
	// if (errno != 0)
	// 	printf("%serrno for write(): %s\n%s", GREEN, strerror(errno), RESET);
	printf("ft_write(1, \"Hello\\n\", 6) = %zd", ft_write(1, "Hello\n", 6));
	printf("%s\n", GREEN);
	printf("write(1, \"Hello\\n\", 6) = %zd", write(1, "Hello\n", 6));
	printf("%s\n", RESET);
	printf("ft_write(-1, \"Hello\\n\", 6) = %zd\n", ft_write(-1, "Hello\n", 6));
	if (errno != 0)
		printf("errno for ft_write(): %s", strerror(errno));
	printf("%s\n", GREEN);
	printf("write(-1, \"Hello\\n\", 6) = %zd\n", write(-1, "Hello\n", 6));
	if (errno != 0)
		printf("errno for write(): %s", strerror(errno));
	printf("%s\n", RESET);
	printf("%sft_read() test%s\n", BLUE, RESET);

	char buf[100];
	bzero(buf, 100);
	printf("ft_read(0, buf, 99) = %zd\n", ft_read(0, buf, 99));
	printf("text ft_read(): %s\n", buf);
	printf("%sread(0, buf, 99) = %zd\n", GREEN, read(0, buf, 99));
	printf("text read(): %s\n", buf);
	int fd = open("./Makefile", O_RDONLY);
	int fd2 = open("./Makefile", O_RDONLY);
	printf("%s\n", RESET);
	int result = ft_read(fd, buf, 99);
	printf("ft_read(fd, buf, 99) = %d\n", result);
	printf("text ft_read(): %s\n", buf);
	printf("\n");
	result = read(fd2, buf, 99);
	printf("%sread(fd, buf, 99) = %d\n%s", GREEN, result, RESET);
	printf("%stext read(): %s\n%s", GREEN, buf, RESET);
	printf("\n");
	result = ft_read(-1, buf, 0);
	printf("ft_read(-1, buf, 0) = %d\n", result);
	if (errno != 0)
		printf("errno for ft_read(): %s\n", strerror(errno));
	result = read(-1, buf, 0);
	printf("%sread(-1, buf, 0) = %d\n%s", GREEN, result, RESET);
	if (errno != 0)
		printf("%serrno for read(): %s\n%s", GREEN, strerror(errno), RESET);

	printf("\n");
	printf("%sft_strdup() test\n%s", BLUE, RESET);
	char *res;
	res = ft_strdup("Hello");
	printf("ft_strdup(\"Hello\") = %s\n", res);
	free(res);
	res = strdup("Hello");
	printf("%sstrdup(\"Hello\") = %s\n%s", GREEN, res, RESET);
	free(res);
	res = ft_strdup("");
	printf("ft_strdup(\"\") = %s\n", res);
	free(res);
	res = strdup("");
	printf("%sstrdup(\"\") = %s\n%s", GREEN, res, RESET);
	free(res);
	// printf("ft_strdup(5) = %s\n", ft_strdup(5));
	// printf("%sstrdup(5) = %s\n%s", GREEN, strdup(5), RESET);
	printf("\n");
	close(fd);
	close(fd2);
}