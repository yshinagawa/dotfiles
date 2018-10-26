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

for file in "${files[@]}"; do
	[ -r "$file" ] && [ -f "$file" ] && ln -fhsv "$(pwd)/$file" "$HOME";
done;

source "$HOME/.bash_profile";
printf "\ndone!";

unset file;
unset files;
