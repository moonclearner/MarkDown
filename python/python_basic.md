# python 基础知识

## 字符串

字符串可以乘法

```python
words=hel
print words*3
```

输出：

helhelhel

## 逻辑行和物理行

物理行是你在编写程序时候所看见的，即每一行

逻辑行是python看见的每个语句

### 一个物理行使用多个逻辑行

那么你需要使用分号（；）来特别地标明这种用法。分号表示一个逻辑行/语句的结束。例如：

```python
i=5
print i
```

与之相同：

```python
i=5;
print i;
```

同样类似：

```python
i=5;print i;
```

或者

```python
i=5;print i
```

### 多个物理行使用一个逻辑行

```python
s='This is a string.\
This continues the string.'
print s
```

输出：

```python
This is a string.This continues the string.
```

类似：

```python
print\
i
```

## 运算符

** 幂

/ 除

// 取整

% 取模

<< 左移    2<<2   =8   10       1000   2*2^2=8

\>>右移     11>>1   =5    1011     101    11/2^1=5

& 按位与     5&3=1    101&011=001

| 按位或

^ 按位异或    101^011=110    相同为1不同为0

~ 按位翻转    ~x=-(x+1)   ~5=-6

!= 不等于

not 非   True  False

and

or

## 优先级

> lambda Lambda表达式

> or 布尔“或”

> and 布尔“与”

> not x 布尔“非”

> in，not in 成员测试

> is，is not 同一性测试

> <，<=，>，

>=，!=，==
>比较
>| 按位或
>^ 按位异或
>& 按位与
><<，>> 移位
>+，- 加法与减法
>*，/，%
>乘法、除法与取
>余
>+x，-x 正负号
>~x 按位翻转
>** 指数
>x.attribute 属性参考
>x[index] 下标
>x[index:index] 寻址段
>f(arguments...) 函数调用
>(experession,...) 绑定或元组显示
>[expression,...] 列表显示
>{key:datum,...} 字典显示
>'expression,...' 字符串转换

​       运算符通常由左向右结合，即具有相同优先级的运算符按照从左向右的顺序计算。例如，2 +3 + 4被计算成(2 + 3) + 4。一些如赋值运算符那样的运算符是由右向左结合的，即a = b = c被处理为a = (b = c)。

```python
print 'Area is',area
```

尽管代码在‘Area is’, area 之间没有空格，但是python输出的时候会自动加一个空格

## 控制流

### if

if 语句:

elif 语句:

else:

python 没有switch 只能使用if来代替工作或者（字典）

### while

while中可以使用一个else语句

while 语句：

else:

### for

for i in range(1,5):

else:

## 函数

### global语句

全局变量：global x,y,z

### 默认参数

def max(x,y=1):

y默认等于1

**申请默认值的必须放在形参后面**

### 关键参数

def fun(a,b=1,c=2):



fun(3)

fun(2,c=5)

fun(c=5,a=1)

这些调用函数都可以使用

### DocStrings

Python有一个很奇妙的特性，称为 文档字符串 ，它通常被简称为 docstrings 。DocStrings是一个
重要的工具，由于它帮助你的程序文档更加简单易懂，你应该尽量使用它。你甚至可以在程序
运行的时候，从函数恢复文档字符串！

```python
def printMax(x, y):
	'''Prints the maximum of two numbers.
	
	The two values must be integers.'''
	x = int(x) # convert to integers, if possible
	y = int(y)
	if x > y:
		print x, 'is maximum'
	else:
		print y, 'is maximum'
        
printMax(3, 5)
print printMax.__doc__    #文档字符串  
```

文档字符串的惯例是一个多行字符串，它的首行以大写字母开始，句号结尾。第二行是空行，从第三行开始是详细的描述。

**你可以使用\__doc__（注意双下划线）调用printMax函数的文档字符串属性（属于函数的名称）。请记住Python把 每一样东西 都作为对象，包括这个函数，或者int数据类型也是**

当你使用变量i并给它赋值的时候，比如赋整数5，你可以认为你创建了一个类（类型）int的对象（实例）i

## 模块

你已经学习了如何在你的程序中定义一次函数而重用代码。如果你想要在其他程序中重用很多函数，模块基本上就是一个包含了所有你定义的函数和变量的文件。为了在其他程序中重用模块，模块的文件名必须以.py为扩展名。

```python
import sys

print 'The command line arguments are:'
for i in sys.argv:
print i
```

输出

```python
$ python using_sys.py we are arguments
The command line arguments are:
using_sys.py
we
are
arguments
```

sys.argv变量是一个字符串的列表 。特别地，sys.argv包含了命令行参数 的列表，即使用命令行传递给你的程序的参数。如果你使用IDE编写运行这些程序，请在菜单里寻找一个指定程序的命令行参数的方法。

记住，脚本的名称总是sys.argv列表的第一个参数。所以，在这里，'using_sys.py'是sys.argv[0]、'we'sys.argv[1]、'are'是sys.argv[2]以及'arguments'是sys.argv[3]。

**Python从0开始计数，而非从1开始**

sys.path包含输入模块的目录名列表。我们可以观察到sys.path的第一个字符串是空的——这个空的字符串表示当前目录也是sys.path的一部分，这与PYTHONPATH环境变量是相同的。这意味着你可以直接输入位于当前目录的模块。否则，你得把你的模块放在sys.path所列的目录之一。

### 字节编译的.pyc文件

输入一个模块相对来说是一个比较费时的事情，所以Python做了一些技巧，以便使输入模块更加快一些。一种方法是创建 字节编译的文件 ，这些文件以.pyc作为扩展名。字节编译的文件与Python变换程序的中间状态有关（是否还记得Python如何工作的介绍？）。当你在下次从别的程序输入这个模块的时候，.pyc文件是十分有用的——它会快得多，因为一部分输入模块所需的处理已经完成了。另外，这些字节编译的文件也是与平台无关的。所以，现在你知道了那些.pyc文件事实上是什么了。

### from..import语句

如果你想要直接输入argv变量到你的程序中（避免在每次使用它时打sys.），那么你可以使用from sys import argv语句。如果你想要输入所有sys模块使用的名字，那么你可以使用from sysimport *语句。这对于所有模块都适用。

一般说来，应该避免使用from..import而使用import语句，因为这样可以使你的程序更加易读，也可以避免名称的冲突。

### 模块的__name__

每个模块都有一个名称，在模块中可以通过语句来找出模块的名称。当一个模块被第一次输入的时候，这个模块的主块将被运行。假如我们只想在程序本身被使用的时候运行主块，而在它被别的模块输入的时候不运行主块，我们该怎么做呢？这可以通过模块的__name__属性完成。

```python
# Filename: using_name.py
if __name__ == '__main__':
print 'This program is being run by itself'
else:
print 'I am being imported from another module'
```

输出：

```python
$ python using_name.py   #运行程序本身的时候
This program is being run by itself
$ python
>>> import using_name   #其他程序引用的时候运行
I am being imported from another module
```

每个Python模块都有它的\_\_name\_\_，如果它是'\_\_main\_\_'，这说明这个模块被用户单独运行，我们可以进行相应的恰当操作。

### 模块的创建

```python
#!/usr/bin/python
# Filename: mymodule.py
def sayhi():
	print 'Hi, this is mymodule speaking.'
version = '0.1'
# End of mymodule.py
```

使用该模块

```python
#!/usr/bin/python
# Filename: mymodule_demo.py
import mymodule
mymodule.sayhi()
print 'Version', mymodule.version
```

### from..import

```python
#!/usr/bin/python
# Filename: mymodule_demo2.py
from mymodule import sayhi, version
# Alternative:
# from mymodule import *
sayhi()
print 'Version', version
```

### dir()函数

dir()函数可以列出模块定义的标识符，比如说函数、类和变量

当你为dir()提供一个模块名的时候，它返回模块定义的名称列表。如果不提供参数，它返回当
前模块中定义的名称列表。

```python
>>> import sys
>>> dir(sys)         # get list of attributes for sys module
['__displayhook__', '__doc__', '__excepthook__', '__name__', '__stderr__',
'__stdin__', '__stdout__', '_getframe', 'api_version', 'argv',
'builtin_module_names', 'byteorder', 'call_tracing', 'callstats',
'copyright', 'displayhook', 'exc_clear', 'exc_info', 'exc_type',
'excepthook', 'exec_prefix', 'executable', 'exit', 'getcheckinterval',
'getdefaultencoding', 'getdlopenflags', 'getfilesystemencoding',
'getrecursionlimit', 'getrefcount', 'hexversion', 'maxint', 'maxunicode',
'meta_path','modules', 'path', 'path_hooks', 'path_importer_cache',
'platform', 'prefix', 'ps1', 'ps2', 'setcheckinterval', 'setdlopenflags',
'setprofile', 'setrecursionlimit', 'settrace', 'stderr', 'stdin', 'stdout',
'version', 'version_info', 'warnoptions']
>>> dir()             # get list of attributes for current module
['__builtins__', '__doc__', '__name__', 'sys']
>>>
>>> a = 5                  # 创建一个变量a
>>> dir()
['__builtins__', '__doc__', '__name__', 'a', 'sys']
>>>
>>> del a             # delete/remove 变量a
>>>
>>> dir()
['__builtins__', '__doc__', '__name__', 'sys']
```

