#
# Makefile For libsparse
# suggestions please mail to dev.guofeng@gmail.com
#

TARGET = libsparse.a

SRCS = backed_block.c \
       output_file.c \
       sparse.c \
       sparse_crc32.c \
       sparse_err.c \
       sparse_read.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

IDIR = -I.


all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) -rcs "$@" $(OBJS)

%o: %c
	$(CC) $(IDIR) $(CFLAGS) -c "$<" -o "$@"

clean:
	$(RM) $(OBJS) $(TARGET)


.PHONY: clean all

