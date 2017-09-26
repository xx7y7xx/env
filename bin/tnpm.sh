#!/bin/bash

if [ -n $1 ]; then
  npm install $1 -S --registry=https://registry.npm.taobao.org
else
  npm install --registry=https://registry.npm.taobao.org
fi

