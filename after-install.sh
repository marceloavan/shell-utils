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
## 2.1 - Download latest version of peco and atom. Upgrade atom plugins.
##
########################################################################

#####################
### PPA / Sources ###
#####################

ROOT_UID="0"
EXC_UID="$(id -u)"
if [ "$EXC_UID" -ne "$ROOT_UID" ]; then
	echo "You must be root! Sorry."
	exit 1
fi

add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:libreoffice/ppa
add-apt-repository -y ppa:videolan/stable-daily

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
# p7zip-rar - _____
# python - an interpreted, interactive, object-oriented programming language
# python-pip - A tool for installing and managing Python packages
# rar - archive files with compression
# sharutils - _____
# spotify-client - _____
# ubuntu-restricted-extras - _____
# unace - extract, test and view ACE archives
# unetbootin - program to install Linux/BSD distributions to a partition or USB drive
# vim - Vi IMproved, a programmers text editor
# vlc - Popular media player
# whois - client for the whois directory service
apt-get -y --force-yes install \
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
	p7zip-rar \
	python \
	python-pip \
	rar \
	sharutils \
	spotify-client \
	ubuntu-restricted-extras \
	unace \
	unetbootin \
	vim \
	vlc \
	whois


#######################
### Direct download ###
#######################

# peco vLATEST - Simplistic interactive filtering tool
if which peco > /dev/null; then
	echo "peco is already installed"
else
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	LATEST=$(curl -s https://api.github.com/repos/peco/peco/releases/latest | grep 'browser_' | cut -d\" -f4 | grep peco_linux_amd64.tar.gz) && \
	VERSION=$(echo $LATEST | cut -d/ -f8) && \
	wget ${LATEST} -P /tmp && \
	tar -zxf /tmp/peco_linux_amd64.tar.gz -C /tmp && \
	cp -p /tmp/peco_linux_amd64/peco /usr/bin && \
	rm -rf /tmp/peco_linux_amd64/ && \
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	echo "peco ${VERSION} was installed sucessfully"
fi

# atom - Atom is a hackable text editor for the 21st century
if which  atom > /dev/null; then
	echo "atom is already installed"
else
	PACKAGE=/tmp/atom-amd64.deb;

	rm -f ${PACKAGE} && \
	wget -t0 https://atom.io/download/deb -O ${PACKAGE} && \
	dpkg -i ${PACKAGE} && \
	rm -f ${PACKAGE} && \
	VERSION=$(dpkg -I ${PACKAGE} | grep Version | cut -d: -f2) && \
	echo "atom v${VERSION##*( )} was installed sucessfully"

	echo "Upgrade apm packages"
	apm upgrade --confirm false
fi

# Google Chrome
if which google-chrome > /dev/null; then
	echo "Google chrome is already installed"
else
	if [ $(getconf LONG_BIT) = "64" ]
	then
		echo "Installing Google Chrome 64bit" && \
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
		dpkg -i google-chrome-stable_current_amd64.deb && \
		rm -f google-chrome-stable_current_amd64.deb && \
		echo "Google Chrome was installed sucessfully"
	else
		echo "Installing Google Chrome 32bit" && \
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb && \
		dpkg -i google-chrome-stable_current_i386.deb && \
		rm -f google-chrome-stable_current_i386.deb && \
		echo "Google Chrome was installed sucessfully"
	fi
fi
