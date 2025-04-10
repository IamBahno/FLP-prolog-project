# Output binary name
TARGET = flp24-log

# Source files
SOURCES = main.pl input2.pl

# Entry point
ENTRY = main

# SWI-Prolog compiler
PLCON = swipl

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(PLCON) -o $(TARGET) -g $(ENTRY) -c $(SOURCES)

clean:
	rm -f $(TARGET)
