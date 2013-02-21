#
# Makefile For libext4_utils
# suggestions please mail to dev.guofeng@gmail.com
#

TARGET = libext4_utils.a

SRCS = make_ext4fs.c \
       ext4fixup.c \
       ext4_utils.c \
       allocate.c \
       contents.c \
       extent.c \
       indirect.c \
       uuid.c \
       sha1.c \
       wipe.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

IDIR = -I..


all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) -rcs "$@" $(OBJS)

%o: %c
	$(CC) $(IDIR) $(CFLAGS) -c "$<" -o "$@"

clean:
	$(RM) $(OBJS) $(TARGET)


.PHONY: clean all

