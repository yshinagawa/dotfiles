# Setup Homebrew
if [ -h /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Setup node
if [ -d "$HOME/.npm-global" ]; then
    export PATH="$HOME"/.npm-global/bin:"$PATH"
fi

# Setup liquidprompt
[[ $- = *i* ]] && [ -f ~/.bash/liquidprompt/liquidprompt ] && source ~/.bash/liquidprompt/liquidprompt

# Setup rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setup pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Setup fzf
if [[ ! "$PATH" == *$HOME/.bash/fzf/bin* ]]; then
    export PATH="$PATH:$HOME/.bash/fzf/bin"
fi
[[ $- == *i* ]] && source ~/.bash/fzf/shell/completion.bash 2> /dev/null
[ -f ~/.bash/fzf/shell/key-bindings.bash ] && source ~/.bash/fzf/shell/key-bindings.bash

# Load expansion files 
for file in ~/.bash/*; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Sharing history on multiplexer
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable tab completion for `g` by making it as an alias for `git`
if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
fi

if type _git &> /dev/null; then
    complete -o default -o nospace -F _git g;
fi;
