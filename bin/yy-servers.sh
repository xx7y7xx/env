#!/bin/bash

# Dialog script from http://askubuntu.com/a/666179

# SSH config
PORT=22
user=root # default login user

#
# IP
#

# aliyun, 10.3.14.* 都是阿里云的服务器

ALIYUN_1=10.3.14.1
ALIYUN_2=10.3.14.2
ALIYUN_3=10.3.14.3
ALIYUN_5=10.3.14.5
ALIYUN_11=10.3.14.11
ALIYUN_12=10.3.14.12
ALIYUN_237=10.3.14.237

# yonyou cloud

YY_CLOUD_219=172.20.4.219
YY_CLOUD_220=172.20.4.220
YY_CLOUD_221=172.20.4.221
YY_CLOUD_222=172.20.4.222
YY_CLOUD_223=172.20.4.223
YY_CLOUD_224=172.20.4.224
YY_CLOUD_88=172.20.4.88

#
# Servers
#

# 【废弃】前后端联调
# 上面曾经的5088 http://172.20.4.88:5088/workbench
TESTING_SERVER="${YY_CLOUD_88}"
# 后端开发
BACKEND_DEVELOPMENT_SERVER=172.20.13.230
# 集群？
CLUSTER_NODE_233=10.3.14.233
CLUSTER_NODE_238=10.3.14.238
CLUSTER_NODE_239=10.3.14.239
CLUSTER_NODE_240=10.3.14.240 # 上面有mysql，后端使用，已经禁止前端登录
CLUSTER_NODE_241=10.3.14.241

# 友报表

# 测试环境
YBB_NODE_2="$ALIYUN_2"
# 正式环境
YBB_NODE_1="$ALIYUN_1"

# 友账表生产环境前端服务器
#YZB_STATICS_SERVER="$ALIYUN_237" # 曾经的友账表前端静态资源服务器
YZB_STATICS_SERVER1="$ALIYUN_3"
YZB_STATICS_SERVER2="$ALIYUN_5"

# Dialog config
HEIGHT=20
WIDTH=50
CHOICE_HEIGHT=10
BACKTITLE="SSH连接到服务器"
TITLE="服务器列表"
MENU="请在下面列表中选择需要连接的服务器:"
OPTIONS=(1 "前后端联调服务器 172.20.4.222"
         2 "后端开发服务器 172.20.13.230:8090 也是jenkins一个node"
         3 "集群节点 10.3.14.233"
         4 "集群节点 10.3.14.237"
         5 "集群节点 10.3.14.238"
         6 "集群节点 10.3.14.239"
         7 "集群节点 10.3.14.240"
         8 "集群节点 10.3.14.241"
         9 "用友云节点 172.20.4.222 用于前端集成联调"
         10 "用友云节点 172.20.4.220 用于后端集成联调"
         11 "友报表正式服务器 $YBB_NODE_1"
         12 "友报表测试服务器 $YBB_NODE_2"
         13 "友账表前端静态资源服务器(1) $YZB_STATICS_SERVER1"
         14 "友账表前端静态资源服务器(2) $YZB_STATICS_SERVER2"
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
            ip=$YY_CLOUD_222
            user=chenyang
            ;;
        2)
            #echo "You chose Option 2"
            ip=$BACKEND_DEVELOPMENT_SERVER
            ;;
        3)
            ip=$CLUSTER_NODE_233
            ;;
        4)
            ip=$ALIYUN_237
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
        9)
            ip=$YY_CLOUD_222
            user=chenyang
            ;;
        10)
            ip=$YY_CLOUD_220
            user=chenyang
            ;;
        11)
            ip=$YBB_NODE_1
            user=chenyang
            ;;
        12)
            ip=$YBB_NODE_2
            user=chenyang
            ;;
        13)
            ip=$YZB_STATICS_SERVER1
            ;;
        14)
            ip=$YZB_STATICS_SERVER2
            ;;
esac

if [ -z $ip ]; then
  echo "没有选择"
  exit 0
fi

echo "正在连接到服务器..."
ssh $user@$ip -p $PORT
