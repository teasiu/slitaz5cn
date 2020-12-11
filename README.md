# slitaz5cn
神雕定制slitaz中文版
# 使用
1. 根据官方每周固件进行中文定制。
2. 管理账号root密码root，用户账号tux密码为空
3. 启动和安装
    可以使用各种引导开机，grub2,syslinux,UEFI等。
    可以安装到usb磁盘，也可以网络pxe启动。
    启动代码请使用：
    【 linux /boot/bzImage initrd=/boot/rootfs.gz root=/dev/null video=-32 lang=zh_CN kmap=us TZ=Asia/Shanghai autologin 】
4. 内置中文输入法，支持拼音，五笔等，ctrl+空格切换开关，shift切换中英文输入。
5. 内置神雕的国内软件源地址，自动从国内源下载和更新软件包。
6. 
