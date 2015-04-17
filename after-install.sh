#####################################################################
##
## after-install.sh
##
## A script to be executed after install a linux distro debian-like or
## that uses .deb packages and apt-get utility
##
## It's a way to install some util packages
##
## CHANGELOG:
## 1.0 - Script created
## 1.1 - Direct download
## 1.2 - Spotify and source list
##
####################################################################
#!/bin/sh

### PPA / SOURCES ###
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/popcorntime
sudo add-apt-repository -y ppa:webupd8team/tribler
sudo add-apt-repository -y ppa:libreoffice/ppa
if [ -e "/etc/apt/sources.list.d/spotify.list" ]; then
	echo "source spotify list already exists in '/etc/apt/sources.list.d/spotify.list'"
else
	sudo sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
	echo "source spotify list was included in '/etc/apt/sources.list.d/spotify.list'"
fi


### Update packs ###
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade


### Download via apt ###
# l1 - Flash Player
# l2 - Multimedia and codecs
# l3 - Rar and other archiving utilities
# l4 - Infos about hard, system. partitions and process
# l5 - Editors and programming
# l6 - build essentials
sudo apt-get install \
	pepperflashplugin-nonfree popcorn-time tribler \
	ubuntu-restricted-extras spotify-client \
	unace p7zip-rar sharutils rar arj lunzip lzip \
	hardinfo htop iptraf gparted unetbootin whois \
	vim git gitk oracle-java8-installer oracle-java8-set-default apache2 mysql-server mysql-client php5 python \
	gcc make build-essential \


### Direct download ###
# peco v0.2.11
if which peco > /dev/null; then
	echo "peco is already installed"
else
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	wget https://github.com/peco/peco/releases/download/v0.2.11/peco_linux_amd64.tar.gz -P /tmp && \
	tar -zxf /tmp/peco_linux_amd64.tar.gz -C /tmp && \
	sudo cp -p /tmp/peco_linux_amd64/peco /usr/bin && \
	rm -rf /tmp/peco_linux_amd64/ && \
	rm -f /tmp/peco_linux_amd64.tar.gz && \
	echo "peco v0.2.11 was installed"
fi
