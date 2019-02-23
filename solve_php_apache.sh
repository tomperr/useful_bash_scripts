#!/bin/bash

# -------------------------------------
#
#	Author: @Yoshinker
#	Date: 2019-02-23
#	Version: 1.0.0
#	Tested On: Linux Mint 19 Tara
#
# -------------------------------------

# NEED ROOT PRIVILEGES TO RUN

if [ "$EUID" -ne 0 ]; then 
	echo "Please run as root"
	echo "Usage: sudo $0"
	exit
fi

# installing apache2 server
apt install -y apache2 
apt install -y mysql-server 

# adding php7 repository
add-apt-repository -y ppa:ondrej/php 
apt-get -y update

# installing php7
apt-get -y install php7.3 php7.3-fpm 

# configuring apache2
a2enmod proxy_fcgi setenvif 
a2enconf php7.3-fpm 
service apache2 restart 
