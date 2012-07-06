[ -z "$PS1" ] && return

# Better bash history
HISTCONTROL=ignoredups:ignorespace 
shopt -s histappend 
HISTSIZE=1000 
HISTFILESIZE=2000
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set the window title to show the user@host and the current working directory (Don't expand $HOME)
XTERM_TITLE='\[\e]0;\u@\H \t $(pwd)\a\]'

# Resets any color prompt
COLOR_RESET='\[\e[0m\]'
COLOR_GREEN='\[\e[1;32m\]'
COLOR_RED='\[\e[1;31m\]'

# Pretty command prompt
export PS1="${XTERM_TITLE}[\u@\h] ${COLOR_GREEN}>${COLOR_RESET} "

# Useful aliases
alias ll='ls -lhAs --color=never'
alias la='ls -A'
alias lo='ls -o'
alias lh='ls -lh'
alias sl='ls'
alias l='ls -CF'
alias s='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Useful extract feature so you don't have to remember the arguments to extract
# all of the various archive formats
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Nicer man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Computer specific bashrc config
if [ -f /etc/bashrc.custom ]; then
        . /etc/bashrc.custom
fi

export PATH
