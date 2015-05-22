#!/bin/bash

# get root
sudo ls

#
# applend this to .bashrc
#
## User specific environment and startup programs
#PATH=$PATH:$HOME/.local/bin:$HOME/bin
#export PATH
## use vim to write svn commit log
#export SVN_EDITOR=vim


# base
#
sudo apt-get install sshfs x11vnc curl p7zip
# common software
#
sudo apt-get install subversion git vim multitail
# gui
sudo apt-get install nautilus-open-terminal xzoom
# tool
sudo apt-get install vim-gnome filezilla gimp shutter imagemagick
# hudson slave needs java runtime env
# apache sling need java runtime env (java7 may not work)
sudo apt-get install openjdk-6-jdk

# render
sudo apt-get install luminance-hdr

# nodejs
sudo apt-get install nodejs npm
ln -s /usr/bin/nodejs /usr/bin/node
# nodejs weinre
sudo npm -g install weinre
#$ cat .weinre/server.properties 
#boundHost:    -all-
#httpPort:     8080
##reuseAddr:    true
##readTimeout:  1
##deathTimeout: 5

# crond
sudo ln -s /home/chenyang/env/crond /etc/cron.d/chenyang

# vim 
ln -s /home/chenyang/env/.vimrc /home/chenyang/.vimrc

# VirtualBox
ln -s /home/chenyang/env/.VirtualBox /home/chenyang/.VirtualBox

# bin
ln -s /home/chenyang/env/bin /home/chenyang/bin

# hosts
sudo chown chenyang.chenyang /etc/hosts
cat /home/chenyang/env/hosts >> /etc/hosts

# git config
ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig

# mount opt
#sshfs -o reconnect,allow_other,default_permissions -o uid=1000 -o gid=1000 -o IdentityFile=/home/chenyang/.ssh/3dly.net.key -o StrictHostKeyChecking=no chenyang@192.168.2.21:/home/chenyang/cloud/opt /opt

# mount point
sudo chown chenyang.chenyang /etc/fstab
sudo cat /home/chenyang/env/fstab  >> /etc/fstab

mkdir -p /home/chenyang/workspace

# sudo mount -a

# hudson slave dir
mkdir -p /home/chenyang/tmp/hudsonslave

# glue performance statistics
https://github.com/sp-chenyang/performance#setup

# chinese input method
# open gnome-language-selector to install dep

# fix chinese input method in ubuntu 14.04
# ibus-daemon -drx

# more setup
# http://xxd3vin.github.io/ubuntu

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
