#!/bin/bash

# ip list

sgp="128.199.90.7"
nyc1="192.241.129.192"

case "$1" in
  sgp) ip=$sgp
  ;;
  nyc1) ip=$nyc1
  ;;
  *) ip=$nyc1
  ;;
esac

echo $ip

autossh -vvv root@$ip #-D 0.0.0.0:9998
