#!/bin/bash

GLUEIP="192.168.1.153"                                                           
SVNOPT=" --username=ci --password=sp12345678 --no-auth-cache --non-interactive --force "
TOOLS_URL="http://www.xuanran001.com/public/tools"

# get root
echo "Input password to get root permission."
sudo ls

#
# Installation
#

# 1. MUST INSTALL tools and base system.

sudo apt-get install -y vim vim-gtk
sudo apt-get install -y git subversion curl
sudo apt-get install -y openssh-server sshfs
# GUI software
sudo apt-get install -y nautilus-open-terminal
sudo apt-get install -y filezilla gimp meld

# hudson slave needs java runtime env
# apache sling need java runtime env (java7 may not work)
# apache sling deploy need maven2
#sudo apt-get install -y openjdk-6-jdk maven2
svn export $SVNOPT http://$GLUEIP/svn/glue/trunk/infrastructure/192.168.1.3/web/spinst/java.sh /tmp/java.sh
sudo /tmp/java.sh

# 2. Recommanded tools and base system.

# other base system.
sudo apt-get install -y x11vnc
# other common tools
sudo apt-get install -y multitail p7zip davfs2 gnuplot unrar
# other common software
sudo apt-get install -y xzoom
sudo apt-get install -y shutter virtualbox
# render/image
sudo apt-get install -y luminance-hdr imagemagick

# nodejs
# a better way to install nodejs - http://xxd3vin.github.io/nodejs
#sudo apt-get install -y nodejs npm
#sudo ln -s /usr/bin/nodejs /usr/bin/node

# nodejs weinre
sudo npm -g install weinre

# glue performance statistics
#
# Setup steps is here: https://github.com/sp-chenyang/performance#setup
# If installer doesn't exist, you can download it at https://pypi.python.org/pypi/odfpy
#cd ~/Downloads/tmp/odfpy-0.9.6
#python setup.py build
#sudo python setup.py install
#cd -
# Make sure ~/source/performance dir exist.

#
# Config
#

# Import crontab
crontab /home/chenyang/env/crontab

# hosts
sudo chown chenyang.chenyang /etc/hosts
cat /home/chenyang/env/hosts >> /etc/hosts

# mount point
sudo chown chenyang.chenyang /etc/fstab
cat /home/chenyang/env/fstab  >> /etc/fstab

# Only swap when absolutely necessary
sudo chown chenyang.chenyang /etc/sysctl.conf
echo "vm.swappiness=1" >> /etc/sysctl.conf
