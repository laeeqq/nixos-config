# Enable colors
autoload -U colors && colors

# Function to get Git branch
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    echo "%{$fg[cyan]%} $branch%{$reset_color%}"
  fi
}

# Function to show last command exit status
exit_status() {
  local status=$?
  if [ $status -ne 0 ]; then
    echo "%{$fg[red]%}✘ $status%{$reset_color%} "
  fi
}

# Set prompt
setopt PROMPT_SUBST
PROMPT='$(exit_status)%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%} $(git_branch)
%{$fg[magenta]%}❯%{$reset_color%} '

# Enable right prompt (optional: show time)
RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'

# Enable command auto-correction
setopt correct

# Enable auto-completion
autoload -Uz compinit
compinit

# Share history across terminals
setopt share_history
setopt hist_ignore_dups
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gd='git diff'
alias gp='git push'

# Path additions
export PATH="$HOME/bin:$PATH"

# Load functions
fpath=($HOME/.zsh/functions $fpath)