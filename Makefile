BOLD  := \033[1m
RESET := \033[0m
CRLF  := \\n
.DEFAULT_GOAL := help

all: ;

help:
	@printf "$(CRLF)\
	dotfiles - Setup Dev Environment$(CRLF)\
	$(CRLF)\
	$(BOLD)USAGE$(RESET)$(CRLF)\
		make [ target ]$(CRLF)\
	$(CRLF)\
	$(BOLD)TARGET$(RESET)$(CRLF)\
		help		Display this message.$(CRLF)\
		$(CRLF)\
		link		Symlink configurations to the home directory.$(CRLF)\
		$(CRLF)\
		unlink		Remove symlinks created by \`make link\`.$(CRLF)\
	$(CRLF)\
	"

link:
	stow -vv bash
	stow -vv git
	stow -vv ruby
	stow -vv vim

unlink:
	stow -D -vv bash
	stow -D -vv git
	stow -D -vv ruby
	stow -D -vv vim
