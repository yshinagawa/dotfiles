#!/bin/bash
set -e

unlink=

for opt in "$@"; do
    case $opt in
        --unlink )
            unlink=1
            shift
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

stow_dir="$HOME/.dotfiles"

if [[ $unlink -eq 1 ]]; then
    stow -d "$stow_dir" -D -vv bash
    stow -d "$stow_dir" -D -vv git
    stow -d "$stow_dir" -D -vv ruby
    stow -d "$stow_dir" -D -vv vim

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

    stow -d "$stow_dir" -vv bash
    stow -d "$stow_dir" -vv git
    stow -d "$stow_dir" -vv ruby
    stow -d "$stow_dir" -vv vim
fi
