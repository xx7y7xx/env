#!/bin/bash

. ./functions

curl http://192.168.0.60:9999/index.html
ret=$?

if [ $ret -ne 0 ]; then
  noty "sling is down"
fi
