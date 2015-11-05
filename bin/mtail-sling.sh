#!/bin/bash

# Optional param.
log_path="$1"

if [ "X$1" = "Xhelp" ]; then
  echo "log type:"
  echo "  - /var/log/glue.log"
  echo "  - /tmp/glue_fangan_to_wware.log"
  exit 0
fi

ROOT_DIR="/home/chenyang/Mount"

ip_list=(
"0.23"
"0.24"
"0.60"
"0.62"
"0.64"
"0.65"
"0.66"
"0.67"
"0.68"
"0.70"
"0.71"
)

# log type, default is glue.log
if [ -z $log_path ]; then
  log_path="/var/log/glue.log"
fi

cmd="multitail -s 3"

for ip in "${ip_list[@]}"
do
  logfile="$ROOT_DIR/${ip}sftp/$log_path"
  if [ -s "$logfile" ];then
    cmd=" $cmd -ci red -t $ip $logfile "
  fi
done

$cmd
