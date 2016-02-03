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
BIGLOG="/tmp/sling_big_log.txt"

ip_list=(
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

echo "" > $BIGLOG

for ip in "${ip_list[@]}"
do
  logfile="$ROOT_DIR/${ip}sftp/$log_path"
  if [ -s "$logfile" ];then
    cat $logfile >> $BIGLOG
  fi
done

echo "All logs saved to $BIGLOG"

$cmd
