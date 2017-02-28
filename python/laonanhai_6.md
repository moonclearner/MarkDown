# 

## Paramiko ssh 模块
批量进行ssh 并发操作

ssh  认证的过程是加密的
ssh  相互通信的内容是明文
公钥和私钥是锁和钥匙的关系 加密和解密的关系

## 使用公钥和私钥进行连接

- `ssh-keygen` 生成一对公钥和私钥
- 将id-rsa.pub 公钥发送到你想ssh连接的地方
- 公钥发送代码 `ssh-copy-id djj@192.168.204.128` 
- 之后再使用 ssh djj@192.168.204.128 不需要输入密码

# ubuntu install Paramiko 
- sudo apt-get install python-dev
- sudo apt-get install libssl-dev
- pip install Paramiko

# ubuntu dpkg 
- dpkg -l  显示所有安装的软件
- dpkg -l|grep
- dpkg -P deletename  卸载软件

# 审计
- 堡垒机模式，用于保护账号
- web ssh shellinbox
- 齐治 壁垒机的旗舰

# 多进程与多线程
t.join()
等待t线程完成，是一个阻塞的过程,作用是确定所有的线程完成之后在运行下面的操作

进程之间的通信  from multiprocess import manger
