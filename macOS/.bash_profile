
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
# d3vin-start
#

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH
# use vim to write svn commit log
export SVN_EDITOR=vim
# command alias
alias ll='ls -lG'

# Bash completion with brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#
# d3vin-end
#
