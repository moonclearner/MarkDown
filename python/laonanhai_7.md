# snmp
mib browser 可以看到SNMP api  开源的浏览器  可以看到mib值
进行简单的网络设备信息获取

[参考文献]()
# install snmp
- sudo apt-get install snmpd snmp snmp-mibs-downloader
- sudo download-mibs

# backup conf file
ubuntu@linuxidc:~$ cd /etc/snmp

ubuntu@linuxidc:/etc/snmp$ sudo cp snmpd.conf snmpd.conf.ori

ubuntu@linuxidc:/etc/snmp$ ls snmpd*

snmpd.conf  snmpd.conf.ori

# using
snmpwalk -v 2c -c public localhost .1.3.6.1.4.1.2021.4.3.0
返回交换空间


# Redis
数据监控
主动监控 和 被动监控 混合监控

# 软件设计模式
松耦合模式 而非阻塞模式

# nosql 
存在缓存中的数据库

# Redis
- install redis-server
- initiate: $redis-server

启动后，数据库存在内存里面，只要停止之后，数据就会丢失，
则必须进行持久化，save之后才会存在磁盘。

- $ redis-cli 进入交互命令

# redis 简单实用

- set
set key value  ex 5  存入key：value 超时时间是5秒
get key

- list
ipush listname value1 value2 存入value值
lrange list 0 3  取值 0-3

redis 具有订阅功能
只要发布消息，所有的客户端都可以收到消息


