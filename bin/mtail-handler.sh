#!/bin/bash

ROOT_DIR="/home/chenyang/Mount"

ip_list=(
0.174
0.175
0.176
0.177
0.178
0.179
0.180
0.181
0.182
0.183
0.184
0.185
0.186
0.187
0.188
)

cmd="multitail -s 3"

for ip in "${ip_list[@]}"
do
  logfile="$ROOT_DIR/${ip}sftp/var/log/npm.log"
  if [ -f "$logfile" ];then
    cmd=" $cmd -ci red -t $ip $logfile "
  fi
done

$cmd
