#python virtualenv 
python使用virtualenv在windows上实现python2与python3共同使用

##features

##install
- 在windows 已经安装了python2 and python3
- windows 配置的是python2的环境变量
- 在python3的/scripts下 运行pip install virtualenv 
- 即可为python3 创建一个虚拟的py3环境

##usage
- /scripts下 virtualtenv envfilename

virtualenv 环境名称[自定义的名称，自己喜欢什么就写什么]

默认情况下，虚拟环境会依赖系统环境中的site packages
就是说系统中已经安装好的第三方package也会安装在虚拟环境中，

如果不想依赖这些package，那么可以加上参数 
--no-site-packages　

`virtualtenv envfilename --no-site-packages`

##启动虚拟环境

- 进入新建的虚拟环境路径
- >Scripts\activate

##关闭虚拟环境

`deactivate`
