#!/bin/bash

# ip list

sgp="128.199.90.7"
sfo1="159.203.243.15"
nyc2="107.170.4.162"

case "$1" in
  sgp) ip=$sgp
  ;;
  sfo1) ip=$sfo1
  ;;
  nyc2) ip=$nyc2
  ;;
  *) ip=$sgp
  ;;
esac

echo $ip

autossh root@$ip -D 0.0.0.0:9998
