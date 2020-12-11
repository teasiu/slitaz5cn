# slitaz5cn
神雕定制slitaz中文版
  <br>Slitaz 是一个免费小巧的GNU/Linux发行版。它可以从光盘或USB设备加载，完整地在内存中运行，也可以安装到硬盘中。
  <br>Slitaz以LiveCD的形式 发布，您可以把它刻录到光盘，并从光盘启动。系统运行之后，您可以拿出光盘CD，用光驱来进行其他工作。
  <br>LiveCD提供一个特色十足的、图形界面的发行 版，可以保存您的数据和个人设置到其他设备中。
  <br>这个系统可以通过Tazpkg软件包管理器添加软件来增加各种各样的功能，也可以用它升级系统来保持系统最 安全、最新.
# 使用
<br>1. 根据官方每周固件进行中文定制。
<br>2. 管理账号root密码root，用户账号tux密码为空
<br>3. 启动和安装
    <br>可以使用各种引导开机，grub2,syslinux,UEFI等。
    <br>可以安装到usb磁盘，也可以网络pxe启动。
    <br>启动代码请使用：
    <br>【 linux /boot/bzImage initrd=/boot/rootfs.gz root=/dev/null video=-32 lang=zh_CN kmap=us TZ=Asia/Shanghai autologin 】
<br>4. 内置中文输入法，支持拼音，五笔等，ctrl+空格切换开关，shift切换中英文输入。
<br>5. 内置神雕的国内软件源地址，自动从国内源下载和更新软件包。
<br>6. 国内源镜像http://ecoo.top:8083/dl/slitaz/slitaz-rolling-core64-cn.iso
<br>7. 增加sudo加权功能，在命令前sudo即可使用管理权限。
<br>8. 增加著名的诺顿精灵GHOST。可用于系统备份维护。
<br>9. 内置gpartd磁盘分区格式程序，可用于电脑硬件维护。
<br>10. 内置tazpanel，可查看系统硬件环境，软件环境，启动参数等。
<br>11. 内置5000多个软件安装包的在线安装程序，可以自由安装。
<br>
<br>
<br>

