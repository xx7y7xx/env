#!/bin/bash

function noty()
{
  export DISPLAY=:0.0 && export XAUTHORITY=/home/chenyang/.Xauthority && /usr/bin/notify-send "$1" "$2" -i ~/Downloads/swiper-autoplay.png
}

function check()
{
  repo_path="`pwd`"
  files="`git ls-files --other --directory --exclude-standard`"
  git ls-files --other --directory --exclude-standard | sed q1 || noty "Uncommit changes in Git" "Dir:\n`pwd`\n \nFile list:\n$files\n"

  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})
  BASE=$(git merge-base @ @{u})
  
  if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date" &> /dev/null
  elif [ $LOCAL = $BASE ]; then
    noty "Need to pull: $repo_path"
  elif [ $REMOTE = $BASE ]; then
    noty "Need to push: $repo_path"
  else
    noty "Diverged: $repo_path"
  fi

}

function check1()
{
  cd "$1" && check && cd -
}
function check2()
{
  cd "/home/chenyang/source/$1" && check && cd -
}

check1 "/home/chenyang/env"
#check1 "/home/chenyang/workspace"
#check2 "performance"
check2 "xxd3vin.github.io"
#check2 "xuanran001-infrastructure"
#check1 "/home/chenyang/wware/server"

## ssc

check2 "ssc_webcomp"
check2 "ssc_webdoc"
check2 "ssc_ocr"
check2 "yyssc.github.io"
check2 "tims-ocr-api"
