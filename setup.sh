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
sudo apt-get install sshfs x11vnc curl p7zip virtualbox
# common software
#
sudo apt-get install subversion git vim multitail
# gui
sudo apt-get install nautilus-open-terminal xzoom
# tool
sudo apt-get install vim-gnome filezilla gimp shutter imagemagick gnuplot
# hudson slave needs java runtime env
# apache sling need java runtime env (java7 may not work)
# apache sling deploy need maven2
sudo apt-get install openjdk-6-jdk maven2

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
mkdir -p /home/chenyang/opt/hudsonslave

# glue performance statistics
#
# Setup steps is here: https://github.com/sp-chenyang/performance#setup
# If installer doesn't exist, you can download it at https://pypi.python.org/pypi/odfpy
cd ~/Downloads/tmp/odfpy-0.9.6
python setup.py build
sudo python setup.py install
cd -
# Make sure ~/source/performance dir exist.

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
