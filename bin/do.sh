#!/bin/bash

# ip list

sgp="128.199.90.7"
sfo1="159.203.243.15"

if [ "X$1" = "X1" ]; then
  ip=$sfo1
else
  ip=$sgp
fi

echo $ip

autossh root@$ip -D 0.0.0.0:9998
