#!/bin/bash

IP="104.194.94.240" # change to 104.245.45.137 at 2018-07-26 01:25
IP="104.245.45.137" # change to 138.128.223.80 at 2018-07-26 01:36
IP="138.128.223.80"
PORT="27495"
USER="root"

if [ "X$YONYOU" = "X1" ]; then
  ssh $USER@$IP -p $PORT -i ~/.ssh/d3vin/id_rsa
else
  ssh $USER@$IP -p $PORT
fi
