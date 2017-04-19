# vagrant Plugin
Vagrant Berkshelf, Vagrant Hostmanager, 和 Vagrant Omnibus.

- Vagrant Berkshelf 插件可以实现和 Berkshelf cookbook manager 的通信。

- Vagrant Hostmanager 插件可以自动更新绑定 IP 的配置文件。我个人很喜欢这个插件，它使得开发过程更清晰 ，URL 像是 “http://myproject.local” 比直接使用 IP“172.22.22.22″ 好得多。

- Vagrant Omnibus 插件检查 Chef 安装版本是否匹配。本例中没用到这个插件，但在排查 Chef 相关问题时，这个插件非常有用。我相信有天这个功能会被直接添加到 Vagrant 核心模块里。

## install
```
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest
```
