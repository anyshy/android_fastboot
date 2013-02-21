#
# Makefile For fastboot
# suggestions please mail to dev.guofeng@gmail.com
#

TARGET = fastboot


SRCS = protocol.c \
       engine.c \
       bootimg.c \
       usb_linux.c \
       util_linux.c \
       fastboot.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

LIBS = -lext4_utils \
       -lsparse \
       -lzipfile \
       -lz

SUBDIR = ext4_utils \
         sparse \
         zipfile

IDIR = -I. \
       -I./ext4_utils \
       -I./zipfile

LDIR = -L./sparse \
       -L./ext4_utils \
	   -L./zipfile

export CC = gcc
export CFLAGS = -Wall -W -O2
export LFLAGS = 
export LIB_PATH_PREFIX = /usr/local/lib
export BIN_PATH_PREFIX = /usr/local/bin
export AR = ar
export RM = rm -f
export STRIP = strip
export INSTALL = install


all: $(TARGET)

$(TARGET): $(OBJS) $(LIBS)
	$(CC) $(LFLAGS) $(LDIR) -o "$@" $(OBJS) $(LIBS)
	@echo ""
	@echo "### Build $@ finish ###"
	@echo ""

$(LIBS):
	@for dir in $(SUBDIR); \
	do \
		make all -C $$dir; \
	done

%.o: %.c
	$(CC) $(IDIR) $(CFLAGS) -c "$<" -o "$@"

strip: $(TARGET)
	$(STRIP) $(TARGET)

install: permission $(TARGET)
	$(INSTALL) -g 0 -o 0 -m 4755 -Ds $(TARGET) $(BIN_PATH_PREFIX)/$(TARGET)
	@echo ""
	@echo "### Install $(TARGET) finish ###"
	@echo ""

uninstall: permission
	$(RM) $(BIN_PATH_PREFIX)/$(TARGET)
	@echo ""
	@echo "### Uninstall $(TARGET) finish ###"
	@echo ""

permission:
	@if [ `id -u` -ne 0 ];	\
	then	\
		echo "***Error: please run with root permission***";	\
		exit 1;	\
	else	\
		exit 0;	\
	fi

clean:
	$(RM) $(OBJS) $(TARGET)
	@for dir in $(SUBDIR); \
	do \
		make clean -C $$dir; \
	done


.PHONY: clean all strip

