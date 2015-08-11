#!/bin/bash

LOG174="/home/chenyang/Mount/0.174sftp/var/log/npm.log"
LOG175="/home/chenyang/Mount/0.175sftp/var/log/npm.log"
LOG176="/home/chenyang/Mount/0.176sftp/var/log/npm.log"
LOG177="/home/chenyang/Mount/0.177sftp/var/log/npm.log"
LOG178="/home/chenyang/Mount/0.178sftp/var/log/npm.log"
LOG179="/home/chenyang/Mount/0.179sftp/var/log/npm.log"
LOG180="/home/chenyang/Mount/0.180sftp/var/log/npm.log"
LOG181="/home/chenyang/Mount/0.181sftp/var/log/npm.log"
LOG182="/home/chenyang/Mount/0.182sftp/var/log/npm.log"
LOG183="/home/chenyang/Mount/0.183sftp/var/log/npm.log"
LOG184="/home/chenyang/Mount/0.184sftp/var/log/npm.log"
LOG185="/home/chenyang/Mount/0.185sftp/var/log/npm.log"
LOG186="/home/chenyang/Mount/0.186sftp/var/log/npm.log"

LOG="/tmp/npm-all.$RANDOM.log"

cat $LOG174 $LOG175 $LOG176 $LOG177 $LOG178 $LOG179 $LOG180 $LOG181 > $LOG
less $LOG
