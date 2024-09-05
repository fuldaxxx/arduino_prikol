MCU = atmega328p
F_CPU = 16000000
CC = avr-gcc
CFLAGS = -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU) -Iinclude -Isrc
OBJCOPY = avr-objcopy
AVRDude = avrdude
PORT = /dev/ttyUSB0
BAUD = 115200

TARGET = main
SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:.c=.o)

all: build/$(TARGET).hex

build/$(TARGET).elf: $(OBJECTS) | build
	$(CC) $(CFLAGS) -o $@ $(OBJECTS)

build/$(TARGET).hex: build/$(TARGET).elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@

upload: build/$(TARGET).hex
	$(AVRDude) -c arduino -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<:i

clean:
	rm -f build/*.elf build/*.hex $(OBJECTS)

%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p build
