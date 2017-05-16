# package BOX

```bash
vagrant package -hUsage: vagrant package [options] [name]Options:
        --base NAME                  virtualbox 程序里面的虚拟机的名称，不是 box 的名字也不是 Vagrantfile 里面的虚拟机名称。默认是打包当前目录下面的虚拟机。
        --output NAME                要打包成的 box 名称，不会自动添加.box 后缀，要手动加。默认值 package.box        --include FILE...            打包时包含的文件名，你可以把.box 文件理解为一个压缩包
        --vagrantfile FILE           打包时包含的 Vagrantfile 文件，原理和上面类似
    -h, --help                       Print this help

```
## example
- cd yourboxpath
- vagrant package --output yourPackageBoxName
- wait
