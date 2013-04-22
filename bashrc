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

COLOR_RESET="\033[0m"
COLOR_BLACK="\033[0;30m"
COLOR_BLUE="\033[0;34m"
COLOR_GREEN="\033[1;32m"
COLOR_CYAN="\033[0;36m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[0;35m"
COLOR_BROWN="\033[0;33m"
COLOR_LIGHTGRAY="\033[0;37m"
COLOR_DARKGRAY="\033[1;30m"
COLOR_LIGHTBLUE="\033[1;34m"
COLOR_LIGHTGREEN="\033[1;32m"
COLOR_LIGHTCYAN="\033[1;36m"
COLOR_LIGHTRED="\033[1;31m"
COLOR_LIGHTPURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_WHITE="\033[1;37m"

#------------------------------------------////
# Aliases:
#------------------------------------------////

alias ls='ls --color'
alias ll='ls -lhs'
alias la='ls -lhAs'
alias lo='ls -o'
alias lh='ls -lh'
alias sl='ls'
alias l='ls -CF'
alias s='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias update_bashrc='wget --no-check-certificate -O /etc/bashrc https://raw.github.com/brandonwamboldt/bashrc/master/bashrc && bash'
alias ns='netstat -alnp --protocol --inet'

#------------------------------------------////
# Prompt:
#------------------------------------------////

# Set the window title to show the user@host and the current working directory (Don't expand $HOME)
function set_bash_prompt() {
        case $TERM in
                xterm*)
                        XTERM_TITLE='\[\033]0;\u@\H \t $(pwd)\a\007\]'
                        ;;
                *)
                        XTERM_TITLE=''
                        ;;
        esac

        PS1="${XTERM_TITLE}\[$COLOR_YELLOW\]\u\[$COLOR_RESET\]@\[$COLOR_RED\]\h\[$COLOR_RESET\] \w \[$COLOR_GREEN\]>\[$COLOR_RESET\] "
}

PROMPT_COMMAND=set_bash_prompt

#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////

# Attach strace to all processes matching the given process name
straceall () {
        ps -ef | grep $1 | awk '{ print "-p " $2}' | xargs strace
}

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

# Parent process ID
ppid () {
        ps -p ${1:-$$} -o ppid=;
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
