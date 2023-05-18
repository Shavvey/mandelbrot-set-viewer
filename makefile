# using gcc to compile project
CC = gcc
# flags to compile project
CLFAGS = -W -Wall -g
# flag for SDL
SDL_CFLAGS := $(shell sdl2-config --cflags)
# use seperate thread to launch SDL window?
SDL_LDFLAGS := $(shell sdl2-config --libs) -lm -pthread
#source for mandelbrot c files
MANDEL = mandelbrot.c mandelbrot.h

all: main mandelbrot.o

# produce mandelbrot object file, do not run linker just yet!
mandelbrot.o: $(MANDEL)
	$(CC) $(CLFAGS) -c mandelbrot.c -lm

# produce main executable
main: $(MANDEL)
	$(CC) $(CFLAGS) $(SDL_CFLAGS) $(ALL) -o mandl $(SDL_LDFLAGS)

# phony tells make that clean is not a target file, just a command
.PHONY : clean
	rm *.o mandl

