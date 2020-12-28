# Build scripts for Homer.

.PHONY: all install uninstall

PREFIX?=$(DESTDIR)/usr/local
DIRS=bin share
INSTALL_DIRS=`find $(DIRS) -type d`
INSTALL_FILES=`find $(DIRS) -type f`

all: install

# Move scripts to /usr/local. Typically requires `sudo` access.
install:
	@for dir in $(INSTALL_DIRS); do mkdir -p $(DESTDIR)$(PREFIX)/$$dir; done
	@for file in $(INSTALL_FILES); do cp $$file $(DESTDIR)$(PREFIX)/$$file; done

# Remove scripts from /usr/local. Typically requires `sudo` access.
uninstall:
	@for file in $(INSTALL_FILES); do echo $$file; done
