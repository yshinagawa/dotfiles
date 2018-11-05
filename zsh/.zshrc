############################################################
# environment
############################################################

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
case ${UID} in
0)
  LANG=C
  ;;
esac
export RSYNC_RSH=ssh
export VISUAL=vi
umask 002
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>''})]'

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
# alias
############################################################

# expand aliases before completing
setopt complete_aliases
alias where="command -v"
case "${OSTYPE}" in
  freebsd*|darwin*)
        alias ls="gls -F --color"
        ;;
  linux*)
        alias ls="ls -F --color"
        ;;
esac

alias b="afplay ~/Dropbox/Repos/dotfiles/Temple.aiff"
alias be='bundle exec'
alias ber='bundle exec rails'
alias cp="cp -i"
alias df="df -h"
alias du="du -h"
alias e="emacsclient -t"
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gdiff='git diff'
alias gl='git lg'
alias gp='git push'
alias gs='git st'
alias hb='brew'
alias la="ls -Ah"
alias ll="ls -slhA"
alias mv="mv -i -v"
alias rm="rm -i"
alias sleep="gsleep"
alias su="su -l"
alias v="vagrant"
alias vh="v halt"
alias vu="v up"
alias vs="v status"
alias vg="v global-status"
alias vp="v provision"
alias vi="vim -u NONE --noplugin"
alias vr="vim -R"

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
fpath=(/usr/local/share/zsh/site-functions ${fpath})
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
# plugins
############################################################

fpath=(${HOME}/.zsh/plugins ${fpath})

############################################################
# others
############################################################

# less-source-highlight
# export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# z
#[[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh

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
#source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
