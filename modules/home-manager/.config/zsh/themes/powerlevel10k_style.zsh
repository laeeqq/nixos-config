# Jonathan-style professional Zsh theme
# Clean, minimal, Git-aware, coder-friendly

autoload -Uz colors && colors
setopt PROMPT_SUBST

# ----------------------------
# Git info
# ----------------------------
git_info() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -z $branch ]] && return

  local status=$(git status --porcelain 2>/dev/null)
  local symbols=""
  [[ $status == *"??"* ]] && symbols+="?"    # untracked
  [[ $status == *"M"* ]] && symbols+="!"    # modified
  [[ $status == *"A"* ]] && symbols+="+"    # staged

  # Ahead/behind info
  local upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  local ahead behind
  if [[ -n $upstream ]]; then
    ahead=$(git rev-list --count HEAD..$upstream 2>/dev/null)
    behind=$(git rev-list --count $upstream..HEAD 2>/dev/null)
  fi

  local ab=""
  [[ $ahead -gt 0 ]] && ab+="↑$ahead"
  [[ $behind -gt 0 ]] && ab+="↓$behind"

  echo "%{$fg[cyan]%} $branch$ab$symbols%{$reset_color%}"
}

# ----------------------------
# Exit code of last command
# ----------------------------
exit_status() {
  local code=$?
  (( code != 0 )) && echo "%{$fg[red]%}✘ $code%{$reset_color%} "
}

# ----------------------------
# Prompt setup
# ----------------------------
PROMPT='$(exit_status)%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%} $(git_info)
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
# Path additions
# ----------------------------
export PATH="$HOME/bin:$PATH"
