#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

files=('.aliases' \
		'.bash_profile' \
		'.bash_prompt' \
		'.bashrc' \
		'.exports' \
		'.functions' \
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
