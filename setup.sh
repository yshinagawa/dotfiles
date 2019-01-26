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

# install git-completion
if [ -f /usr/share/bash-completion/completions/git ]; then
    sudo cp /usr/share/bash-completion/completions/git /etc/bash_completion.d/git
fi

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# symlink dotfiles to home directory
source "$HOME/.dotfiles/link.sh"
