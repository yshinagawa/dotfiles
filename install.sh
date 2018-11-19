#!/bin/sh -e
# Download dotfiles repository to home directory

# Run with either command:
# curl -fsSL https://bitbucket.org/yshinagawa/dotfiles/raw/3d5c07dff78ec17c0dfb4662338bbebd53b0cd33/install.sh | sh
# wget -qO-  https://bitbucket.org/yshinagawa/dotfiles/raw/3d5c07dff78ec17c0dfb4662338bbebd53b0cd33/install.sh | sh

if [ -d "$HOME/.dotfiles" ]; then
    printf "\\033[31mError:\\033[0m ~/.dotfiles already exists on your home directory.\\n" >&2
    exit 1
fi

if ![ -x "$(command -v git)" ]; then
    if [ -x "$(command -v curl)" ];then
        curl -fsSL https://bitbucket.org/yshinagawa/dotfiles/get/3d5c07dff78e.zip -o "$HOME/dotfiles.zip"
        mkdir "$HOME/.dotfiles" && tar xzf "$HOME/dotfiles.zip" -C "$HOME/.dotfiles" --strip-components 1
        rm "$HOME/dotfiles.zip"
    elif [ -x "$(command -v wget)" ]; then
        wget -O "$HOME/dotfiles.zip" https://bitbucket.org/yshinagawa/dotfiles/get/3d5c07dff78e.zip
        mkdir "$HOME/.dotfiles" && tar xzf "$HOME/dotfiles.zip" -C "$HOME/.dotfiles" --strip-components 1
        rm "$HOME/dotfiles.zip"
    fi
else
    git clone --recursive https://yshinagawa@bitbucket.org/yshinagawa/dotfiles.git "$HOME/.dotfiles"
fi

if [ -d "$HOME/.dotfiles" ]; then
    printf "\\033[32mDONE:\\033[0m Repository downloaded to ~/.dotfiles\\ncd to ~/dotfiles and run \`make help\` for usage\\n"
else
    printf "\\033[31mError:\\033[0m Repository either not downloaded or not extracted successfully\\n" >&2
    exit 1
fi
