#!/bin/bash

# Dialog script from http://askubuntu.com/a/666179

# SSH config
PORT=22
USER=root

# Server IP

# 前后端联调
TESTING_SERVER=172.20.4.88
# 后端开发
BACKEND_DEVELOPMENT_SERVER=172.20.13.230
# 集群？
CLUSTER_NODE_237=10.3.14.237
CLUSTER_NODE_238=10.3.14.237
CLUSTER_NODE_239=10.3.14.237
CLUSTER_NODE_240=10.3.14.240
CLUSTER_NODE_241=10.3.14.241

# Dialog config
HEIGHT=20
WIDTH=50
CHOICE_HEIGHT=10
BACKTITLE="SSH连接到服务器"
TITLE="服务器列表"
MENU="请在下面列表中选择需要连接的服务器:"
OPTIONS=(1 "前后端联调服务器 172.20.4.88:8088"
         2 "后端开发服务器 172.20.13.230:8090"
         3 "集群节点 10.3.14.237"
         4 "集群节点 10.3.14.238"
         5 "集群节点 10.3.14.239"
         6 "集群节点 10.3.14.240"
         7 "集群节点 10.3.14.241"
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
            ip=$TESTING_SERVER
            ;;
        2)
            #echo "You chose Option 2"
            ip=$BACKEND_DEVELOPMENT_SERVER
            ;;
        3)
            ip=$CLUSTER_NODE_237
            ;;
        4)
            ip=$CLUSTER_NODE_238
            ;;
        5)
            ip=$CLUSTER_NODE_239
            ;;
        6)
            ip=$CLUSTER_NODE_240
            ;;
        7)
            ip=$CLUSTER_NODE_241
            ;;
esac

if [ -z $ip ]; then
  echo "没有选择"
  exit 0
fi

echo "正在连接到服务器..."
ssh $USER@$ip -p $PORT -vvv
