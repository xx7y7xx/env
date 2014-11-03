

#
# applend this to .bashrc
#
## User specific environment and startup programs
#PATH=$PATH:$HOME/.local/bin:$HOME/bin
#export PATH
## use vim to write svn commit log
#export SVN_EDITOR=vim


# vim 
ln -s /home/chenyang/env/.vimrc /home/chenyang/.vimrc

# bin
ln -s /home/chenyang/env/bin/ /home/chenyang/bin

# hosts
sudo chown chenyang.chenyang /etc/hosts
cat /home/chenyang/env/hosts >> /etc/hosts

# git config
ln -s /home/chenyang/env/.gitconfig /home/chenyang/.gitconfig

# mount opt
sshfs -o reconnect,allow_other,default_permissions -o uid=1000 -o gid=1000 -o IdentityFile=/home/chenyang/.ssh/3dly.net.key -o StrictHostKeyChecking=no chenyang@192.168.2.21:/home/chenyang/cloud/opt /opt

# hudson slave needs java runtime env
# apache sling need java runtime env (java7 may not work)
sudo apt-get install openjdk-6-jdk

# mount point
sudo cat fstab  >> /etc/fstab

# hudson slave dir
mkdir -p /home/chenyang/tmp/hudsonslave
