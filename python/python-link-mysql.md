# python 使用mysql

[python API](https://www.python.org/dev/peps/)

1. MySQL
2. Oracle
3. SQL Server

[DB API](https://www.python.org/dev/peps/pep-0249/)

procedure:
connection -> cusor ->  ...  ->close cusor -> close connection

## install python mysql connetor

win cmd 中输入 easy_install MySQL-python 或者 pip install MySQL-python
Linux      apt-get install python-dev 或者 yum install python-devel

**使用mysql的事件，mysql表的引擎必须是innodb**
查看表的引擎mysql>show create table table_name;
更改表的引擎mysql>alter table table_name engine = innodb;

## test link mysql
```python
import MySQLdb
print MySQLdb
#port=3306 一定不能加'' ，而passwd一定要加''
conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='123456',
    db='test',
)
cursor = conn.cursor()
cursor.close()
conn.close()
```

cursor对象支持的方法

execute()：查询和命令，select，update、insert、delete

fetchone()执行一次   则rownumber+1   初始值为0

rowcount获取所有的行数


## 事务异常的检查、提交和回滚

**事务：**

- 原子性
- 一致性
- 隔离性
- 持久性

**开发要确保对数据库的操作要保证其事务的特性**
关闭自动commit：设置conn.autocommit(False) 


***当需要提交对数据库的操作  这需要手动commmit***
正常结束事务：conn.commit()
异常结束事务：conn.rollback()

mysql> show variables like 'autocommit';
mysql> set autocommit = 0; 关闭自动提交

     事务处理机制在程序开发过程中有着非常重要的作用，它可以使整个系统更加安全，例如在银行处理转账业务时，如果A账户中的金额刚被发出，而B账户还没来得及接收就发生停电，这会给银行和个人带来很大的经济损失。采用事务处理机制，一旦在转账过程中发生意外，则程序将回滚，不做任何处理。
MYSQL的事务处理主要有两种方法

- 用begin,rollback,commit来实现

1. begin开始一个事务
2. rollback事务回滚
3. commit 事务确认

- 直接用set来改变mysql的自动提交模式

1. mysql默认是自动提交的，也就是你提交一个query，就直接执行！可以通过
2. set autocommit = 0 禁止自动提交
3. set autocommit = 1 开启自动提交

来实现事务的处理，但要注意当用set autocommit = 0 的时候，你以后所有的sql都将作为事务处理，直到你用commit确认或 rollback结束，注意当你结束这个事务的同时也开启了新的事务！按第一种方法只将当前的做为一个事务!

MYSQL只有 INNODB和BDB类型的数据表才支持事务处理，其他的类型是不支持的!

***rollback操作撤销上一个commit、rollback之后的事务。*** 

```python
   sql_insert = "insert into testpy(ID,Name) values(155,'Name5') "
    sql_update = "update testpy set Name='bb' where ID=1"
    sql_delete = "delete from testpy where IDD = 3"

    try:
        cursor.execute(sql_insert)
        print cursor.rowcount
        cursor.execute(sql_update)
        print cursor.rowcount
        cursor.execute(sql_delete)
        print cursor.rowcount
    except Exception as e:
        print e
        conn.rollback()
```


conn.rollback即会回滚commit的所有数据
如果mysql设置为自动提交则不会回滚


##银行交易系统
数据库引擎不能设置为MyASIM
因为MyASIM不支持事务

使用innodb

```python
# coding:utf8
import sys
import MySQLdb


class TransferMoney(object):
    """docstring for TransferMoney"""

    def __init__(self, conn):
        self.conn = conn

    def check_acct_available(self, acctid):
        cursor = self.conn.cursor()
        try:
            sql = "select * from testpy where account = '%s'" % acctid
            cursor.execute(sql)
            print "check_acct_available:" + sql
            rs = cursor.fetchall()
            if len(rs) != 1:
                raise Exception(" %s not exsit" % acctid )
        finally:
            cursor.close()

    def show_data(self):
        cursor = self.conn.cursor()
        try:
            sql = "select * from testpy where account = 'djj'"
            cursor.execute(sql)
            print "check_acct_available:" + sql
            rs = cursor.fetchall()
            print rs
        finally:
            cursor.close()

    def has_enough_money(self, acctid, money):
        cursor = self.conn.cursor()
        sql = "select * from testpy where account = '%s' and money >%s" % (
            acctid, money)
        try:
            cursor.execute(sql)
            print "check_acct_available:" + sql
            rs = cursor.fetchall()
            if len(rs) != 1:
                raise Exception(" %s account not has enough money" % acctid)
        finally:
            cursor.close()

    def reduce_money(self, acctid, money):
        cursor = self.conn.cursor()
        sql = "update testpy set money = money-%s where account = '%s'" % (
            money, acctid)
        try:
            cursor.execute(sql)
            print "reduce_money:" + sql
            if cursor.rowcount != 1:
                raise Exception(" %s account reduce money error" % acctid )
        finally:
            cursor.close()

    def add_money(self, acctid, money):
        cursor = self.conn.cursor()
        sql = "update testpy set money = money+%s where account = '%s'" % (
            money, acctid)
        try:
            cursor.execute(sql)
            print "add_money:" + sql
            if cursor.rowcount != 1:
                raise Exception(" %s account add money error" % acctid )
        finally:
            cursor.close()

    def transfer(self, source_acctid, target_acctid, money):
        try:
            self.check_acct_available(source_acctid)
            self.check_acct_available(target_acctid)
            self.has_enough_money(source_acctid, money)
            self.reduce_money(source_acctid, money)
            self.add_money(target_acctid,money)
            self.conn.commit()
            # print "transfer success"
        except Exception, e:
            self.conn.rollback()
            raise e

# 脚本执行入口
if __name__ == '__main__':
    # source_acctid = sys.argv[1]
    # target_acctid = sys.argv[2]
    # money = sys.argv[3]
    source_acctid = 'djj'
    target_acctid = 'dh'
    money = 100
    conn = MySQLdb.Connect(host='localhost',
                           port=3306,
                           user='root',
                           passwd='123456',
                           db='test',
                           charset='utf8')
    tr_money = TransferMoney(conn)

    try:
        tr_money.transfer(source_acctid, target_acctid, money)
        # tr_money.transfer('djj', 'dh', 100)
        # tr_money.show_data()
    except Exception as e:
        print "出现问题：" + str(e)
    finally:
        conn.close()

```



> 源于慕课网数据库学习notes