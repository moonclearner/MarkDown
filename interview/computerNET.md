## common port
无论 TCP 还是 UDP
- FTP 20 21
- SSH 22
- telent 23
- DNS 53
- http 80
- SMTP 25
- POP3 110


## command
- route
	设置网关
- telnet
	探测对方 ip 的端口是否开启
- traceroute
	利用 icmp
	测试路径
- wget
	下载程序
- tcpdump
	抓包命令
	tcpdump -i eth0 -nnX port 21

## ssh
- ssh
- scp
	download
	-r user@ip:filepath localpath
	upload
	-r localfile user@ip:uploadpath

