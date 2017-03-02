#!/bin/bash

IP=10.3.14.241
PORT=22
USER=root

#if [ "X$YONYOU" = "X1" ]; then
#  ssh $IP -p $PORT -i ~/.ssh/d3vin/id_rsa
#else
  ssh $USER@$IP -p $PORT
#fi
