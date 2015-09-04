#!/bin/bash

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

# Load colors
. ./config/colors.sh

if [ $(id -u) -ne 0 ]; 
then	
	echo "";
	echo -e "${On_Red}${BWhite}Este script deve ser executado como root${Color_Off}";
	echo "Execute: "
	echo "    sudo $0 "
	echo "";
	exit 1;
fi



#####################
### CONFIGURE     ###
#####################

clear; 
echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";
echo -e "${Green}- Configurando repositórios ${Color_Off}";
echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";
find packages/ -type f | sort | while read SCRT; 
do 
	bash $SCRT info; 
done; 
echo "";


#######################
### Update packages ###
#######################

echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";
echo -e "${Green}- Atualizando APT ${Color_Off}";
echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";

#apt-get update
#apt-get upgrade
#apt-get dist-upgrade

echo "";

########################
### INSTALL          ###
########################
echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";
echo -e "${Green}- Instalando ${Color_Off}";
echo -e "${Green}-------------------------------------------------------------------------${Color_Off}";
find packages/ -type f | sort | while read SCRT; 
do 
	bash $SCRT info;
done; 

