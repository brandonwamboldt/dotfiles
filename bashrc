# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace 

# Append to the history file, don't overwrite it
shopt -s histappend 

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000 
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#------------------------------------------////
# Colors:
#------------------------------------------////


COLOR_RESET='\[\e[0m\]'
COLOR_BLACK='\e[0;30m'
COLOR_BLUE='\e[0;34m'
COLOR_GREEN='\e[0;32m'
COLOR_CYAN='\e[0;36m'
COLOR_RED='\e[0;31m'
COLOR_PURPLE='\e[0;35m'
COLOR_BROWN='\e[0;33m'
COLOR_LIGHTGRAY='\e[0;37m'
COLOR_DARKGRAY='\e[1;30m'
COLOR_LIGHTBLUE='\e[1;34m'
COLOR_LIGHTGREEN='\e[1;32m'
COLOR_LIGHTCYAN='\e[1;36m'
COLOR_LIGHTRED='\e[1;31m'
COLOR_LIGHTPURPLE='\e[1;35m'
COLOR_YELLOW='\e[1;33m'
COLOR_WHITE='\e[1;37m'


#------------------------------------------////
# Aliases:
#------------------------------------------////


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
alias update_bashrc='wget -O /etc/bashrc https://raw.github.com/brandonwamboldt/bashrc/master/bashrc && bash'
alias ping='ping -c 4'
alias ns='netstat -alnp --protocol --inet'


#------------------------------------------////
# Prompt:
#------------------------------------------////

# Set the window title to show the user@host and the current working directory (Don't expand $HOME)
XTERM_TITLE='\[\e]0;\u@\H \t $(pwd)\a\]'

export PS1="${XTERM_TITLE}[\u@\h ${COLOR_PURPLE}\w${COLOR_RESET}] ${COLOR_GREEN}> ${COLOR_RESET}"


#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////

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

#------------------------------------------////
# Includes
#------------------------------------------////

# Computer specific bashrc config
if [ -f /etc/bashrc.custom ]; then
        . /etc/bashrc.custom
fi

# User specific bashrc aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH
