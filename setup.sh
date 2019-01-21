#!/bin/bash
set -e

tools=(
        "stow"
        # "nkf"
        # "tmux"
        # "shellcheck"
        # "silversearcher-ag"
      )

for i in "${tools[@]}"; do
    sudo apt-get -q -y install "$i"
done

# install fzf
"$HOME"/.dotfiles/bash/.bash/fzf/install --bin --no-update-rc > /dev/null 2>&1
if ! [[ -x "$HOME"/.dotfiles/bash/.bash/fzf/bin/fzf ]]; then
    printf "\\033[31merror!\\033[0m fzf installation failed.\\n" >&2
    exit 1
fi

# install git-completion
if [ -f /usr/share/bash-completion/completions/git ]; then
    sudo cp /usr/share/bash-completion/completions/git /etc/bash_completion.d/git
fi

# symlink dotfiles to home directory
source "$HOME/.dotfiles/link.sh"
