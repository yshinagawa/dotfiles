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
  print -Pn "\033]0;${prompt_title}\007"
    # prompt turns red if the previous command didn't exit with 0
  PROMPT="%(?.%F{white}.%F{red})$%f "
    # check async if there is anything to pull
    (( ${GIT_PULL:-1} )) && {
        # check if we're in a git repo
        command git rev-parse --is-inside-work-tree &>/dev/null &&
        # check if there is anything to pull
        command git fetch &>/dev/null &&
        # check if there is an upstream configured for this branch
        command git rev-parse --abbrev-ref @'{u}' &>/dev/null &&
        (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) &&
        # some crazy ansi magic to inject the symbol into the previous line
    #PROMPT="\e7\e[A\e[1G\e[`prompt_string_length $prompt_preprompt`C%F{cyan}⇣%f\e8%(?.%F{white}.%F{red})>%f "
        print -Pn "\033]0;$prompt_title⇣\007"
    } &!
}

prompt_minimum_setup() {
    prompt_opts=(cr subst percent)

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats ' at %b'
    zstyle ':vcs_info:git*' actionformats ' at %b|%a'

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_username='%n@%m'
}

prompt_minimum_setup "$@"
