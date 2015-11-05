# simple makefile for preload-geettaddrinfo project
# v0.4

all : testaddrinfo getaddrinfo

.PHONY : testaddrinfo getaddrinfo

clean:
	rm -f testaddrinfo getaddrinfo.so

testaddrinfo:
	gcc -g -o testaddrinfo testaddrinfo.c

getaddrinfo:
	gcc -g -Wl,--no-as-needed -rdynamic -Wall -fPIC -shared -ldl -o getaddrinfo.so -I../map/src getaddrinfo.c ../map/src/map.c

test: getaddrinfo.so testaddrinfo
	LD_PRELOAD=./getaddrinfo.so ./testaddrinfo delfi.lt
	LD_PRELOAD=./getaddrinfo.so ./testaddrinfo delfi.lv
	LD_PRELOAD=./getaddrinfo.so ./testaddrinfo delfi.i2p
	LD_PRELOAD=./getaddrinfo.so ./testaddrinfo asdf.onion

