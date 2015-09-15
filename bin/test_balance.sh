#!/bin/bash

while :
do
  curl -s http://192.168.0.61:8080/sysop.test.jcr_status | sed '/^\s*$/d' | tee -a /tmp/a.txt
  sleep 0.1
done
