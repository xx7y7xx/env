#!/bin/bash

IP="104.194.94.240"
PORT="27495"
USER="root"

if [ "X$YONYOU" = "X1" ]; then
  ssh $USER@$IP -p $PORT -i ~/.ssh/d3vin/id_rsa
else
  ssh $USER@$IP -p $PORT
fi
