SHELL    = bash
DESTDIR  =
PREFIX   = $(DESTDIR)/usr/local

execdir  = $(PREFIX)/bin
datadir  = $(PREFIX)/share
mandir   = $(datadir)/man

PROGRAM  = git-sh
SOURCES  = git-sh.bash git-completion.bash \
           git-sh-aliases.bash git-sh-config.bash

all: $(PROGRAM)

$(PROGRAM): $(SOURCES)
	rm -f -- $@
	cat -- $(SOURCES) > $@+
	bash -n -- $@+
	mv -- $@+ $@
	chmod 0755 -- $@

run: all
	./$(PROGRAM)

install: $(PROGRAM)
	install -d -- "$(execdir)"
	install -m 0755 -- $(PROGRAM) "$(execdir)/$(PROGRAM)"
	install -d -- "$(mandir)/man1"
	install -m 0644 -- git-sh.1.roff "$(mandir)/man1/git-sh.1"

clean:
	rm -f -- $(PROGRAM)

.PHONY: run install clean
