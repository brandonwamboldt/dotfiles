Brandon's dotfiles
==================

This repository isn't really for other people, it's mostly for all my personalized configuration files so I can easily install them on any computer or environment (I'm frequently spinning up new VMs, which I like to install my dotfiles on). Feel free to use them or look through them to see what I've done.

Installation
------------

**Bash:**

> curl -sSL http://github.com/brandonwamboldt/dotfiles/archive/master.tar.gz | tar --strip-components=1 -C ~ -zx && /bin/rm ~/README.md && source ~/.bashrc

**Zsh:**

> curl -sSL http://github.com/brandonwamboldt/dotfiles/archive/master.tar.gz | tar --strip-components=1 -C ~ -zx && /bin/rm ~/README.md && source ~/.zshrc

Features
--------

### Functions

### Nicer user prompt

The default user prompt is overwritten with one that shows useful info in the title bar, and shows the user, host and working directory inline, with colors! This is my personalized prompt.

### Zsh config with plugins

I have my personalized zsh prompt (which closely mirrors my bash prompt) with a few custom autocomplete plugins (e.g. NPM, Composer, Symfony).

### Jump around with z

I'm using the amazing Oh-My-Zsh plugin ['Z'](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z), which allows you to rapidly navigate to your favorite directories.

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

#### Git Branch

The bash prompt will now show you the current Git branch if you are in a Git repository.

#### Mercurial Branch

The bash prompt will now show you the current Mercurial branch if you are in a Mercurial repository.

### Enhanced bash history

The bash command line history won't save duplicates and it's size has been increased

### Aliases for faster directory traversing

The `..` alias moves you to the parent directory, `...` moves you to the parent's parent directory, `....` moves you to the parent's parent's parent directory, etc. Makes it easier to navigate out of directories!

### Useful Git aliases

Some useful Git aliases like `st` for a condensed status view and `lg` for a nicer Git log view.

### VIM theme & setup

While I'm still trying to get VIM setup the way I like it, all of my VIM configuration is in here.
