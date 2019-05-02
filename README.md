# dotfiles [![Build Status](https://travis-ci.com/yshinagawa/dotfiles.svg?branch=master)](https://travis-ci.com/yshinagawa/dotfiles)

Files for Ubuntu development environment setup.

## Environment
* [Bash](https://www.gnu.org/software/bash/) - [fzf](https://github.com/junegunn/fzf) for interactive filter, [liquidprompt](https://github.com/nojhan/liquidprompt) for customize prompt.
* [git](https://git-scm.com/) - Manage plugins as a git-submodule.
* [Homebrew](https://brew.sh/) - Package manager.
* [Stow](https://www.gnu.org/software/stow/) - Create symlinks to home directory.
* [tmux](https://github.com/tmux/tmux) - Essencial terminal multiplexer.
* [Vim](https://www.vim.org/) - [pathogen](https://github.com/tpope/vim-pathogen) for plugin manager, [the silver searcher](https://geoff.greer.fm/ag/) for searching code.

## Installation
#### One-liner install
```bash
$ curl -fsSL https://raw.githubusercontent.com/yshinagawa/dotfiles/master/install | bash && source ~/.bash_profile
```

#### Manual install
```bash
$ cd ~
$ git clone --recursive --depth 1 https://github.com/yshinagawa/dotfiles.git ".dotfiles"
$ .dotfiles/setup.sh
$ source .bash_profile
```

## Symlinks
#### Cleanup symlinks
```bash
$ cd ~
$ .dotfiles/link.sh --unlink
```

#### Recreate symlinks
```bash
$ cd ~
$ .dotfiles/link.sh
```
