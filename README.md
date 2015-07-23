# shell utils repository ;)
-------------------

This repository contains some utilities to use in shell / linux command line.

Below is an explanation of each script and its features, but the examples of usage and/or installation are inside the script.

after-install.sh
-------------------

A script to be executed after install a linux distro debian-like or that uses .deb packages and apt-get utility.
It's a way to install some utils packages.
It's necessary have root privileges ;).

Using apt-get:
- **apache2** - Apache Hypertext Transfer Protocol Server
- **arj** - Archiver for .arj files
- **build-essential** - _____
- **gcc** - GNU project C and C++ compiler
- **git** - the stupid content tracker
- **gitk** - The Git repository browser
- **gparted** - Gnome partition editor for manipulating disk partitions
- **hardinfo** - shows hardware information in a GTK+ window
- **htop** - interactive process viewer
- **iptraf** - Interactive Colorful IP LAN Monitor
- **linux-firmware-nonfree** - _____
- **lunzip** - small decompressor for lzip files
- **lzip** - reduces the size of files
- **make** - GNU make utility to maintain groups of programs
- **npm** - node package manager
- **oracle-java8-installer** - _____
- **oracle-java8-set-default** - _____
- **p7zip-rar** - _____
- **php5** - ______
- **popcorn-time** - _____
- **python** - an interpreted, interactive, object-oriented programming language
- **python-pip** - A tool for installing and managing Python packages
- **rar** - archive files with compression
- **sharutils** - _____
- **spotify-client** - _____
- **ubuntu-restricted-extras** - _____
- **unace** - extract, test and view ACE archives
- **unetbootin** - program to install Linux/BSD distributions to  a partition or USB drive
- **vim** - Vi IMproved, a programmers text editor
- **whois** - client for the whois directory service

Using direct download:
- **peco v0.3.3** - Simplistic interactive filtering tool

after-install-rh.sh
-------------------

A script to be executed after install a linux distro redhat-like or that uses .rpm packages and yum utility.
It follow the same idea from after-install.sh, but to redhat-like systems, like said.

This script need to be continued and improved.

init-scripts / brightness
-------------------

This script saves the brightness level between restarts. It is called from the boot, halt and reboot scripts.

This script was found on the internet, and we really do not know who made this script.
