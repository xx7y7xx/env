#!/bin/bash

# $1 input
# $2 output

sgp1=128.199.90.7

echo "Sending source code across GFW."
scp $1 root@$sgp1:/tmp/gen.js

echo "Compile source code with Google service."
ssh root@$sgp1 "python /root/compile.py /tmp/gen.js" 1> $2
