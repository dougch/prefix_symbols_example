.PHONY: all
all: link


CC_OPTS="--static"
build:
	cc -c ${CC_OPTS} foo.c
	cc -c ${CC_OPTS} bar.c
	cc -c ${CC_OPTS} foobar.c

prefix: build
	objcopy --prefix-symbols=bar_ bar.o
	objcopy --prefix-symbols=foo_ foo.o

link: prefix
	cc ${CC_OPTS} foobar.o foo.o bar.o -o foobar
	./foobar
	nm foo.o
	nm bar.o

clean:
	@rm -f *.o foobar || true
