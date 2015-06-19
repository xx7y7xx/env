#!/bin/bash

title="$1"
content="$2"

export DISPLAY=:0.0 && export XAUTHORITY=/home/chenyang/.Xauthority && /usr/bin/notify-send "$title" "$content" -i ~/Downloads/swiper-autoplay.png
# sleep for jenkins job
sleep 10
