#!/bin/sh
#自动检测最快软件源脚本
VERSION="5.0"
TEST_NETCONNECT_HOST="www.baidu.com"
SOURCES_MIRRORS_FILE="mirrors.list"    
MIRRORS_SPEED_FILE="/tmp/mirrors_speed.list"
function get_ping_speed()
{
local speed=`ping -W1 -c1 $1 2> /dev/null | grep "^rou" |  cut -d '/' -f5`
echo $speed
}
function test_mirror_speed()    #
{
    rm $MIRRORS_SPEED_FILE 2> /dev/null; touch $MIRRORS_SPEED_FILE
     cat $SOURCES_MIRRORS_FILE | while read mirror
    do
        if [ "$mirror" != "" ]; then
            echo -e "正在ping $mirror 检测中"
            local mirror_host=`echo $mirror | cut -d '/' -f3`    #change mirror_url to host
            local speed=$(get_ping_speed $mirror_host)
            if [ "$speed" != "" ]; then
                echo "测速时间是 $speed"
                echo "$mirror $speed" >> $MIRRORS_SPEED_FILE
            else
                echo "链接失败."
            fi
        fi
    done
}
function get_fast_mirror()
{
    sort -k 2 -n -o $MIRRORS_SPEED_FILE $MIRRORS_SPEED_FILE
    local fast_mirror=`head -n 1 $MIRRORS_SPEED_FILE | cut -d ' ' -f1`
    echo $fast_mirror
}
function backup_sources()
{
    echo -e "备份了你的旧列表.\n"
    sudo mv /var/lib/tazpkg/mirror /var/lib/tazpkg/mirror.`date +%F-%R:%S`
}
function update_sources()
{
    local mirror="$1"
    local tmp=$(mktemp)
    echo "$mirror/packages/$VERSION" >> $tmp
    sudo cp "$tmp" /var/lib/tazpkg/mirror
    sudo mv "$tmp" /tmp/rootfs/var/lib/tazpkg/mirror
    echo -e "你的最快软件源已经update.\n";
}
echo -e "\n检测中 network connection.\n请稍候...   c"
if [ "$(get_ping_speed $TEST_NETCONNECT_HOST)" == "" ]; then
    echo -e "网络不通.\n请检查你的网络."; exit 1
else
    echo -e "网络是连通的.\n"
    test -f $SOURCES_MIRRORS_FILE
    if [ "$?" != "0" ]; then  
        echo -e "$SOURCES_MIRRORS_FILE 不存在.\n"; exit 2
    else
        test_mirror_speed
        fast_mirror=$(get_fast_mirror)
        if [ "$fast_mirror" == "" ]; then
            echo -e "无法找到联通的网站数据源，请检查你的列表 $SOURCES_MIRRORS_FILE\n"
            exit 0
        fi
        echo -e "\n$最快的软件源网站已经自动选择，关闭本窗口. c"    
        backup_sources
        update_sources $fast_mirror
	sudo tazpkg recharge
    fi
fi
exit 0 
