# ~/.zsh/prompt.zsh or ~/.config/zsh/themes/powerlevel10k_style.zsh
# Fully functional Powerlevel10k-style Zsh theme (Starship-free)

autoload -Uz colors && colors
setopt PROMPT_SUBST

# ----------------------------
# Git info with symbols
# ----------------------------
git_info() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    local git_status
    git_status=$(git status --porcelain 2>/dev/null)
    local symbols=""
    [[ $git_status == *"??"* ]] && symbols+="?"       # untracked
    [[ $git_status == *"M"* ]] && symbols+="!"       # modified
    [[ $git_status == *"A"* ]] && symbols+="+"       # staged
    [[ $git_status == *"D"* ]] && symbols+="✗"       # deleted
    [[ $git_status == *"R"* ]] && symbols+="→"       # renamed
    [[ $git_status == *"U"* ]] && symbols+="⚡"       # unmerged
    echo "%{$fg[cyan]%} $branch$symbols%{$reset_color%}"
  fi
}

# ----------------------------
# Exit code of last command
# ----------------------------
exit_status() {
  local last_status=$?
  (( last_status != 0 )) && echo "%{$fg[red]%}✘ $last_status%{$reset_color%} "
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

# Enable completion
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

# ----------------------------
# Functions path
# ----------------------------
fpath=($HOME/.zsh/functions $fpath)
