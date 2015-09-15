#!/bin/bash

ROOT_DIR="/home/chenyang/Mount"

ip_list=(
"0.23"
"0.24"
"0.62"
"0.64"
"0.65"
"0.23"
)

cmd="multitail -s 3"

for ip in "${ip_list[@]}"
do
  logfile="$ROOT_DIR/${ip}sftp/var/log/glue.log"
  if [ -f "$logfile" ];then
    cmd=" $cmd -ci red -t $ip $logfile "
  fi
done

$cmd