# vagrantfile

# title
## box 设置
config.vm.box = "ubuntu12.04"

## hostname
config.vm.hostname = "mycomputer"



# network
## port switch
- config.vm.network "forwarded_port", guest:80, host:8080
forwarded_port，端口转发，就是你可以设置主机与虚拟机之间的端口的映射关系，这样请求主机上的这个端口，就会把请求转发到虚拟机上的对应的端口上。
比如，你想在访问主机 8080 端口时候，转发到虚拟机上的 80 端口

## public network
- config.vm.network "public_network"
启动之后就可以进行选择网络

如果 Host 机器有多张网卡，此时运行 vagrant up， Vagrant 会询问需要使用那张网卡连接到网络，如果不想要这种交互，则可以在 Vagrantfile 中进行配置
```
config.vm.network "public_network", bridge: [
  "en1: Wi-Fi (AirPort)",
]
```

除了 DHCP，也可以使用静态 IP：
```
Vagrant.configure("2") do |config|
  config.vm.network "public_network", ip: "192.168.0.5"
end
```

## private network
config.vm.network "private_network", ip: "192.168.33.10"
这里的 private_network 就是配置私有网络用的，注意后面手工指定了这台虚拟机在这个私有网络上的 IP 地址，默认是 192.168.33.10 ，你可以修改成任何的为私有网络保留的地址段里的 IP 地址，不过不能使用跟电脑内网一样的地址段，比如我的路由器上设置的内网的 IP 地址段是 192.168.1.x ，这样为这个虚拟机配置私有网络地址的时候，就不能用 192.168.1.x 这个地址段上的 IP 地址。
config.vm.network "private_network", type: "dhcp"
dhcp 模式也行

# share file
Vagrant.configure("2") do |config|
  config.vm.synced_folder "D:\\share", "/home\share"
end
D:\share 是主机的文件夹 共享为 /home/share

# memory and cpu
```
 config.vm.provider "virtualbox" do |vb|
# Display the VirtualBox GUI when booting the machine
vb.gui = true
# Customize the amount of memory on the VM:
vb.memory = "1024"
vb.cpus = 2
vb.name = "my_vm"
end
```

# warning
##　使用 Apache/Nginx 时会出现诸如图片修改后但页面刷新仍然是旧文件的情况，是由于静态文件缓存造成的。需要对虚拟机里的 Apache/Nginx 配置文件进行修改：
```
# Apache 配置添加：
EnableSendfile off
# Nginx 配置添加：
sendfile off;
```
## Vagrant 内的站点访问速度慢
- 使用 NFS !important
- 使用 CPU 多核心，加点内存
- 打包保存自己的 BOX，备用
- 域名解析问题？

## nfs 权限问题
```
config.vm.synced_folder '.', '/vagrant', :nfs =>{
:linux__nfs_options => ["no_root_squash"],
:map_uid => 0,
:map_gid => 0
}
```

## 域名解析慢的问题
```
config.vm.provider :virtualbox do |vb|
#vb.gui = true
vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
end
```

## 挂载失败的问题
//sudo apt-get install virtualbox-guest-dkms
sudo apt-get install virtualbox-guest-utils

## redis 文件权限问题
把 redis:redis 用户组设置更改为 vagrant:vagrant.
