Brandon's dotfiles
==================

Installation
------------

```
curl -sSL http://github.com/brandonwamboldt/dotfiles/archive/master.tar.gz | \
tar --strip-components=1 -C ~ -zx && \
rm ~/README.md
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
