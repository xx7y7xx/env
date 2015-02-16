# update sigle basic page on 0.61

PAGE="$1"

ssh -t -t -i ~/.ssh/3dly.net.key -o ConnectTimeout=8 -o StrictHostKeyChecking=no chenyang@192.168.0.61 "rm -rf /home/chenyang/tmp/drupal_svn/page ; mkdir -p /home/chenyang/tmp/drupal_svn/page ; svn export http://192.168.1.153/svn/glue/trunk/xuanran001/page/ /home/chenyang/tmp/drupal_svn/page  --username=ci --password=sp12345678 --no-auth-cache --non-interactive  --force"
ssh -t -t -i ~/.ssh/3dly.net.key -o ConnectTimeout=8 -o StrictHostKeyChecking=no chenyang@192.168.0.61 "cd /var/www/html/web ; /home/glue/tools/update_page.php  --source=/home/chenyang/tmp/drupal_svn/page/$PAGE --target=$PAGE ;"
