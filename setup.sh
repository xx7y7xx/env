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

sudo apt-get install -y git vim subversion curl sshfs
sudo apt-get install -y openssh-server

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
sudo apt-get install -y multitail p7zip davfs2 gnuplot
# other common software
sudo apt-get install -y nautilus-open-terminal xzoom
sudo apt-get install -y vim-gnome filezilla gimp shutter virtualbox
# render/image
sudo apt-get install -y luminance-hdr imagemagick

# nodejs
sudo apt-get install -y nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
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
# System config
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

#
# User installation
#

# apache ant
#http://192.168.2.21/art2/tool/apache-ant-1.9.6-bin.zip
#http://pan.baidu.com/s/1bnfjqUz
wget http://www.xuanran001.com/public/tools/apache-ant-1.9.6-bin.zip -O /tmp/apache-ant-1.9.6-bin.zip
unzip /tmp/apache-ant-1.9.6-bin.zip -d /home/chenyang/opt/apache-ant-1.9.6

#
# User config
#

#$ cat .weinre/server.properties 
#boundHost:    -all-
#httpPort:     8080
##reuseAddr:    true
##readTimeout:  1
##deathTimeout: 5

# Append this to .bashrc
## User specific environment and startup programs
#PATH=$PATH:$HOME/.local/bin:$HOME/bin
#export PATH
## use vim to write svn commit log
#export SVN_EDITOR=vim

# vim 
ln -s /home/chenyang/env/.vimrc /home/chenyang/.vimrc

# VirtualBox
ln -s /home/chenyang/env/.VirtualBox /home/chenyang/.VirtualBox

# bin
ln -s /home/chenyang/env/bin /home/chenyang/bin

# git config
ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig

# mount opt
#sshfs -o reconnect,allow_other,default_permissions -o uid=1000 -o gid=1000 -o StrictHostKeyChecking=no chenyang@192.168.2.21:/home/chenyang/cloud/opt /opt

mkdir -p /home/chenyang/workspace

# sudo mount -a

# hudson slave dir
mkdir -p /home/chenyang/opt/hudsonslave

# chinese input method
# open gnome-language-selector to install dep

# fix chinese input method in ubuntu 14.04
# ibus-daemon -drx

# more setup
# http://xxd3vin.github.io/ubuntu

# gnome keyboard shortcut ( MUST BE TEST !! )
# gconftool-2 --set  new schema org.gnome.settings-daemon.plugins.media-keys.custom-keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Shutter"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "shutter -f"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "Print"

# program profile
# .remmina
# .filezilla
# .mozilla
# .shutter
# .subversion
# .vim
# .thunderbird
# .gimp-2.8
# .config/google-chrome
# /home/chenyang/.shutter
# /home/chenyang/.config/autostart/*

# Manually setup

# shutter
#reduce jpeg quality to 10%

# Import CA to Chrome for goagent
