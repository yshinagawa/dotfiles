# dotfiles

Files for Ubuntu development environment setup.

## Environment
* [Bash](https://www.gnu.org/software/bash/) - [fzf](https://github.com/junegunn/fzf) for interactive filter, [liquidprompt](https://github.com/nojhan/liquidprompt) for customize prompt.
* [git](https://git-scm.com/) - Manage plugins as a git-submodule.
* [Stow](https://www.gnu.org/software/stow/) - Create symlinks to home directory.
* [tmux](https://github.com/tmux/tmux) - Essencial terminal multiplexer.
* [Vim](https://www.vim.org/) - [pathogen](https://github.com/tpope/vim-pathogen) for plugin manager, [the silver searcher](https://geoff.greer.fm/ag/) for searching code.

## Installation
#### One-liner
```bash
$ curl -fsSL https://raw.githubusercontent.com/yshinagawa/dotfiles/master/install | bash
```
or
```bash
$ wget -qO- https://raw.githubusercontent.com/yshinagawa/dotfiles/master/install | bash
```
#### Manual
```bash
$ cd ~
$ git clone --recursive --depth 1 https://github.com/yshinagawa/dotfiles.git ".dotfiles"
$ cd .dotfiles && make link
$ .bash/fzf/install --bin --no-update-rc
```
