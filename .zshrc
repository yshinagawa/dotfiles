############################################################
# environment
############################################################

export LANG=ja_JP.UTF-8
case ${UID} in
0)
  LANG=C
  ;;
esac
export VISUAL=vi
export RSYNC_RSH=ssh
umask 002
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>''})]'

# boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2375

############################################################
# options
############################################################

# ignore ^d logout
setopt IGNOREEOF
# auto change directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# command correct edition before each completion attempt
setopt correct
# compacked complete list display
setopt list_packed
# no remove postfix slash of command line
setopt noautoremoveslash
# no beep sound when complete list displayed
setopt nolistbeep

setopt auto_resume
setopt equals
setopt mark_dirs
setopt list_rows_first
setopt auto_param_slash
setopt list_types

############################################################
# keybind
############################################################

# emacs like keybind
bindkey -e
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

############################################################
# history
############################################################

HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt hist_ignore_space
setopt share_history        # share command history data
setopt extended_history
function history-all { history -E 1 }

############################################################
# completion
############################################################

fpath=(${HOME}/.zsh/functions/Completion ${fpath})
fpath=(/usr/local/share/zsh-completions ${fpath})
fpath=(/usr/local/etc/bash_completion.d ${fpath})
autoload -U compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
zstyle ':completion:*' use-cache true
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey '^xp' predict-on
bindkey '^x^p' predict-off

############################################################
# editor
############################################################

autoload zed

############################################################
# alias
############################################################

# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work
alias where="command -v"

case "${OSTYPE}" in
  freebsd*|darwin*)
        alias ls="gls --color"
        ;;
  linux*)
        alias ls="ls --color"
        ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias vr="vim -R"
alias vi="vim -u NONE --noplugin"
alias beep="afplay ~/.repos/dotfiles/Temple.aiff"
alias b="beep"
alias v="vagrant"
alias rm="rmtrash"
alias sleep="gsleep"

############################################################
# plugins
############################################################

fpath=(${HOME}/.zsh/plugins ${fpath})

############################################################
# others
############################################################

# less-source-highlight
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# z
[[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh

# prompt
#[ -f ${HOME}/.zsh/themes/my.zsh-theme ] && source ${HOME}/.zsh/themes/my.zsh-theme

############################################################
# prompt
############################################################

autoload colors && colors
setopt prompt_subst
autoload -Uz add-zsh-hook
function set-random-color-prompt() {
  local randomcolor="%{$fg[$color[$(($RANDOM%6+31))]]%}"
  local resetcolor="%{$reset_color%}"
  case ${UID} in
  0)
    PROMPT="${randomcolor}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%~#${resetcolor}%b "
    PROMPT2="%B${randomcolor}%_#${resetcolor}%b "
    SPROMPT="%B${randomcolor}%r is correct? [n,y,a,e]:${resetcolor}%b "
    ;;
  *)
    PROMPT="${randomcolor}%~%%${resetcolor} "
    PROMPT2="${randomcolor}%_%%${resetcolor} "
    SPROMPT="${randomcolor}%r is correct? [n,y,a,e]:${resetcolor} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
  esac
}

# set prompt theme
autoload -U promptinit && promptinit
prompt minimum
# include zsh-syntax-highligting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#add-zsh-hook precmd set-random-color-prompt

# lscolor
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
  xterm|xterm-color|xterm-256color)
      export LSCOLORS=exfxcxdxbxegedabagacad
      export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
      zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
      ;;
  kterm-color)
      stty erase '^H'
      export LSCOLORS=exfxcxdxbxegedabagacad
      export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
      zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
      ;;
  kterm)
      stty erase '^H'
      ;;
  cons25)
      unset LANG
      export LSCOLORS=ExFxCxdxBxegedabagacad
      export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
      zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
      ;;
  jfbterm-color)
      export LSCOLORS=gxFxCxdxBxegedabagacad
      export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
      zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
      ;;
esac
