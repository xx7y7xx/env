#!/bin/bash

# README.md
#
# ## deps
#
# ```
# sudo apt-get install byzanz -y
# ```

current_time=`date +"%Y-%m-%d_%H_%M_%S"`
output_file="/home/chenyang/Pictures/${current_time}.gif"
byzanz="byzanz-record"

if ! type "$byzanz" > /dev/null; then
  echo "ERROR: $byzanz not found!"
  notify-send.sh "byzanz-record" "ERROR: $byzanz not found!"
  exit 1
fi

# GIF duration
if [ -z "$1" ]; then
  duration=5
else
  duration=$1
fi

sleep 0.5
#byzanz-record --duration=$duration --x=200 --y=300 --width=700 --height=400 $output_file
byzanz-record --duration=$duration --x=0 --y=0 --width=1440 --height=900 $output_file

notify-send.sh "byzanz-record" "GIF job finished."
