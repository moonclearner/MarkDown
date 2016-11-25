
#mysql autocommit setting and mysql engines

mysql默认开启auto commit，可以，通过这几个sql查看：

```shell
select @@autocommit;

SHOW VARIABLES LIKE '%AUTOCOMMIT%';

SHOW GLOBAL STATUS LIKE '%AUTOCOMMIT%'; 
```

我们可以通过系统变量控制来动态控制session级别autocommit

(set autocommit = 0|1)，session级别的用处不大，全局禁用才好。

如何从全局禁用autocommit呢，大多数时候我们不想让mysql自动提交，用程序代码来控制，比如spring的声明式事务。

mysql有一个Cmd-Line&Option file&System Var可以帮助我们实现这样的功能，它就是init_connect。

一个比较好用的设置方法是在mysql的初始化文件my.int里加多一行设置。如我的my.int文件路径是：D:\Program Files\MySQL\MySQL Server 5.1\my.int，打开这个文件，在[mysqld]下面加多一行：init_connect=’SET autocommit=0′，如：

[mysqld]

#这个对拥有root权限的用户无效
init_connect='SET autocommit=0'

The TCP/IP Port the MySQL Server will listen on

port=3306

 

但是，这个参数的设置对拥有super权限的用户是无效的，用官方的具体说明如下：

Note that the content of init_connect is not executed for users that have the SUPER privilege. This is done so that an erroneous value for init_connect does not prevent all clients from connecting. For example, the value might contain a statement that has a syntax error, thus causing client connections to fail. Not executing init_connect for users that have the SUPER privilege enables them to open a connection and fix the init_connect value.

估计是mysql的一个bug．

 

另外：mysql默认的存储引擎是InnoDB，支持事务操作。

 

一般情况下，mysql会默认提供多种存储引擎,你可以通过下面的查看:

看你的mysql现在已提供什么存储引擎:
mysql> show engines;

看你的mysql当前默认的存储引擎:
mysql> show variables like '%storage_engine%';

你要看某个表用了什么引擎(在显示结果里参数engine后面的就表示该表当前用的存储引擎):
mysql>show databases;
mysql>use 数据库名；
mysql>show tables；
mysql> show create table 表名; //查看数据库的引擎

### 更改数据库的引擎
alter table table_name engine=innodb; 
alter table table_name engine=myisam;  


### 查看数据库内所有表的状态
mysql>show table status from databases_name
因为得到的横坐标很多，需要进行筛选

### auto_increment自动填充数字的操作