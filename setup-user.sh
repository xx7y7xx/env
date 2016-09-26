#!/bin/bash

################
# common setup #
################

# Append this to .bashrc
## d3vin-start
## User specific environment and startup programs
#PATH=$PATH:$HOME/bin
#export PATH
## use vim to write svn commit log
#export SVN_EDITOR=vim
## d3vin-end

# ssh client
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ln -s ~/env/ssh_config ~/.ssh/config

# vim 
ln -s /home/chenyang/env/.vimrc /home/chenyang/.vimrc
ln -s ~/env/.vim ~/.vim
#~/.vim/autoload/
#~/.vim/autoload/pathogen.vim
#wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
#~/.vim/bundle/
#git submodule add https://github.com/moll/vim-node.git
#git submodule add https://github.com/scrooloose/nerdtree.git
#git submodule add https://github.com/Raimondi/delimitMate.git
#git submodule add https://github.com/wincent/command-t.git
#git submodule add https://github.com/pangloss/vim-javascript.git
#git submodule add https://github.com/jelera/vim-javascript-syntax.git
#git submodule add https://github.com/mileszs/ack.vim.git
#git submodule add https://github.com/PProvost/vim-markdown-jekyll.git
# remove git submodule
#
# ```
# $ git reset HEAD .gitmodules vim-markdown
# ```
#
# remove these lines in `.gitmodules`
#
# ```
# [submodule ".vim/bundle/vim-markdown"]
#   path = .vim/bundle/vim-markdown
#   url = https://github.com/hallison/vim-markdown.git
# ```
#
# remove submodule dir
#
# ```
# rm -rf vim-markdown
# ```
#
# remove config in `.git` of repo dir
#
# ```
# rm -rf .git/modules/.vim/bundle/vim-markdown
# ```
#
#vim :Helptags

#~/.vim/bundle/delimitMate

# bin
ln -s ~/env/bin ~/bin

# git config
ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig
#ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig.yonyou

#
# software config files/dir
#

ln -s ~/env/.shutter ~/.shutter

# filezilla
mkdir -p ~/.config
ln -s ~/env/.config/filezilla ~/.config/filezilla

# VirtualBox
ln -s /home/chenyang/env/.VirtualBox /home/chenyang/.VirtualBox

##########
# yonyou #
##########

# git config
ln -s /home/chenyang/env/.gitconfig.yonyou /home/chenyang/.gitconfig

###########
# sanpolo #
###########

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
# failed in ubuntu 16.04:
# ```
# No such schema 'org.gnome.settings-daemon.plugins.media-keys.custom-keybindings'
# ```
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Shutter"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "shutter -f"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "Print"

# program profile
# .remmina
# .mozilla
# .shutter
# .subversion
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
