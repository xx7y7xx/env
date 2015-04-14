#!/bin/bash

LOG60="/home/chenyang/Mount/0.60sftp/var/log/glue.log"
LOG62="/home/chenyang/Mount/0.62sftp/var/log/glue.log"

multitail -s 2 \
  -ci green  $LOG60 \
  -ci yellow $LOG62
