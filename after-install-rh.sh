#!/bin/sh

#####################################################################
##
## after-install-rh.sh
##
## A script to be executed after install a linux distro redhat-like or
## that uses .rpm packages and yum utility
##
## It's a way to install some utils packages
##
## It's necessary have root privileges ;)
##
## CHANGELOG:
## 1.0 - Script created
## 2.0 - New package organization and improved documentation
##
####################################################################

#######################
### Update packages ###
#######################

sudo yum check-update
sudo yum check

########################
### Download via yum ###
########################
# _____
sudo yum install \
	arj \
	gcc \
	git \
	gitk \
	gparted \
	htop \
	iptraf \
	lzip \
	make \
	npm \
	python \
	sharutils \
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
