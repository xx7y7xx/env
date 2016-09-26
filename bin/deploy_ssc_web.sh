#!/bin/bash

aliyun_ip="101.200.74.182"
test_ip="10.1.78.23"

tmp=/tmp/deploy_ssc_web_$RANDOM$RANDOM$RANDOM
echo "Create tmp dir: $tmp"
mkdir $tmp

run() {
  ssh -p 9999 -t -i ~/.ssh/d3vin/id_rsa -o StrictHostKeyChecking=no root@$aliyun_ip "$1"
}

run2() {
  ssh -t -o StrictHostKeyChecking=no root@$test_ip "$1"
}

# TODO: passing array to function
runs_on_aliyun() {
  for cmd in "${1[@]}"
  do
    echo $cmd
    ssh -p 9999 -t -i ~/.ssh/d3vin/id_rsa  -o StrictHostKeyChecking=no $aliyun_ip "$cmd"
  done
}

## build with webpack

#cd /home/chenyang/source/_sscplatform_/ssc_web/
#npm run build:admin

## deploy release bundle to aliyun

## deploy debug server to remote

# local: prepare debug server source tarball
echo "Make tarball of source code..."
cd /home/chenyang/source/_sscplatform_/ssc_web/
git archive develop | bzip2 > $tmp/ssc_web_source.tar.bz2
echo "Source tarball size: " `stat --printf="%s" $tmp/ssc_web_source.tar.bz2`
echo "Upload source tarball to remote server..."
scp -P 9999 -i ~/.ssh/d3vin/id_rsa -o StrictHostKeyChecking=no $tmp/ssc_web_source.tar.bz2 root@$aliyun_ip:/tmp
scp -o StrictHostKeyChecking=no $tmp/ssc_web_source.tar.bz2 root@$test_ip:/tmp

# remote: aliyun
run "ls -l /tmp/ssc_web_source.tar.bz2"
run "pm2 stop ssc30-admin-app"
run "rm -rfv /var/www/ssc_web; mkdir /var/www/ssc_web; mkdir /var/www/ssc_web/log;"
run "tar jxvf /tmp/ssc_web_source.tar.bz2 -C /var/www/ssc_web"
run "cd /var/www/ssc_web; npm install"
run "pm2 start ssc30-admin-app"
run "rm -v /tmp/ssc_web_source.tar.bz2"

# remote: deploy debug server to intranet
run2 "ls -l /tmp/ssc_web_source.tar.bz2"
run2 "pm2 stop ssc30-admin-app"
run2 "rm -rfv /var/www/ssc_web; mkdir /var/www/ssc_web; mkdir /var/www/ssc_web/log;"
run2 "tar jxvf /tmp/ssc_web_source.tar.bz2 -C /var/www/ssc_web"
run2 "cd /var/www/ssc_web; npm install"
run2 "pm2 start ssc30-admin-app"
run2 "rm -v /tmp/ssc_web_source.tar.bz2"

## Clean tmp data

echo "Remove temp dir: $tmp"
rm -rf $tmp
