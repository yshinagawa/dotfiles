#!/bin/bash

# install basic tools
tools=("make" "stow" "nkf" "tmux")

for i in "${tools[@]}"; do
    if ! (type "$i" > /dev/null 2>&1); then
        sudo apt-get -q -y install "$i"
    fi
done

if [ -f /usr/share/bash-completion/completions/git ]; then
    sudo ln -s /usr/share/bash-completion/completions/git /etc/bash_completion.d/git
fi
# install development tools
sudo apt-get -q -y install shellcheck \
                           silversearcher-ag

[ -e "$HOME/.bashrc" ] && rm "$HOME/.bashrc"

# symlink to home
cd "$HOME/.dotfiles" && make link

# install fzf
"$HOME"/.bash/fzf/install --bin --no-update-rc > /dev/null 2>&1
if ! [[ -x "$HOME"/.bash/fzf/bin/fzf ]]; then
    printf "\\033[31mError:\\033[0m Install fzf failed.\\n" >&2
    exit 1
fi
