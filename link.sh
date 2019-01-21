#!/bin/bash
set -e

unlink=

echo "---------------------"
echo "arguments in link.sh:"
echo "$@"
echo "---------------------"
for opt in "$@"; do
    case $opt in
        --unlink )
            unlink=1
            ;;
        *)
            printf "\\033[31mError:\\033[0m Unknown option: %s\\n" "$opt" >&2
            exit 1
            ;;
    esac
done

# managing dotfiles list
baks=(
    # bash
    ".bash_profile"
    ".bashrc"
    ".inputrc"
    ".liquidpromptrc"
    ".tmux.conf"
    # git
    ".gitconfig"
    ".global_ignore"
    # ruby
    ".gemrc"
    ".irbrc"
    ".pryrc"
    # vim
    ".vimrc"
    )

if [[ $unlink -eq 1 ]]; then
    stow -D -vv "$HOME"/.dotfiles/bash
    stow -D -vv "$HOME"/.dotfiles/git
    stow -D -vv "$HOME"/.dotfiles/ruby
    stow -D -vv "$HOME"/.dotfiles/vim
    for i in "${baks[@]}"; do
        if [ -f "$HOME"/"$i".bak ]; then
            printf "Restore: %s.bak -> %s" "$i" "$i"
            mv "$HOME"/"$i".bak "$HOME"/"$i"
        fi
    done
else
    for i in "${baks[@]}"; do
        if [ -f "$HOME"/"$i" ]; then
            printf "Backup: %s -> %s.bak" "$i" "$i"
            mv "$HOME"/"$i" "$HOME"/"$i".bak
        fi
    done 
    stow -vv "$HOME"/.dotfiles/bash
    stow -vv "$HOME"/.dotfiles/git
    stow -vv "$HOME"/.dotfiles/ruby
    stow -vv "$HOME"/.dotfiles/vim
fi
