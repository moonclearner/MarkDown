## python 中如何删除一个文件
os.remove 或者 os.unlink

## python 如复制一个文件
shutil 模块有一个 copyfile 函数实现文件的拷贝

## python 产生随机数
```
import random
random.random()
# 返回 0 到 1 的浮点型
```
## python 如何发送邮件
smtplib 标准库
```
import sys, smtplib
fromaddr = raw_input("From:")
toaddr = raw_input("TO").split(',')
print "ENTER message, end with ctrl + d"

server = smtplib.SMTP('localhost')
server.sendmail(fromaddr, toaddr, msg)
server.quit()
```
## python 如何拷贝一个对象
copy.copy()
copy.deeecopy()

## python 帮忙查找 pythonbug 和静态代码分析
pychecker 进行 python 代码静态分析，以及 python 的 bug
pylint 进行代码的编写规范

## 在函数中设置一个全局变量
def d():
	global x
