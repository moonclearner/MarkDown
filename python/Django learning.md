# Django learning

## install

- downloading github zip
- upzip and cmd: python setup.py install

## run

- django-admin startproject websitename
- cd mange.py   and  cmd:python mange.py runserver

## project_file

### mange.py

用于管理项目 如：创建数据库，运行服务器

他有很多子命令  python mange.py  可以看到他的子命令：runserver，migrate，makenigrations，shell

### settings.py

整个网站的配置都在这里

### url.py

映射配置文件，url configuration 用于多个页面跳转

### wsgi.py

django自带一个轻量级的服务器，要想通过其他服务器，则通过这个文件进行配置

## APP

django使用应用来分割功能，比如每个板块都是一个应用

优点：复用，功能隔离

### 创建应用

`python mange.py startapp app-name  or django-admin.py startapp app-name`

### 同步数据库

`python manage.py syncdb`

`注意：Django 1.7.1 and  version + need command following`

`python mange.py makemigrations`

`python mange.py migrate`

这种方法可以创建表，当你在models.py中新增了类时，运行它就可以自动在数据库中创建表了，不用手动创建。

备注：对已有的 models 进行修改，Django 1.7之前的版本的Django都是无法自动更改表结构的，不过有第三方工具 south,详见 Django 数据库迁移

### 使用开发服务器

开发服务器，即开发时使用，一般修改代码后会自动重启，方便调试和开发，但是由于性能问题，建议只用来测试，不要用在生产环境。

`python manage.py runserver`

`# 当提示端口被占用的时候，可以用其它端口：`

`python manage.py runserver 8001`

`python manage.py runserver 9999`

`（当然也可以``kill``掉占用端口的进程）`

`# 监听所有可用 ip （电脑可能有一个或多个内网ip，一个或多个外网ip，即有多个ip地址）`

`python manage.py runserver 0.0.0.0:8000`

`# 如果是外网或者局域网电脑上可以用其它电脑查看开发服务器`

`# 访问对应的 ip加端口，比如 http://172.16.20.2:8000`

### 清空数据库

`python manage.py flush`

clear database and leave empty data table 

### 创建超级管理员

`python manage.py createsupperuser`

`# 按照提示输入用户名和对应的密码就好了邮箱可以留空，用户名和密码必填`

 

`# 修改 用户密码可以用：`

`python manage.py changepassword username`

### 导出书记 导入数据

`python manage.py dumpdata appname > appname.json`

`python manage.py loaddata appname.json`

### Django项目环境终端

`python manage,py shell`

如果你安装了 bpython 或 ipython 会自动用它们的界面，推荐安装 bpython。

这个命令和 直接运行 python 或 bpython 进入 shell 的区别是：你可以在这个 shell 里面调用当前项目的 models.py 中的 API，对于操作数据，还有一些小测试非常方便。

### 数据库命令行

`python manage.py dbshell`

Django 会自动进入在setting.py中设置的数据库，如果是MySQL或postgreSQL，会要求输入数据库用户密码

在这个终端可以执行数据库的SQL语句。如果您对SQL比较熟悉，可能喜欢这种方式。

### 更多命令

`在终端输入 python manage.py 可以看到详细的列表，在忘记子名称的时候特别有用。



## tips

### tree

tree命令 可以遍历文件夹的文件，并用树的形式显示

在windows使用win10 powershell  tree /f 显示所有的文件

### BSD