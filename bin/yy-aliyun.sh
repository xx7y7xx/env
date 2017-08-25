#!/bin/bash

#10.3.14.5
#10.3.14.{?}
ip_4="$1"

if [ "X$YONYOU" = "X1" ]; then
  id="~/.ssh/d3vin/id_rsa"
else
  id="~/.ssh/id_rsa"
fi

if [ "X$ip_4" = "X" ]; then
  echo "missing ip 4"
  exit 1
fi

ssh root@10.3.14.${ip_4} -p 22 -i $id
