Brandon's dotfiles
==================

Installation
------------

### System Wide Installation

I set this up so frequently, I wrote a small script that I can copy and paste onto the command line to install the latest version of my dotfiles. The script requires git.

**Warning:** This script installs the dotfiles for all users on the system as the dotfiles in this repository are general purpose. It also installs the dotfiles into the skeleton directory for new users.

```
type -P git &>/dev/null && ( \
mkdir /tmp/bdotfiles && cd /tmp/bdotfiles && git clone https://github.com/brandonwamboldt/dotfiles.git . && \
ls --color=never /home | awk '{print "/home/" $1}' | xargs -n 1 cp -r .aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitconfig .git_prompt .svn_prompt .hg_prompt .vim .vimrc && \
cp -r .aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitconfig .git_prompt .svn_prompt .hg_prompt .vim .vimrc /root && \
cp -r .aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitconfig .git_prompt .svn_prompt .hg_prompt .vim .vimrc /etc/skel && \
cd - && rm -rf /tmp/bdotfiles && \
bash ) || echo "git is required to run this command"
```

### Install for your user only

Here's a version of the install command that will only install to the user you are currently logged in as. It will not affect any other users.

```
type -P git &>/dev/null && ( \
mkdir /tmp/bdotfiles && cd /tmp/bdotfiles && git clone https://github.com/brandonwamboldt/dotfiles.git . && \
cp -r .aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitconfig .git_prompt .svn_prompt .hg_prompt .vim .vimrc ~ && \
cd - && rm -rf /tmp/bdotfiles && \
bash ) || echo "git is required to run this command"
```

Features
--------

### Functions

#### Extract archives easily with extract()

Instead of trying to remember which arguments to use with the `tar`, just call the `extract` function

```
extract php-5.4.3.tar.gz
```

#### Attach Strace to all instances of a process with straceall()

Instead of remembering the code to get a process ID for running processes and piping it to xargs, use `straceall`. I use it frequently to attach to Apache or PHP-FPM.

```
straceall php-fpm
```

### Aliases for better directory listings

The `l` alias is provided for nicer directory listings. `l` prettys nice file sizes, full file info, enables color and more!

### Nicer user prompt

The default user prompt is overwritten with one that shows useful info in the title bar, and shows the user, host and working directory inline, with colors!

#### Git Branch

The bash prompt will now show you the current Git branch if you are in a Git repository.

#### Mercurial Branch

The bash prompt will now show you the current Mercurial branch if you are in a Mercurial repository.

#### Subversion Branch

The bash prompt will now show you the current Subversion branch if you are unlucky enough to be in a Subversion repository.

### Enhanced bash history

The bash command line history won't save duplicates and it's size has been increased

### Aliases for faster directory traversing

The `..` alias moves you to the parent directory, `...` moves you to the parent's parent directory, `....` moves you to the parent's parent's parent directory, etc. Makes it easier to navigate out of directories!

### Useful Git aliases

Some useful Git aliases like `st` for a condensed status view and `lg` for a nicer Git log view.

Changelog
---------

#### Version 2.0.0

* Renamed repository to `dotfiles` to match the rest of GitHub users doing this
* Added a bunch more of my dotfiles instead of just my `.bashrc` file
* Added lots of cool new things

#### Version 1.0.1

Added an alias for updating the .bashrc file, a bunch of COLOR_* variables for stylizing the prompt and added some comments

#### Version 1.0.0

Initial version
