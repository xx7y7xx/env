#!/bin/bash

chromium-browser http://localhost:8000

if [ "X$1" = "X" ]; then
  python -m SimpleHTTPServer
else
  cd $1
  python -m SimpleHTTPServer
  cd -
fi

