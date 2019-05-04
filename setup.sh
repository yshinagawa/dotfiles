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

# install node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -q -y nodejs
# change npm's default directory (https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
mkdir "$HOME"/.npm-global
npm config set prefix "$HOME/.npm-global"

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -q -y yarn

# install fzf
"$HOME"/.dotfiles/bash/.bash/fzf/install --bin --no-update-rc

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# symlink dotfiles to home directory
source "$HOME/.dotfiles/link.sh"
