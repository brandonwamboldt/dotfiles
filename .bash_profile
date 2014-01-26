# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

#------------------------------------------////
# Includes
#------------------------------------------////

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

#------------------------------------------////
# Start SSH agent in Cygwin
#------------------------------------------////

if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
        SSHAGENT=/usr/bin/ssh-agent
        SSHAGENTARGS="-s"

        if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
                eval `$SSHAGENT $SSHAGENTARGS`
                trap "kill $SSH_AGENT_PID" 0
        fi
fi
