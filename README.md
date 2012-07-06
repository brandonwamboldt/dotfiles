bashrc
======

The .bashrc file that I use on all of my desktops, servers, VMs and even Cygwin setups

Initial Config
--------------

To copy this onto a new machine, make sure you are running as root and run the following command (Please Note: Installation requires the `wget` binary):

```
type -P wget &>/dev/null && ( \
mkdir -p /root && echo "source /etc/bashrc" | tee /home/*/.bashrc /etc/skel/.bashrc /root/.bashrc >/dev/null && \
wget --no-check-certificate -O /etc/bashrc https://raw.github.com/brandonwamboldt/bashrc/master/bashrc && \
touch /etc/bashrc.custom && \
chmod 600 /etc/bashrc && \
chmod 600 /etc/bashrc.custom && \
bash ) || echo "wget is required to run this command"
```

This will download the newest bashrc file from github to your server, link it for all existing users in the /home directory and create a /etc/bashrc.custom file for computer specific bash options.

Updating
--------

Updating the base bashrc file is very easy, and should cause no disruption to your users, provided you keep custom configuration in the `/etc/bashrc.custom` file.

```
update_bashrc
```

alternatively, you can use the full command:

```
wget -O /etc/bashrc https://raw.github.com/brandonwamboldt/bashrc/master/bashrc && bash
```

Features
--------

#### Extract archives easily

Instead of trying to remember which arguments to use with the `tar`, just call the `extract` function

```
extract php-5.4.3.tar.gz
```

#### Aliases for better directory listings

The `ll` alias is provided for nicer directory listings. `ll` prettys nice file sizes, full file info, disables color and more!

#### Nicer user prompt

The default user prompt is overwritten with one that shows useful info in the title bar, and shows the user, host and working directory inline, with colors!

#### Enhanced bash history

The bash command line history won't save duplicates and it's size has been increased

#### Aliases for faster directory traversing

The `..` alias moves you to the parent directory, `...` moves you to the parent's parent directory, `....` moves you to the parent's parent's parent directory, etc. Makes it easier to navigate out of directories!

Changelog
---------

#### Version 1.0.1

Added an alias for updating the .bashrc file, a bunch of COLOR_* variables for stylizing the prompt and added some comments

#### Version 1.0.0

Initial version
