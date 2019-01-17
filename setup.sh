#!/bin/bash
set -e

tools=(
        "make"
        "stow"
        "nkf"
        "tmux"
        "shellcheck"
        "silversearcher-ag"
      )

for i in "${tools[@]}"; do
    sudo apt-get -q -y install "$i"
done

"$HOME"/.dotfiles/.bash/fzf/install --bin --no-update-rc > /dev/null 2>&1
if ! [[ -x "$HOME"/.dotfiles/.bash/fzf/bin/fzf ]]; then
    printf "\\033[31merror!\\033[0m fzf installation failed.\\n" >&2
    exit 1
fi
