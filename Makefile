SHELL := /bin/bash

PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
DATADIR := $(PREFIX)/share/ec
COREDIR := $(DATADIR)/coreasm

BIN := ec
RELEASE_PATH := target/release
RELEASE_BIN := $(RELEASE_PATH)/$(BIN)

.PHONY: all build install uninstall clean

all: build

build: $(RELEASE_BIN)

$(RELEASE_BIN): src Cargo.toml
	cargo build --release

install:
	install -d "$(BINDIR)"
	install -m 0755 "$(RELEASE_BIN)" "$(BINDIR)/$(BIN)"
	install -d "$(DATADIR)"
	rm -rf "$(COREDIR)"
	cp -r coreasm "$(COREDIR)"

uninstall:
	rm -f "$(BINDIR)/$(BIN)"
	rm -rf "$(DATADIR)"

clean:
	cargo clean
