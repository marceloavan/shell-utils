#!/bin/sh

########################################################################
##
## after-install.sh
##
## A script to be executed after install a linux distro debian-like or
## that uses .deb packages and apt-get utility
##
## It's a way to install some utils packages
##
## It's necessary have root privileges ;)
##
## CHANGELOG:
## 1.0 - Script created
## 1.1 - Direct download
## 1.2 - Spotify and source list
## 2.0 - New package organization and improved documentation
##
########################################################################

#####################
### PPA / Sources ###
#####################

add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:webupd8team/popcorntime
add-apt-repository -y ppa:libreoffice/ppa
if [ -e "/etc/apt/sources.list.d/spotify.list" ]; then
	echo "source spotify list already exists in '/etc/apt/sources.list.d/spotify.list'"
else
	sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
	echo "source spotify list was included in '/etc/apt/sources.list.d/spotify.list'"
fi

#######################
### Update packages ###
#######################

apt-get update
apt-get upgrade
apt-get dist-upgrade

########################
### Download via apt ###
########################

# apache2 - Apache Hypertext Transfer Protocol Server
# arj - Archiver for .arj files
# build-essential - _____
# gcc - GNU project C and C++ compiler
# git - the stupid content tracker
# gitk - The Git repository browser
# gparted - Gnome partition editor for manipulating disk partitions
# hardinfo - shows hardware information in a GTK+ window
# htop - interactive process viewer
# iptraf - Interactive Colorful IP LAN Monitor
# linux-firmware-nonfree - _____
# lunzip - small decompressor for lzip files
# lzip - reduces the size of files
# make - GNU make utility to maintain groups of programs
# npm - node package manager
# oracle-java8-installer - _____
# oracle-java8-set-default - _____
# p7zip-rar - _____
# php5 - ______
# popcorn-time - _____
# python - an interpreted, interactive, object-oriented programming language
# python-pip - A tool for installing and managing Python packages
# rar - archive files with compression
# sharutils - _____
# spotify-client - _____
# ubuntu-restricted-extras - _____
# unace - extract, test and view ACE archives
# unetbootin - program to install Linux/BSD distributions to a partition or USB drive
# vim - Vi IMproved, a programmers text editor
# whois - client for the whois directory service
apt-get install \
	apache2 \
	arj \
	build-essential \
	gcc \
	git \
	gitk \
	gparted \
	hardinfo \
	htop \
	iptraf \
	linux-firmware-nonfree \
	lunzip \
	lzip \
	make \
	npm \
	oracle-java8-installer \
	oracle-java8-set-default \
	p7zip-rar \
	php5 \
	popcorn-time \
	python \
	python-pip \
	rar \
	sharutils \
	spotify-client \
	ubuntu-restricted-extras \
	unace \
	unetbootin \
	vim \
	whois \

#######################
### Direct download ###
#######################

# peco v0.3.3 - Simplistic interactive filtering tool
if which peco > /dev/null; then
	echo "peco is already installed"
else
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	wget https://github.com/peco/peco/releases/download/v0.3.3/peco_linux_amd64.tar.gz -P /tmp && \
	tar -zxf /tmp/peco_linux_amd64.tar.gz -C /tmp && \
	cp -p /tmp/peco_linux_amd64/peco /usr/bin && \
	rm -rf /tmp/peco_linux_amd64/ && \
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	echo "peco v0.3.3 was installed sucessfully"
fi
