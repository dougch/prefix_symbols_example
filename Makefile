.PHONY: all
all: link

build:
	cc -c foo.c
	cc -c bar.c
	cc -c foobar.c

prefix: build
	objcopy --prefix-symbols=bar_ bar.o
	objcopy --prefix-symbols=foo_ foo.o

link: prefix
	cc  foobar.o foo.o bar.o -o foobar
	./foobar
	nm foo.o
	nm bar.o

clean:
	@rm -f *.o foobar || true
