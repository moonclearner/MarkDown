# python 错误与异常

## 错误

- 语法错误    不符合解释器和编译器
- 逻辑错误

## 异常

- 程序遇到逻辑或者算法问题
- 运行过程中计算机错误（内存不够或者IO错误）

## 区别

错误在执行前修改，逻辑错误无法修改

运行时，异常产生，检查到错误且解释器认为是异常，抛出异常

异常处理，截获异常，忽略或者终止程序处理异常

## 常见的错误

- a:NameError  :没有在引用就使用变量
- if True:SyntaxError :语法错误
- f=open('a.txt'):IOError  无该文件为输入输出错误
- 10/0:ZeroDivisionError
- a=int('a100'):valueError
- ctrl+c:KeyboardInterrupt  中断错误

## 异常学习

```python
try:
    try_suite
except Exception [e]:
    exception_block
```

- try用于捕获try_suite中的错误，并且将错误交给except处理
- except用于处理异常，如果异常和设置捕获异常一致，使用exception_block处理异常
- 如果异常和设置的异常不一致，就会让解释器来处理
- 并且出现的异常会保存在【e】中

```python
try:
    a
except NameError,e:
    print "catch Error:",e
except:  #捕获所有的异常
    print
```

举个栗子:

猜数字游戏

```python
import random

num=random.randint(0,100)

while True:
    guess=int(raw_input('enter 1~100:'))
    if guess>num:
        print "guess Bigger:",guess
    elif guess<num:
        print
    else:
        print "ok"
        break
    print "\n"
```

当我输入50d的时候就会抛出异常，终止了程序，我想让程序有抛出异常，又不终止程序(增加程序的健壮性)

```python
import random

num=random.randint(0,100)

while True:
    try:
    	guess=int(raw_input('enter 1~100:'))
    except ValueError,e:
        print "enter 1~100:"
    if guess>num:
        print "guess Bigger:",guess
    elif guess<num:
        print
    else:
        print "ok"
        break
    print "\n"
```

### 处理多个异常

````python
try:
    try_suite
except Exception1 [e]:
    block1
except Exception2 [e]:
    block2
except ExceptionN [e]:
    blockN
````

### try-except--else

```python
try:
    try_suite
except Exception1 [e]:
    block1
else:
    none_exception
```

当没有捕获到异常的时候会继续执行else中的代码

### try-fianlly：用来做清理工作

```python
try:
    try_suite
finally:
    do_finally
```

- 如果try语句没有捕获到异常错误，代码执行do_finally语句
- 如果try语句捕获到了异常错误，程序首先执行do_finally语句，然后将捕获到的错误交給python解释器处理

```python
try:
    f=open('a.txt')
    print int(f.read())
finally:
    print "file close"
    f.close()
```

多应用有打开某文件或者资源在关闭的时候，使用该语句

```python
try:
    try_suite
except Exception1 [e]:
    block1
else:
    none_exception
finally:
    do_finally
```

- try语句没有捕获到异常，先执行try代码段后，在执行else，最好执行finally
- 如果try捕获异常，首先执行except处理错误，然后执行finally

## with

```python
with context[as var]:
    with_suite
```

- with语句时用来代替try-except_finally语句，使之间接
- context表达式返回一个对象
- var用于保存context返回的对象，单个返回值或者一个元组
- with_suite使用var变量来对context返回对象进行操作

举个栗子

```python
with open('a.txt') as f:
    for line in f.readlines():
        print line
```

在有异常的时候，还能保证关闭文件

### with解析

with语句实质时上下文管理：

- 上下文管理协议：包括方法\_\_enter\_\_()和\_\_exit()\_\_()，支持该协议的对象要实现这两个方法
- 上下文管理器：定义执行with语句时建立的运行时上下文，负责执行with语句块上下文中的进入与退出操作
- 进入上下文管理器：调用管理器\_\_enter\_\_方法，如果设置as var 语句，var变量接收\_\_enter\_\_()方法返回值
- 退出上下文管理器：调用\_\_exit()\_\_方法

写一个可以执行with  上下文管理器的类

```python
class Mycontex(object)
	def __init__(self,name):
    	self.name=name
    def __enter__(self):
    	print "__enter__"
        return self
    def do_self(self):
    	print "do_self"
    def __exit__(self,exc_type,exc_value,traceback):
        print "__exit__"
        print "Error:",exc_type,"info:","exc_value"
if __name__=='__main__'
	with Mycontex('test context') as f:
        print f.name
        f.do_self()
```

output:    

```python
__enter__
test context
do_self
__exit__
Error:None info:None
```

### 应用场景

- 文件操作
- 进程线程之间互斥对象，例如互斥锁
- 支持上下文的其他对象

## raise 

raise语句用于主动抛出异常

syntax：raise[exception[,args]]

`raise TypeError,  “test TypeError”`

output：

`TypeError: test TypeError`

## assert

用于检查表示式是否为真，如果为假，就会引发一个assertionerror错误

syntax: assert expression [,args]

`assert 0, 'test assert'

## 标准异常

- BaseException（所有的异常基类）
  - keyboardinterrupt（用户中断（`ctrl+c`））
  - Exception（常见错误的基类）
    - syntaxError
    - NameError
    - IOError
    - ImportError
    - ...
  - SystemExit（python解释器退出）
  - ...

## 自定义异常

- 自定义异常必须继承Exception类
- 自定义异常只能主动触发

syntax：class FileError(IOError)

​			pass

产生自定义异常：assert FIleError，"file Error"

```python
class CustomError(Exception):
    def __init__(self,info):
        Exception.__init__(self)
        self.errorinfo = info
        print id(self)      #看这个对象的id
    def __str__(self):
        return "CustionError:%s"% self.errorinfo
try:
    raise CustomError("test CustomError")
except CustomError,e:
    print "ErrorInfo:%d,%s"%(id(e),e)
```

output:

```python
139918882121840
ErrorInfo:139918882121840,CustionError:test CustomError
```

