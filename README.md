bashrc
======

The .bashrc file that I use on all of my desktops, servers, VMs and even Cygwin setups

Initial Config
--------------

To copy this onto a new machine, make sure you are running as root and run the following command:

```
echo "source /etc/bashrc" | tee /home/*/.bashrc /etc/skel/.bashrc /root/.bashrc >/dev/null 
```

This will download the newest bashrc file from github to your server, link it for all existing users in the /home directory and create a /etc/bashrc.custom file for computer specific bash options.

Updating
--------

```

```
