# Makefile for RSA ARM Assembly Project

AS=as
CC=gcc
ASFLAGS=-mcpu=cortex-a7
LDFLAGS=-nostartfiles -lc

OBJS=main.o rsa_3.o
TARGET=rsa_program

all: $(TARGET)

$(TARGET): $(OBJS)
        $(CC) $(LDFLAGS) -o $@ $^

main.o: main.s
        $(AS) $(ASFLAGS) -o $@ $<

rsa_3.o: rsa_3.s
        $(AS) $(ASFLAGS) -o $@ $<

clean:
        rm -f $(OBJS) $(TARGET)
