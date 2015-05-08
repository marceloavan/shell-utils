#####################################################################
##
## after-install-rh.sh
##
## A script to be executed after install a linux distro redhat-like or
## that uses .rpm packages and yum utility
##
## It's a way to install some util packages
##
## CHANGELOG:
## 1.0 - Script created
##
####################################################################
#!/bin/sh
sudo yum check-update
sudo yum check

### Download via apt ###
# l3 - Rar and other archiving utilities
# l4 - Infos about hard, system. partitions and process
# l5 - Editors and programming
# l6 - build essentials
sudo yum install \
	sharutils arj lzip \
	htop iptraf gparted unetbootin whois \
	vim git gitk python npm \
	gcc make \

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
