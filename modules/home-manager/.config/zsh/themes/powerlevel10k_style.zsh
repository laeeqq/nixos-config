# ~/.zsh/powerlevel10k_style.zsh
autoload -Uz colors && colors
setopt PROMPT_SUBST

# ----------------------------
# Git info
# ----------------------------
git_status() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    local status
    status=$(git status --porcelain 2>/dev/null)
    local symbols=""
    [[ $status == *"??"* ]] && symbols+="?"       # untracked
    [[ $status == *"M"* ]] && symbols+="!"       # modified
    [[ $status == *"A"* ]] && symbols+="+"       # staged
    echo "%{$fg[cyan]%} $branch$symbols%{$reset_color%}"
  fi
}

# ----------------------------
# Exit code of last command
# ----------------------------
exit_status() {
  local code=$?
  (( code != 0 )) && echo "%{$fg[red]%}✘ $code%{$reset_color%} "
}

# ----------------------------
# Prompt
# ----------------------------
PROMPT='$(exit_status)%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%} $(git_status)
%{$fg[magenta]%}❯%{$reset_color%} '

# Right prompt: time
RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'

# ----------------------------
# Zsh options
# ----------------------------
setopt correct
setopt share_history
setopt hist_ignore_dups
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

autoload -Uz compinit && compinit

# ----------------------------
# Aliases
# ----------------------------
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gd='git diff'
alias gp='git push'

# ----------------------------
# PATH additions
# ----------------------------
export PATH="$HOME/bin:$PATH"
