#!/bin/bash

LOG174="/home/chenyang/Mount/0.174sftp/var/log/npm.log"
LOG175="/home/chenyang/Mount/0.175sftp/var/log/npm.log"
LOG176="/home/chenyang/Mount/0.176sftp/var/log/npm.log"
LOG177="/home/chenyang/Mount/0.177sftp/var/log/npm.log"
LOG178="/home/chenyang/Mount/0.178sftp/var/log/npm.log"
LOG179="/home/chenyang/Mount/0.179sftp/var/log/npm.log"
LOG180="/home/chenyang/Mount/0.180sftp/var/log/npm.log"
LOG181="/home/chenyang/Mount/0.181sftp/var/log/npm.log"

multitail -s 2 \
  -ci red    $LOG174 \
  -ci red    $LOG175 \
  -ci red    $LOG176 \
  -ci red    $LOG177 \
  -ci red    $LOG178 \
  -ci red    $LOG179 \
  -ci red    $LOG180 \
  -ci red    $LOG181
