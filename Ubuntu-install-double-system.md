gesc启动
配置引导系统


1）首先还是分区，在计算机上右键--管理--磁盘管理
装Ubuntu分配的硬盘大小最好是(20G以上）不要太小，这里请注意，ubuntu和windows文件系统完全不同，所以我们划好要给ubuntu的分区后，删除卷。到时候，安装好的ubuntu的分区，在windows下是看不到的，但是进入ubuntu是可以访问windows的磁盘的。这才叫双系统的吧，和wubi那种不一样哦。
2）准备两个东西EasyBCD软件和iso镜像(我用的easybcd是2.1版，就下载1.7之后版就行，要那种安装版的，不要绿色版)
3）下面打开EasyBCD软件，可以看到现在我们的计算机只有一个启动“入口”，
我们来给他加一个，选择Add Entries（添加移动入口点），
选NeoGrub 然后点Install NeoGrub点Save ，接着是Configure，
然后就会出现一个menu.lst文件
我们要编辑这个文件 因为系统就是这个文件找到我们的ubuntu的。
把下面的 英文 复制进去，把原来的全覆盖掉
title Install Ubuntu
root (hd0,0)
kernel (hd0,0)/vmlinuz boot=casper iso-scan/filename=/ubuntu-11.10-i386.iso ro quiet splash locale=zh_CN.UTF-8
initrd (hd0,0)/initrd.lz
特别注意:
ubuntu-11.10-i386.iso是你的iso的名字，别写成我的了，这个要改成你的。
对于有的电脑上你的第一个盘符并不是C盘，在磁盘管理中可以看出，所以安装时需将(hd0,0)改为（hd0,1）【假设为第二个】。
关闭 保存。
接下来：把准备好的iso用压缩软件或者虚拟光驱打开，找到casper文件夹，复制initrd.lz和vmlinuz到C盘,然后在把iso也拷贝到C盘。
重启 你就会看到有2个 启动菜单给你选择 我们选择第2个 NeoGrub 这个
然后等待一段时间 就会见到我们 日思夜想的 ubuntu了。
默认 桌面有2个文档 一个是演示的不用管 我们选择 安装Ubuntu ，
记得在这之前 要按Ctrl+Alt+T 打开终端，输入代码:sudo umount -l /isodevice这一命令取消掉对光盘所在 驱动 器的挂载，否则分区界面找不到分区。
开始安装，



分区order
/boot  主分区 200
/swap 交换空间 same to your RAM
/home 逻辑
/usr 逻辑
/    主分区  不少于20G




为了快速而顺畅的更新，打开终端并输入以下命令来让系统使用新软件库：
$ sudo apt-get update
$ sudo apt-get upgrade

更新系统的命令




**注意：**
(1)在选择安装启动引导器的设备时，可以选择我们分好的 / 区，也可以新建一个/boot区。
(2)若重启就会发现原来 windows进不去了。
打开终端输入命令
sudo gedit /etc/default/grub
修改GRUB_TIMEOUT="10"
    然后在终端中输入sudo update-grub
    update 命令会自动找到 windows 7 启动项。并且自动更新 /boot/grub/grub.cfg 文件。这样重启就能进windows了。
(3)
最后进入Window7，打开EasyBCD删除安装时改的menu.lst文件，按Remove即可。
然后去我们的c盘 删除vmlinuz，initrd.lz和系统的iso文件。
利用EasyBCD可以更改启动项菜单按Edit Boot Menu按钮，可以选择将Windows7设为默认开机选项。



**Ubuntu系统安装后一定要进行系统升级，以避免使用ubuntu    software出现卡顿现象**













**安装pdnds服务器，本地服务器**
在ubuntu下用firefox等浏览器上网,往往比在windows下上网要慢好多,但细心的人会发现,慢的时间是花在DNS查找上面了。那么我们可以在本机缓存DNS,也就是在本机架设一个DNS代理服务器。常用的软件有bind、djbdns、dnsmasq和pdnsd。下面我们来说一下,用pdnsd来架设一个永久的DNS代理服务器,所谓“永久”,就是说,在系统重启以后,本机缓存的DNS仍然存在,不用再去查找真实DNS来重新建立缓存。

1、安装

sudo apt-get install pdnsd

安装的时候,它会问你选择什么配置,请选择“manual“。

2、配置pdnsd

sudo gedit /etc/pdnsd.conf

修改

server {

    label="resolvconf";

}

为

server {

    label="OpenDNS";

    ip=208.67.222.222;

    ip=208.67.220.220;

    timeout=30;

    interval=30;

    uptest=ping;

    ping_timeout=50;

    purge_cache=off;

}

label="OpenDNS";

其中“OpenDNS”可以随便写,一个标识而已,用于将来的诊断;

ip=208.67.222.222;

ip=208.67.220.220;

这两行也可以写成一行ip=208.67.222.222,208.67.220.220;代表真实的DNS服务器地址,可以有多个。

后面的参数采用默认就可以了。

sudo gedit /etc/default/pdnsd

修改START_DAEMON的值为yes。

3、向resolver添加DNS代理服务器

sudo gedit /etc/resolv.conf

在首行添加一句:nameserver 127.0.0.1

4、防止resolv.conf被覆盖

如果你启用了DHCP服务,那么要

sudo gedit /etc/dhcp3/dhclient.conf

去掉

#prepend domain-name-servers 127.0.0.1;

前面的“#“。

如果你是拨号上网,那么

sudo gedit /etc/ppp/peers/provider 

在 usepeerdns 前面增加# ,也就是把这条语句注释掉。 以防resolv.conf的设置被pppoe覆盖。

5、启动pdnsd

sudo /etc/init.d/pdnsd start

6、测试

dig www.baidu.com | grep time

结果显示:;; Query time: 1 msec

原来的结果:;; Query time: 845 msec