#!/bin/bash

SOURCES_MIRRORS_FILE="packages/mirrors.list"
MIRRORS_SPEED_FILE="/tmp/mirrors_speed.list"
function get_ping_speed()
{
local speed=`ping -W1 -c1 $1 2> /dev/null | grep "^r" |  cut -d '/' -f5`
echo $speed
}
function test_mirror_speed()
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
test -f $SOURCES_MIRRORS_FILE
  if [ "$?" != "0" ]; then  
    echo -e "$SOURCES_MIRRORS_FILE 不存在.\n"; exit 2
  else
    test_mirror_speed
    fast_mirror=$(get_fast_mirror)
  if [ "$fast_mirror" == "" ]; then
    echo -e "无法找到连通的网站数据源，请检查你的列表 $SOURCES_MIRRORS_FILE\n"
    exit 0
  fi
  fi
echo $fast_mirror
[ ! -e slitaz-rolling-core64.iso ] && wget $fast_mirror/iso/rolling/slitaz-rolling-core64.iso
mkdir iso-old
[ ! -d iso-old/boot ] && 7z x slitaz-rolling-core64.iso -y -r -o./iso-old
[ ! -e packages/linux64-3.16.55.tazpkg ] && wget -O ./packages/linux64-3.16.55.tazpkg http://www.ecoo.top:8083/dl/slitaz/linux64-3.16.55.tazpkg
[ ! -e packages/teasiu-5.0.tazpkg ] && wget -O ./packages/teasiu-5.0.tazpkg http://www.ecoo.top:8083/dl/slitaz/teasiu-5.0.tazpkg
[ ! -e packages/updatetime.txt ] && wget -O ./packages/updatetime.txt http://www.ecoo.top:8083/dl/slitaz/iso/rolling/slitaz-rolling-core64-chinese-updatetime.txt
docker build -t newrootfs -f ./dockerfile-rootfs64 .
docker run --name myrootfs newrootfs
docker cp myrootfs:/tmp/rootfs-new.gz ./iso64/mkiso/rootfs.gz
docker stop myrootfs
docker rm myrootfs
docker rmi newrootfs
cd iso64
sh iso.sh
