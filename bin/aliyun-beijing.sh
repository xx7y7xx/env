#!/bin/bash

if [ $YONYOU = 1 ]; then
  ssh 101.200.74.182 -p 9999 -i ~/.ssh/d3vin/id_rsa
else
  ssh 101.200.74.182 -p 9999
fi
