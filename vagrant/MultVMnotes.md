# 多台服务器配置

## 包含一个 WEB、两个 APP、一个 DB 等多个虚拟机的配置文件
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

app_servers = {
    :app1 => '192.168.58.20',
    :app2 => '192.168.58.21'
}

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu"

    config.vm.define :web do |web_config|
        web_config.vm.network :private_network, ip: "192.168.58.10"
        web_config.vm.network :forwarded_port, guest: 80, host: 8080
        config.vm.provider :virtualbox do |vb|
            vb.name = "web"
        end
    end

    app_servers.each do |app_server_name, app_server_ip|
        config.vm.define app_server_name do |app_config|
            app_config.vm.hostname = "#{app_server_name.to_s}.vagrant.internal"
            app_config.vm.network :private_network, ip: app_server_ip
            app_config.vm.synced_folder "../app", "/opt/app"
            app_config.vm.provider "virtualbox" do |vb|
                vb.name = app_server_name.to_s
            end
        end
    end

    config.vm.define :db do |db_config|
        db_config.vm.hostname = "db.vagrant.internal"
        db_config.vm.network :private_network, ip: "192.168.58.30"
        db_config.vm.provider "virtualbox" do |vb|
            vb.name = "db"
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
    end
end
```
## 搭建一个 mfs 的测试环境，一台服务器做 mfsmaster，两台服务器做 mfs chunk server，一台服务器做 metalogger，服务器做 mfs client 进行测试
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

app_servers = {
    :mfschunk1 => '192.168.33.20',
    :mfschunk2 => '192.168.33.21'
}

Vagrant.configure("2") do |config|
    config.vm.box = "centos64"

    config.vm.define :mfsmaster do |mfsmaster_config|
        mfsmaster_config.vm.network :private_network, ip: "192.168.33.10"
        config.vm.provider :virtualbox do |vb|
            vb.name = "mfsmaster"
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            vb.customize ["modifyvm", :id, "--cpus", "2"]
            vb.cpus = 2
        end
    end

    app_servers.each do |app_server_name, app_server_ip|
        config.vm.define app_server_name do |app_config|
            app_config.vm.hostname = "#{app_server_name.to_s}.vagrant.internal"
            app_config.vm.network :private_network, ip: app_server_ip
            app_config.vm.provider "virtualbox" do |vb|
                vb.name = app_server_name.to_s
            end
        end
    end

    config.vm.define :metalogger do |metalogger_config|
        metalogger_config.vm.hostname = "metalogger.vagrant.internal"
        metalogger_config.vm.network :private_network, ip: "192.168.33.30"
        metalogger_config.vm.provider "virtualbox" do |vb|
            vb.name = "metalogger"
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            vb.customize ["modifyvm", :id, "--cpus", "2"]
            vb.cpus = 2
        end
    end

    config.vm.define :mfsclient do |mfsclient_config|
        mfsclient_config.vm.hostname = "mfsclient.vagrant.internal"
        mfsclient_config.vm.network :private_network, ip: "192.168.33.40"
        mfsclient_config.vm.provider "virtualbox" do |vb|
            vb.name = "mfsclient"
        end
    end
end
```


