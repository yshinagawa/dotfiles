BOLD  := \033[1m
RESET := \033[0m
CRLF  := \\n

.PHONY: all link help usage git-init stow

all: help

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
		help	Display this message.$(CRLF)\
		$(CRLF)\
		link	Symlink dotfiles to the home directory.$(CRLF)\
	$(CRLF)\
	"

link: git-init stow

git-init:

stow:

