#python virtualenv
python 使用 virtualenv 在 windows 上实现 python2 与 python3 共同使用

##features

##install
- 在 windows 已经安装了 python2 and python3
- windows 配置的是 python2 的环境变量
- 在 python3 的 /scripts 下 运行 pip install virtualenv
- 即可为 python3 创建一个虚拟的 py3 环境

##usage
- /scripts 下 virtualtenv envfilename

virtualenv 环境名称『自定义的名称，自己喜欢什么就写什么』

默认情况下，虚拟环境会依赖系统环境中的 site packages
就是说系统中已经安装好的第三方 package 也会安装在虚拟环境中，

如果不想依赖这些 package，那么可以加上参数
--no-site-packages　

`virtualtenv envfilename --no-site-packages`

##启动虚拟环境

- 进入新建的虚拟环境路径
- >Scripts\activate

##关闭虚拟环境

`deactivate`

# Virtualenvwrapper
## install Virtualenvwrapper
用于管理建立的虚拟环境
pip install virtualenvwrapper-win

## configuration
D:\VirtualEnv

go to configure path
create variables WORKON_HOME and value D:\VirtualEnv

## confirm configure ok
cmd$: echo %WORKON_HOME%

## usage
- show all env
	lsvirtualenv
- create env and activate save into %WORKON_HOME% path
	mkvirtualenv myenv
- delete env
	rmvirtualenv myenv
- switch environment
    workon env-name
- leave env
	deactivate
