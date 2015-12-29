#!/bin/bash

d=`date +"%Y-%m-%dT%T"`
f="/home/chenyang/Pictures/${d}.gif"

#byzanz-record --duration=5 --x=200 --y=300 --width=700 --height=400 $f
byzanz-record --duration=5 --x=0 --y=0 --width=1440 --height=900 $f

notify-send.sh "byzanz-record" "Job finished."
