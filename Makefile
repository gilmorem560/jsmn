# jsmn - Makefile
#
# install/uninstall at your own risk in $(PREFIX)
PREFIX		=	/usr

AR			= 	ar rcs
CC			=	cc
CFLAGS		=	-O2 -c -fPIC
CP			=	cp
LDFLAGS		=	-shared
RM			=	rm -rf

STATIC_LIB	=	libjsmn.a
DYNAMIC_LIB	=	libjsmn.so

JSMN		=	jsmn.o

all: $(STATIC_LIB) $(DYNAMIC_LIB)

install: all
	cp $(STATIC_LIB) $(DYNAMIC_LIB) $(PREFIX)/lib
	cp jsmn.h $(PREFIX)/include

uninstall:
	$(RM) $(PREFIX)/lib/$(STATIC_LIB)
	$(RM) $(PREFIX)/lib/$(DYNAMIC_LIB)
	$(RM) $(PREFIX)/include/jsmn.h

$(STATIC_LIB): $(JSMN)
	$(AR) $@ $<

$(DYNAMIC_LIB): $(JSMN)
	$(CC) $(LDFLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(STATIC_LIB) $(DYNAMIC_LIB) $(JSMN)
