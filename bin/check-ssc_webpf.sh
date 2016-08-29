#!/bin/bash

date --rfc-3339=seconds
cd /home/chenyang/Mount/20.1.75.41_ssc_webpf/workspace
git pull
echo $?
