# vagrant

# install
- install vitualBox
- install vagrant
- download boxfile

# create
- vagrant -v
  查看版本
- vagrant box add \[box name\] \[box file/remote mirror\]
  - 添加 box 到 vagrant，或者下载 box 给 vagrant
  - vagrant box add --name box_name /path/of/box/file.box
- vagrant box -list |grep
  查看添加的 box name， 后面可以使用 grep
- vagrant box remove \[box name\]
  移除 box
- vagrant box outdated
  检测 box 是否需要升级
- vagrant box update
  进入工作目录，box 升级，更新的结果并不是替换旧版本，而是新增加一个 box 镜像，list 就会显示多个版本的 box
- vagrant box outdated --global
    检查本地仓库中的所有镜像是否有升级，使用 --global 开关，这时候不需要进入工作目录
- vagrant box update --box coreos-alpha
    不进入工作目录进行升级
# run
- vagrant init boxname
  初始化 Vagrant 工程，创建 vagrantfile
  vagrant init ubuntu/trusty64
  vagrant init my-box https://boxes.company.com/my.box
- vagrant up or vagrant up [vm-name]
  启动所有的虚拟机，如果只有一个虚拟机就启动当前虚拟机，省略 vm-name，则依次启动所有 vm
- vagrant up --provider hyperv
  在默认情况下，Virtualbox 将作为 provider，当然你也可以使用其他 provider，比如以下命令将启动一个 hyperv 虚拟机
- vagrant reload [vm-name]
  重启
- vagrant halt [vm-name]
  关机
- vagrant destory [vm-name]
  销毁虚拟机
- vagrant ssh [vm-name]
  ssh 登录虚拟机，或者显示 ssh 登录虚拟机的 ip 和 port
- vagrant suspend
  休眠
- vagrant resume
  唤醒
- vagrant status
  查看虚拟机运行状态
- vagrant package
  对虚拟机进行打包
# snapshot
如果 vm 中有任务没有跑完，需要关闭 virtual box，就可以给 vm 做一个快照，保存 vm 当前所有的状态，在 virtualbox 重新启动后，再回复快照

- vagrant snapshot list
  显示当前保存的快照
- vagrant snapshot save shotname
  创建 shotname 快照
- vagrant snapshot restore shotname
  恢复快照；如果不删除，会一直保存
- vagrant snapshot delete shotname
  删除

# root
刚刚进入的时候一般的 box 都没有 root 密码
- sudo passwd root
  即可设置 root 密码

# ssh
vagrant ssh
可以显示出 ip port host 以及 private key 地址


