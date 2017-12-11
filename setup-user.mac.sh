#!/bin/bash

################
# common setup #
################

# Append this to .bash_profile
## d3vin-start
## User specific environment and startup programs
#PATH=$PATH:$HOME/bin
#export PATH
## use vim to write svn commit log
#export SVN_EDITOR=vim
## command alias
#alias ll='ls -lG'
## d3vin-end

# bin
ln -s ~/env/bin ~/bin

# install common tools

```
$ brew install ffmpeg
$ brew install dialog # Linux shell script dialog http://invisible-island.net/dialog/dialog.html
```

# MUST install neo-vim
mkdir ${HOME}/.config/nvim
ln -s ${HOME}/env/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim