#!/bin/bash

# Usage
# $ gif2mp4.sh input.gif output.mp4

input=$1
output=$2

ffmpeg -i $input -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $output
