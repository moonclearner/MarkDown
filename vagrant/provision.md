# vagrant provision
当 vagrant 已经运行之后，需要修改 vagrantfile 使之生效
- vagrant reload --provision

# provision 任务
Provision 即通过使用某些工具自动地、批量地为机器安装软件以及配置系统，它省去了人工安装和配置系统时的重复性和易错性，当然还享受了计算机与生俱来的速度。Vagrant 提供多种方式对虚拟机进行 Provision，包括 Shell、Chef、Puppet 和 Ansible 等。以 Shell 为例，既可以通过直接在 Vagrantfile 中编写 Shell 脚本的方式，也可以通过引用外部 Shell 文件的方式。
```
config.vm.provision command json

config.vm.provision command do |s|
	s.paraname = paravalue
end
```

## 直接在 Vagrantfile 中编写 Shell 脚本，可以通过“inline”指定脚本内容：
```
Vagrant.configure("2") do |config|
  # ... other configuration

  config.vm.provision "shell", inline: "echo hello"
end
```


## 通过引用外部脚本文件的方式：
```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "script.sh"
end
```

在使用 Ansible 时，有两种方式：
- 在 Host 机器上安装 Ansible
- 采用 Ansible Local 的方式，即在虚拟机自身上安装 Ansible
	对于第（1）种方法，我们需要保证 Host 机器上已经安装了 Ansible，然后进行配置：

```
Vagrant.configure("2") do |config|

  #
  # Run Ansible from the Vagrant Host
  #
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
```
在使用第（2）种方法时，Vagrant 会首先检查 box 中是否已经安装了 Ansible，如果没有，则会自动安装到虚拟机上，然后再运行 provision：
```
Vagrant.configure("2") do |config|
  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```
当我们多次执行“vagrant up”启动虚拟机时，provison 并不会每次都执行，只有在这三种情况下 provision 才会运行：

- 首次执行 vagrant up
- 执行 vagrant provision
- 执行 vagrant reload --provision

当然，你也可以在 Vagrantfile 中配置成每次执行 vagrant up 时都运行 provision：

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo hello",
    run: "always"
end
```
