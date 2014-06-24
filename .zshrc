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

function git_prompt {
  gitstatus=$(git status 1>/dev/null 2> /dev/null)

  if [[ $? == 0 ]] ; then
    echo " %{$fg[cyan]%}($(git_prompt_branch)$(git_prompt_status)%{$fg[cyan]%})%{$reset_color%}"
  fi
}

function git_prompt_branch {
  gitprompt=""
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if [[ $branch == "HEAD" ]] ; then
    rev=$(git rev-parse HEAD)
    gitprompt="${gitprompt}${rev:0:7}..."
  else
    gitprompt="${gitprompt}${branch}"
  fi

  gitdir=$(git rev-parse --git-dir 2> /dev/null)

  if [[ $gitdir != "" ]] ; then
    if [[ -d "$gitdir/rebase-apply" ]]; then
      if [[ -f "$gitdir/rebase-apply/rebasing" ]]; then
        gitprompt="${gitprompt}|REBASE"
      elif [[ -f "$gitdir/rebase-apply/applying" ]]; then
        gitprompt="${gitprompt}|AM"
      else
        gitprompt="${gitprompt}|AM/REBASE"
      fi
    elif [[ -f "$gitdir/MERGE_HEAD" ]]; then
      gitprompt="${gitprompt}|MERGING"
    elif [[ -f "$gitdir/CHERRY_PICK_HEAD" ]]; then
      gitprompt="${gitprompt}|CHERRY-PICKING"
    elif [[ -f "$gitdir/REVERT_HEAD" ]]; then
      gitprompt="${gitprompt}|REVERTING"
    elif [[ -f "$gitdir/BISECT_LOG" ]]; then
      gitprompt="${gitprompt}|BISECTING"
    fi
  fi

  echo $gitprompt
}

function git_prompt_status {
  gitstatus=$(git status 2> /dev/null)
  gitprompt=""

  if [[ ${gitstatus} =~ "nothing to commit, working directory clean" ]] ; then
    gitprompt="${gitprompt}%{$fg_bold[green]%} ✔"
  else
    gitprompt="${gitprompt}%{$fg_bold[yellow]%} ⚡"
  fi

  remote_pattern="Your branch is (ahead|behind).*by ([[:digit:]]*) commit"
  diverge_pattern="and have ([[:digit:]]*) and ([[:digit:]]*) different commit each, respectively"

  if [[ ${gitstatus} =~ ${remote_pattern} ]]; then
    if [[ ${match[1]} == "ahead" ]]; then
      gitprompt="${gitprompt}%{$fg_no_bold[cyan]%} ahead %{$fg_bold[green]%}${match[2]}"
    else
      gitprompt="${gitprompt}%{$fg_no_bold[cyan]%} behind %{$fg_bold[red]%}${match[2]}"
    fi
  elif [[ ${gitstatus} =~ ${diverge_pattern} ]]; then
    gitprompt="${gitprompt}%{$fg_no_bold[cyan]%} ahead %{$fg_bold[green]%}${match[1]}%{$fg_no_bold[cyan]%}, behind %{$fg_bold[red]%}${match[2]}"
  fi

  gitprompt="${gitprompt}%{$fg_no_bold[cyan]%}"

  echo $gitprompt
}

# Prompt
autoload -U colors && colors
NEWLINE=$'\n'
PROMPT="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} ${PWD/#$HOME/~}$(git_prompt)${NEWLINE}%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} "

# Load my aliases
source .aliases

# Load my functions
source .functions
