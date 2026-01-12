CC ?= gcc
PREFIX ?= /usr/local

tools: tool-1.c
	$(CC) -o tool-1 tool-1.c $(CFLAGS)

install: tool-1
	install -D -m755 -t $(DESTDIR)$(PREFIX)/bin tool-1

.PHONY: clean

clean:
	rm -f tool-1
