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

# apache ant
#http://192.168.2.21/art2/tool/apache-ant-1.9.6-bin.zip
#http://pan.baidu.com/s/1bnfjqUz
wget http://www.xuanran001.com/public/tools/apache-ant-1.9.6-bin.zip -O /tmp/apache-ant-1.9.6-bin.zip
unzip /tmp/apache-ant-1.9.6-bin.zip -d /home/chenyang/opt/apache-ant-1.9.6

#
# Config
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

# ssh client
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ln -s /home/chenyang/env/ssh_config /home/chenyang/.ssh/config

# vim 
ln -s /home/chenyang/env/.vimrc /home/chenyang/.vimrc

# VirtualBox
ln -s /home/chenyang/env/.VirtualBox /home/chenyang/.VirtualBox

# bin
ln -s /home/chenyang/env/bin /home/chenyang/bin

# git config
ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig

# node
ln -s /home/chenyang/env/.npmrc /home/chenyang/.npmrc

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

# dir
# - ~/source/* common source code dir
# - ~/glue glue svn local working copy
#   - ~/glue/wware wware projects on glue svn
#     - ~/glue/wware/wware_be_samples.com -> ~/wware/wware_be_samples
# - ~/wware/wide wware wide git local branch
# - ~/wware/client wware client git local branch
# - ~/wware/server wware server git local branch
# - ~/wware/syncer wware syncer git local branch
# - ~/wware/projects -> ~/glue/wware
# - ~/wware/wware_be_sample wware samples in github

#ln -s ~/wware/wware_be_samples ~/glue/wware/wware_be_samples.com
#ln -s ~/glue/wware ~/wware/projects
