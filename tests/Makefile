CC ?= gcc
PREFIX ?= /usr/local

tests: test-1.c
	$(CC) -o test-1 test-1.c $(CFLAGS)

install: test-1
	install -D -m755 -t $(DESTDIR)$(PREFIX)/bin test-1

.PHONY: clean

clean:
	rm -f test-1
