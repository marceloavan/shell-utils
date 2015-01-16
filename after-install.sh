#####################################################################
##  
## after-install.sh
## 
## A script to be executed after install a linux distro debian-like
## It's a way to install some util packages
## 
## CHANGELOG:
## 1.0 - Script created
##  
####################################################################
#!/bin/sh

### Update packs ###
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get dist-upgrade

### Install util packs ###
# l1 - Flash Player
# l2 - Multimedia codecs
# l3 - Rar and other archiving utilities
# l4 - Infos about hard, system and process
sudo apt-get install \
	pepperflashplugin-nonfree \
	ubuntu-restricted-extras \
	unace p7zip-rar sharutils rar arj lunzip lzip \
	hardinfo htop \
	
