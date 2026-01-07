# -------------------------
# Simple clean Zsh prompt
# -------------------------

autoload -U colors && colors

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %F{cyan}%b%f'
zstyle ':vcs_info:*' enable git

setopt prompt_subst

PROMPT='%F{green}%n@%m%f  %F{blue}%~%f${vcs_info_msg_0_}
%F{yellow}❯%f '
