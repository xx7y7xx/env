#!/bin/bash

while :
do
  printf "[`date`] " | tee -a /tmp/a.txt
  curl -s http://192.168.0.61:8080/sysop.test.jcr_status?from=test_balance.sh | sed '/^\s*$/d' | tee -a /tmp/a.txt
  sleep 0.5
done
