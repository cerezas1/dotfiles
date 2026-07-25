CC     = gcc
CFLAGS = -Wall -Wextra -O2
TARGET = ../../scripts/calender

.PHONY: all clean

all: $(TARGET)

$(TARGET): calender.c
	$(CC) $(CFLAGS) -o $(TARGET) calender.c

clean:
	rm -f $(TARGET)
