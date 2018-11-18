MAN = man
SRC = src

MANDIR ?= /usr/share/man/man1
PREFIX ?= /usr/local/opt

COMMON = human
MANUAL = $(MAN)/$(COMMON).1.gz
SCRIPT = $(SRC)/$(COMMON).sh

COMDIR = $(PREFIX)/$(COMMON)
SRCDIR = $(COMDIR)/$(SRC)
TARGET = $(COMDIR)/$(SCRIPT)

MANPAGE = $(MANDIR)/$(COMMON).1.gz

.PHONY: all src man

all: src

src: $(SCRIPT)
	@mkdir -p $(SRCDIR)
	@cp -fpv $^ $(TARGET)

man: $(MANUAL)
	@cp -fpv $^ $(MANPAGE)
