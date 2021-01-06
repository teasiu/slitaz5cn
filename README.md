# slitaz5cn
神雕定制slitaz中文版
  <br>Slitaz 是一个免费小巧的GNU/Linux发行版。它可以从光盘或USB设备加载，完整地在内存中运行，也可以安装到硬盘中。
  <br>Slitaz以LiveCD的形式 发布，您可以把它刻录到光盘，并从光盘启动。你也可以将它与其它例如win-pe🈴盘。
  <br>LiveCD提供一个特色十足的、图形界面的发行 版，可以保存您的数据和个人设置到其他设备中。
  <br>这个系统可以通过Tazpkg软件包管理器添加软件来增加各种各样的功能，也可以用它升级系统来保持系统最 安全、最新.
# 使用
<br>请仔细阅读下面这段定制说明。
<br>
<br>1. 根据官方每周固件进行中文定制。最新版本silitaz5.0-rolling-core64-chinese.iso
<br>如果你的电脑内存超过4G，请使用64位。低于4G，请使用32位(32位无法识别超过4G的内存)。
<br>
<br>2. 管理账号root密码root,用户账号tux密码为tux
<br>
<br>3. 启动和安装
<br>支持各种引导开机,grub4dos，grub2，syslinux，支持efi启动。
<br>可以安装到U盘随身启动，也可以和其他pe合盘。
<br>可以安装到硬盘也可以网络pxe启动。
<br>启动代码请自行在你的启动菜单添加使用:
<br>【  root=/dev/null video=-32 lang=zh_CN kmap=us tz=Asia/Shanghai autologin 】
<br>
<br>4. 内置中文输入法,支持拼音,五笔等,ctrl+空格切换开关,shift切换中英文输入。
<br>
<br>5. 内置神雕的国内软件源地址,自动从国内源下载和更新软件包。
<br>
<br>6. 国内源镜像http://ecoo.top:8083/dl/slitaz/iso/rolling
<br>
<br>7. 增加sudo加权功能,在命令前sudo即可使用管理权限。
<br>
<br>8. 增加著名的诺顿精灵GHOST。可用于系统备份维护。
<br>
<br>9. 内置gpartd磁盘分区格式程序,可用于电脑硬件维护。
<br>
<br>10. 内置tazpanel,可查看系统硬件环境,软件环境,启动参数等。
<br>
<br>11. 内置5000多个软件安装包的在线安装程序,可以自由安装。
<br>
<br>12. 已添加虚拟机桌面驱动,可以在虚拟机中显示桌面。
<br>
<br>13. 已添加ssh启动,可远程ssh登陆。(dropbear)
<br>远程登录账号tux密码tux，登陆后sudo可提权。
<br>
<br>14. 已添加gftp软件。另外,自带的busybox的ftpput和ftpget命令也集成。
<br>
<br>15. 集成了transmission BT远程下载并安装最新web-ctrl,远程登陆账号tux密码tux。
<br>
<br>16. 集成vlmcsd最新版的KMS服务器,远程激活windows。
<br>
<br>17. 集成samba3.6版网络文件共享服务
<br>终端输入/etc/init.d/samba start 即可启动
<br>启动后常驻进程，需要关闭后才能关机或重启。
<br>终端输入/etc/init.d/samba stop 关闭
<br>
<br>支持挂载openwrt和synology群晖网络存储空间，
<br>sudo mount.cifs //192.168.1.1/usb /mnt/ -o vers=2.0
<br>sudo mount.cifs -o username=admin,password=passwd,
<br>rw,forceuid=nobody,forcegid=nogroup,dir_mode=0777,file_mode=0777,vers=2.0
<br>//192.168.111.2/volume1/files /mnt
<br>
<br>18. 内置fbinst软件,可使用命令行各种骚操作。
<br>
<br>19. 编译定制了专用火狐浏览器中文版，支持online自动安装。
<br>火狐浏览器界面中文输入法需要用普通用户文档转换。
<br>
<br>20. 修复了解压缩软件并添加了中文。修复 rar && unrar
<br>
<br>21. 内置git-server服务器，让你随时随地白嫖免费的高速上传下载空间。
<br>作为一个系统玩家，这个特别实用哦。
<br>详见内置文档<a href="#git">白嫖5GB仓库指南使用教程</a>。
<br>
<br>22. 添加了安装到硬盘的脚本，支持一键安装slitaz系统到本地硬盘。
<br>安装到硬盘后，请将/etc/init.d/system.sh最后某行
<br>echo "tux:tux" | chpasswd删除。便以你修改登录密码生效。
<br>
<br>23. 即将定制花生壳内网版，让你随地随处启动即可远程管理设备。
<br>
<br>项目下载地址更新为(三处同步更新):
<br>https://github.com/teasiu/slitaz5cn
<br>https://sourceforge.net/projects/slitaz/
<br>http://ecoo.top:8083/dl/slitaz （推荐）

<br>
<br>

