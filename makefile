LIBS = gtk+-3.0
HEADERS = -Iclasses/headers/
CPP = classes/cpp/*
CC = g++
VERSION = c++17
DFLAGS = -g

run: compiled/release/main
	./$<

compiled/release/main: main.cpp
	$(CC) -std=$(VERSION) -o $@ $< `pkg-config --cflags --libs $(LIBS)`

debug: compiled/debug/main
	gdb $<

compiled/debug/main: main.cpp
	$(CC) $(DFLAGS) -std=$(VERSION) -o $@ $< `pkg-config --cflags -libs $(LIBS)`