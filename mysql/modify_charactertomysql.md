# modify character

**must alter file to my.ini not in my-default.ini**

If you add in my-default.ini, change not be excuted

## configuration
```shell
[client]
default-character-set=utf8
loose-default-character-set = utf8

[mysqld]
character_set_server=utf8
collation-server=utf8_general_ci
loose-default-character-set = utf8

basedir = E:\mysql-5.6.24-win32
datadir = E:\mysql-5.6.24-win32\data
port =  3306

sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
# sql_mode must add after [mysqld]
```
