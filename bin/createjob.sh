#!/bin/bash

#curl -i --retry 0 -b $1=$2 \
#-Fdata=userJobName_3%3Bcameras_3%3Btype_5%3Bmoment_afternoon%3Bpic_classic \
#-FfilePicName=@/home/chenyang/Downloads/render.zip http://www.xuanran001.com/userdata/job/create
#
#exit 0

# POST - http://127.0.0.1:8080/sysop.putfile - data - uid=_lumei_40spolo.org&umail=_lumei_40spolo.org&pseudo=_chenyang_40masols.com&path=job/create&fspath=/var/www/html/upload/0/0059585520&data=userJobName_3%253Bcameras_3%253Btype_5%253Bmoment_afternoon%253Bpic_classic&filePicName_name=render.zip&filePicName_content_type=application%2Foctet-stream&filePicName_path=%2Fvar%2Fwww%2Fhtml%2Fupload%2F0%2F0059585520&filePicName_size=284526

curl -i http://192.168.0.64:9999/sysop.putfile \
-Fuid=_chenyang_40masols.com \
-Fumail=_chenyang_40masols.com \
-Fpath=job/create \
-Ffspath=/tmp/dir-no-exist \
-Fdata=userJobName_3%3Bcameras_3%3Btype_5%3Bmoment_afternoon%3Bpic_classic \
-FfilePicName_name=render.zip \
-FfilePicName_content_type=application%2Foctet-stream \
-FfilePicName_path=/tmp/xxdebug/render.zip
