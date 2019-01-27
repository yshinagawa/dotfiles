#!/bin/bash
set -e

tools=(
        "stow"
        "nkf"
        "tmux"
        "shellcheck"
        "silversearcher-ag"
      )

for i in "${tools[@]}"; do
    sudo apt-get -q -y install "$i"
done

# install fzf
"$HOME"/.dotfiles/bash/.bash/fzf/install --bin --no-update-rc

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# symlink dotfiles to home directory
source "$HOME/.dotfiles/link.sh"
