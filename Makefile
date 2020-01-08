SHELL = bash
CC = gcc
CFLAGS = -ansi -pedantic -g -O3 -Wall -DNDEBUG 
CXX = g++
CXXFLAGS = 
CPP = cpp
LD = ld
LDFLAGS = -L


.PHONY
clean:
	rm *.o
