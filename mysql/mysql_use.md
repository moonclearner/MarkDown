# mysql
## install by zip
- add env to path
- change my-default.ini
    - database
    - data
- mysqld -install by administrator
- net start mysql

## change root password
- mysql -u root -p <CR>
- \>use mysql
- upadte user set password=PASSWORD("change_password") where user="root";
- flush privileges
- exit
- mysql -u root -p
- input new password

## create user
- mysql -u root -p <CR>
- \>use mysql
- insert into user(Host, User, Password)
    values("localhost","newuser",PASSWORD("newpassword"));
- flush privileges
- exit
- mysql -u newuser -p
- input newpassword

## auth user for DB
- log by root
- create database testDB
- grant all privileges on testDB.* to username@localhost identified by
    'userpassword';
- flush privileges
### auth few privileges to user
- grant select, update on testDB,* to username@localhost identified by
    'userpassword';
### auto few privileges DB to user
- grant select, update create, drop on \*.\* to username...

## delete user
- log by root
- Delete From mysql.user where user='user' and Host='localhost';
- flush privileges
## delete DB and table
- drop database testDB
- drop table tablename
## delete user auth
drop user username@localhost;

## show
show database;
use 'databasename';
show tables;
describe tablename;
## question
### one
ERROR 1045(28000):Access denied for user
#### solution
change your account PASSWORD
- mysql -u root -p
- use mysql
- upadte user set password=PASSWORD("change_password") where user="youruse";

### two
set password must be use PASSWORD("start by char not num")
