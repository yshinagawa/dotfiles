#!/usr/bin/env bash
set -eu

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

files=('.bash_profile' \
		'.bash_prompt' \
		'.bashrc' \
		'.gemrc' \
		'.gitconfig' \
		'.global_ignore' \
		'.inputrc' \
		'.irbrc' \
		'.pryrc' \
		'.vimrc');

ln -fs ${files[@]} ~/;
printf "Symlink these files to ${HOME}\n";
printf '  %s\n' "${files[@]}";

source ~/.bash_profile;
printf "\ndone!"

unset files;
