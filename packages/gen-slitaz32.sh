#!/bin/sh
URL="http://ecoo.top:8083/dl/slitaz"
ROOTFS="/tmp/rootfs"
echo "$URL/packages/5.0/" > $ROOTFS/var/lib/tazpkg/mirror
tazpkg install yong-2.5.0.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install sudocn-1.8.4.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install ghost-5.0.1.tazpkg --root=$ROOTFS --nodeps --local
tazpkg get wqy-microhei xz tar curl git xorg-xf86-input-vmmouse grsync
tazpkg install wqy-microhei*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install xz*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install tar*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install curl*.tazpkg --root=$ROOTFS --local
tazpkg install git*.tazpkg --root=$ROOTFS --local
tazpkg get locale-zh_CN locale-zh_CN-extra bash iptables linux-netfilter isomaster gvfs-smb dosfstools mdadm
tazpkg get exfat-utils gftp xorg-xf86-video-vmware p7zip-full zip unzip cpio gzip transmission-daemon libevent axel
tazpkg install locale-zh_CN*.tazpkg --root=$ROOTFS --nodeps --local
yes | tazpkg install bash*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install linux-netfilter*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install iptables*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install exfat-utils*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install gftp*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install xorg-xf86-video-vmware*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install xorg-xf86-input-vmmouse*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install p7zip-full*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install zip*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install unzip*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install cpio*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install gzip*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install rar*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install xarchiver*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install libevent*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install transmission-daemon*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install isomaster*.tazpkg --root=$ROOTFS --local
tazpkg install gvfs-smb*.tazpkg --root=$ROOTFS --local
tazpkg install transmission-web-contrl-1.61.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install dosfstools*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install mdadm*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg install grsync*.tazpkg --root=$ROOTFS --local
tazpkg install axel*.tazpkg --root=$ROOTFS --nodeps --local
tazpkg get xorg-xf86-video-geode xorg-xf86-video-ati xorg-xf86-video-nouveau xorg-xf86-video-intel xorg-xf86-video-radeonhd xorg-xf86-video-nv
tazpkg install xorg-xf86-video*.tazpkg --root=$ROOTFS --local
tazpkg -gi openvpn --root=$ROOTFS --local
tazpkg -gi linux64-video --root=$ROOTFS --local
tazpkg -gi linux64-cifs --root=$ROOTFS --local
tazpkg -gi linux64-acpi --root=$ROOTFS --local
tazpkg -gi linux64-configfs --root=$ROOTFS --local
tazpkg -gi linux64-aufs --root=$ROOTFS --local
tazpkg -gi nfs-utils --root=$ROOTFS --local
tazpkg install teasiu*.tazpkg --root=$ROOTFS --nodeps --local
cp -rf $ROOTFS/etc/xdg/openbox/menu.zh_CN.xml $ROOTFS/etc/xdg/openbox/menu.en.xml
cp -a updatetime.txt $ROOTFS/etc
mkdir -p $ROOTFS/etc/skel/.config/slitaz
echo "root" > $ROOTFS/etc/skel/.config/slitaz/subox.conf
echo "Name[zh_CN]=WiFi无线网络配置" >> $ROOTFS/usr/share/applications/wifi-box.desktop
echo "Name[zh_CN]=设置系统语言" >> $ROOTFS/usr/share/applications/tazbox-locale.desktop
echo "Name[zh_CN]=设置系统时区" >> $ROOTFS/usr/share/applications/tazbox-tz.desktop
echo "Name[zh_CN]=软件包管理器" >> $ROOTFS/usr/share/applications/tazpanel-pkgs.desktop
echo "Name[zh_CN]=设置账号密码" >> $ROOTFS/usr/share/applications/passwd.desktop
echo "Name[zh_CN]=预设应用程序" >> $ROOTFS/usr/share/applications/tazbox-tazapps.desktop
echo "Name[zh_CN]=本地语言包管理" >> $ROOTFS/usr/share/applications/tazbox-manage_i18n.desktop
echo "Name[zh_CN]=国际键盘设置" >> $ROOTFS/usr/share/applications/tazbox-keymap.desktop
rm $ROOTFS/usr/share/locale/zh_TW -rf
rm $ROOTFS/usr/share/locale/ca -rf
rm $ROOTFS/usr/share/locale/da -rf
rm $ROOTFS/usr/share/locale/de -rf
rm $ROOTFS/usr/share/locale/el -rf
rm $ROOTFS/usr/share/locale/es -rf
rm $ROOTFS/usr/share/locale/fa -rf
rm $ROOTFS/usr/share/locale/fr -rf
rm $ROOTFS/usr/share/locale/id -rf
rm $ROOTFS/usr/share/locale/it -rf
rm $ROOTFS/usr/share/locale/ja -rf
rm $ROOTFS/usr/share/locale/pl -rf
rm $ROOTFS/usr/share/locale/pt_BR -rf
rm $ROOTFS/usr/share/locale/ro -rf
rm $ROOTFS/usr/share/locale/ru -rf
rm $ROOTFS/usr/share/locale/sv -rf
cd $ROOTFS/var/lib/tazpkg
rm $ROOTFS/var/lib/tazpkg/packages.*
rm $ROOTFS/var/lib/tazpkg/ID*
rm $ROOTFS/var/lib/tazpkg/files*
rm $ROOTFS/var/lib/tazpkg/*.txt
rm $ROOTFS/var/lib/tazpkg/extra.list
sed -i  '4i\export XMODIFIERS="@im=yong"' $ROOTFS/etc/skel/.xinitrc
sed -i '5i\export GTK_IM_MODULE=yong' $ROOTFS/etc/skel/.xinitrc
sed -i '6i\yong &' $ROOTFS/etc/skel/.xinitrc
sed -i 's/Monospace/DejaVu Sans Mono/' $ROOTFS/etc/skel/.Xdefaults
sed -i 's/index.html/index.cn.html/' $ROOTFS/etc/skel/Desktop/slitaz-doc.desktop
sed -i 's/httpd/httpd dropbear transmission-daemon/' $ROOTFS/etc/rcS.conf
sed -i 's/UTC/Asia\/\Shanghai/' $ROOTFS/etc/init.d/system.sh
echo '/usr/bin/vlmcsd' >> $ROOTFS/etc/init.d/local.sh
echo "hwclock -s" >> $ROOTFS/etc/init.d/local.sh
echo 'echo "tux:tux" | chpasswd ' >> $ROOTFS/etc/init.d/local.sh
sed -i 's/sh/bash/' $ROOTFS/etc/passwd
cp -f $ROOTFS/etc/skel/.profile $ROOTFS/etc/skel/.bashrc
cat << EOF | chroot $ROOTFS
tazpkg -b sudo
tazpkg clean-cache
cd /var/lib/tazpkg
rm packages.*
rm ID*
rm files*
rm *.txt
rm extra.list
gtk-query-immodules-2.0 --update-cache
EOF

