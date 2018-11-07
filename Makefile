DOTFILES_DIR := $(shell echo $(HOME)/.dotfiles)
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
		install		Install some necessary Unix tools for Ubuntu.$(CRLF)\
		$(CRLF)\
		link		Symlink dotfiles to the home directory.$(CRLF)\
	$(CRLF)\
	"

.PHONY: linux link

linux: apt git-init stow

link: stow

.PHONY: apt git-init stow

apt:
	bash $(DOTFILES_DIR)/linux/apt.sh

git-init:
	git submodule init
	git submodule update

stow:
	stow bash
	stow git
	stow ruby
	stow vim
