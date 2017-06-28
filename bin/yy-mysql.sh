#!/bin/bash

# Dialog script from http://askubuntu.com/a/666179

# mysql config
user=root # default login user

# Server IP

# 说明
# 10.3.14.* 都是阿里云的服务器

# 前后端联调
TESTING_SERVER=172.20.4.88
# 后端开发
BACKEND_DEVELOPMENT_SERVER=172.20.13.230
# 集群？
CLUSTER_NODE_233=10.3.14.233
CLUSTER_NODE_237=10.3.14.237
CLUSTER_NODE_238=10.3.14.238
CLUSTER_NODE_239=10.3.14.239
CLUSTER_NODE_240=10.3.14.240
CLUSTER_NODE_241=10.3.14.241

# 友报表

# 测试环境
YBB_NODE_2=10.3.14.2
# 正式环境
YBB_NODE_1=10.3.14.1

# 用友云
YY_CLOUD_219=172.20.4.219
YY_CLOUD_220=172.20.4.220
YY_CLOUD_221=172.20.4.221
YY_CLOUD_222=172.20.4.222
YY_CLOUD_223=172.20.4.223
YY_CLOUD_224=172.20.4.224

get_passwd_from_keychain() {
  /home/chenyang/.local/bin/gkeyring --id=$1 | cut -f3
}

# Dialog config
HEIGHT=20
WIDTH=50
CHOICE_HEIGHT=10
BACKTITLE="SSH连接到服务器"
TITLE="服务器列表"
MENU="请在下面列表中选择需要连接的服务器:"
OPTIONS=(1 "前后端联调服务器 172.20.4.220"
         2 "后端开发服务器 172.20.13.230:8090 也是jenkins一个node"
         3 "集群节点 10.3.14.233"
         4 "集群节点 10.3.14.237"
         5 "集群节点 10.3.14.238"
         6 "集群节点 10.3.14.239"
         7 "集群节点 10.3.14.240"
         8 "集群节点 10.3.14.241"
)
CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            #echo "You chose Option 1"
            passwd=`get_passwd_from_keychain 2045`
            ip=$YY_CLOUD_220
            ;;
        2)
            #echo "You chose Option 2"
            ip=$BACKEND_DEVELOPMENT_SERVER
            ;;
        3)
            ip=$CLUSTER_NODE_233
            ;;
        4)
            ip=$CLUSTER_NODE_237
            ;;
        5)
            ip=$CLUSTER_NODE_238
            ;;
        6)
            ip=$CLUSTER_NODE_239
            ;;
        7)
            ip=$CLUSTER_NODE_240
            ;;
        8)
            ip=$CLUSTER_NODE_241
            ;;
esac

if [ -z $ip ]; then
  echo "没有选择"
  exit 0
fi

echo "正在连接到数据库..."
ssh $user@$ip -p $PORT

mysql -h $ip -u $user -p$passwd
