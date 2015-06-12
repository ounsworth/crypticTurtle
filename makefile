# ------------------------------------------------
# Generic Makefile
#
# Author: ounsworth@gmail.com
# Date  : 2015-06-12
#
# Changelog :
#   
# ------------------------------------------------


# change these to set the proper directories where each files shoould be
INCDIR	 = include
SRCDIR   = src
LIBDIR	 = lib
OBJDIR   = obj
BINDIR   = bin

CC       = gcc
# compiling flags here
CFLAGS   = -std=c++11 -Wall -I $(INCDIR) 
#-DDEBUG

LINKER   = gcc -o
# linking flags here
LFLAGS   = -I. -lm -lstdc++

SOURCES  := $(wildcard $(SRCDIR)/*.cpp)
LIBS		 := $(wildcard $(LIBDIR)/*.cpp)
INCLUDES := $(wildcard $(INCDIR)/*.h)
OBJECTS  := $(LIBS:$(LIBDIR)/%.cpp=$(OBJDIR)/%.o)
rm       = rm -f

enigma: $(BINDIR)/enigma

$(BINDIR)/enigma: $(OBJECTS) $(SRCDIR)/enigma.cpp $(INCLUDES)
	$(CC) $(CFLAGS) $(SRCDIR)/enigma.cpp -o $@ $(OBJECTS) $(LFLAGS)
	@echo "Linking complete!"

test: $(BINDIR)/test

$(BINDIR)/test: $(OBJECTS) $(SRCDIR)/test.cpp $(INCLUDES)
	$(CC) $(CFLAGS) $(SRCDIR)/test.cpp -o $@ $(OBJECTS) $(LFLAGS)
	@echo "Linking complete!"
	
test_rotors: $(BINDIR)/test_rotors

$(BINDIR)/test_rotors: $(OBJECTS) $(SRCDIR)/test_rotors.cpp $(INCLUDES)
	$(CC) $(CFLAGS) $(SRCDIR)/test_rotors.cpp -o $@ $(OBJECTS) $(LFLAGS)
	@echo "Linking complete!"

#$(BINDIR)/$(TARGET): $(OBJECTS)
#    @$(LINKER) $@ $(LFLAGS) $(OBJECTS)
#    @echo "Linking complete!"

$(OBJECTS): $(OBJDIR)/%.o : $(LIBDIR)/%.cpp
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled "$<" successfully!"

#.PHONEY: clean
clean:
	@$(rm) $(OBJDIR)/*
	@echo "Cleanup complete!"

#.PHONEY: remove
remove: clean
	@$(rm) $(BINDIR)/*
	@echo "Executable removed!"

