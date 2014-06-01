# -*- mode: sh; -*-
# Minimum
# modified from "Pure" by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

prompt_git_dirty() {
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    command git diff --quiet --ignore-submodules HEAD &>/dev/null
    (($? == 1)) && echo '*'
}

prompt_precmd() {
  vcs_info
  local prompt_title='%~$vcs_info_msg_0_`prompt_git_dirty`$prompt_username'
  # prompt turns red if the previous command didn't exit with 0
  PROMPT="%(?.%F{15}.%F{1})[${prompt_title}]$%f "
}

prompt_minimum_setup() {
    prompt_opts=(cr subst percent)

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats ':%b'
    zstyle ':vcs_info:git*' actionformats ':%b|%a'

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_username='%n@%m'
}

prompt_minimum_setup "$@"
