# PostgreSql
## install
- download->upzip
- set env
### environment(windows)
set PGHOME=D:\server\psql
set PGDATA=%PGHOME%\data
set PGLIB=%PGHOME%\lib
set PGHOST=localhost
set PATH=%PGHOME%\bin;

### create data in root dir
like e:\pgsql\data

### init
```shell
cd E:\pgsql\bin
initdb.exe
pg_ctl.exe start
ceatedb.exe username
	每个用户都有需要一个对应名称的数据库
```
## reinstall
```
卸载 8.3 时提示没有卸载完全，安装 9.0 之后不能开启服务，安装过程显示没有完全安装....
services.msc 检测没有发现 postgresql9.0 服务，netstat -an 检测 5432 端口未开............

重新初始化数据库即可
C:/postgreSQL
②　设置环境变量
C:> set PGHOME=C:/postgreSQL
C:> set PGDATA=%PGHOME%/data
C:> set PGLIB=%PGHOME%/lib
C:> set PGHOST=localhost
C:> set PATH=%PGHOME%/bin;%PATH%

③　initdb 初始化 数据库。
④　pg_ctl start 启动数据库
⑤　pg_ctl stop 停止数据库
⑥　post_svc -install 建立 windows nt 服务
⑦　post_svc -remove 删除 windows nt 服务
⑧　使用"createdb 库名" 新建数据库
⑨　使用"createuser 用户名"创建数据库帐号
⑩　使用"psql -h localhost -d 库名 - U 用户名"进入数据库
```

## question
### one
pgsql 无法联接到服务器 connection refused(127.0.0.1)
**solution:**net start pgsql
### two
psql: FATAL: role “postgres” does not exist
**solution:**
- cd pgsql/\bin
- createuser -s postgres
- createdb postgresql -U postgresql
	- 创建 postgres 数据库给用户 postgres

