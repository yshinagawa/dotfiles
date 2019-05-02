#!/bin/bash
set -e

tools=(
        "build-essential"
        "stow"
        "nkf"
        "tmux"
        "shellcheck"
        "silversearcher-ag"
      )

for i in "${tools[@]}"; do
    sudo apt-get -q -y install "$i"
done

# install Homebrew
sudo git clone --depth 1 https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew
sudo chown -R $(whoami):$(whoami) /home/linuxbrew
mkdir /home/linuxbrew/.linuxbrew/bin
ln -s /home/linuxbrew/.linuxbrew/Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin

# install fzf
"$HOME"/.dotfiles/bash/.bash/fzf/install --bin --no-update-rc

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# symlink dotfiles to home directory
source "$HOME/.dotfiles/link.sh"
