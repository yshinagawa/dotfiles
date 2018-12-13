MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BOLD  := \033[1m
RESET := \033[0m
CRLF  := \\n

.PHONY: all install

all: help

install: linux

.PHONY: help usage
.SILENT: help usage

help: usage

usage:
	printf "$(CRLF)\
	Dotfiles - Setup Dev Environment$(CRLF)\
	$(CRLF)\
	$(BOLD)USAGE$(RESET)$(CRLF)\
		make [ target ]$(CRLF)\
	$(CRLF)\
	$(BOLD)TARGET$(RESET)$(CRLF)\
		help		Display this message.$(CRLF)\
		$(CRLF)\
		install		Install all configurations and some necessary Unix tools.$(CRLF)\
		$(CRLF)\
		link		Symlink configurations to the home directory.$(CRLF)\
		$(CRLF)\
		unlink		Remove symlinks created by \`make link\`.$(CRLF)\
	$(CRLF)\
	"

.PHONY: linux link unlink

linux: apt git-init stow

link: stow

unlink: unstow

.PHONY: apt git-init stow unstow

apt:
	bash $(MAKEFILE_DIR)/linux/apt.sh

git-init:
	git submodule init
	git submodule update

stow:
	stow -vv bash
	stow -vv git
	stow -vv ruby
	stow -vv vim

unstow:
	stow -D -vv bash
	stow -D -vv git
	stow -D -vv ruby
	stow -D -vv vim
