HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
zstyle :compinstall filename '/home/brandon/.zshrc'

autoload -Uz compinit
compinit

# Figure out what type of repo we're in
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '↪'
}

# Prompt
autoload -U colors && colors
NEWLINE=$'\n'
PROMPT="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} ${PWD/#$HOME/~}${NEWLINE}%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} "

# Load my aliases
source .aliases

# Load my functions
source .functions
