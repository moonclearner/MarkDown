# SSH
修改 ssh 的默认的 2222 和 ip 地址

config.vm.network "private_network", ip: "192.168.33.4"
config.vm.network :forwarded_port, guest: 22, host: 2233, id: 'ssh', host_ip: "localhost", guest_ip: "192.168.33.4"
