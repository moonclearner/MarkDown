
<!-- vim-markdown-toc Redcarpet -->
* [Python 语言特性](#python-语言特性)
	* [1 Python 的函数参数传递](#1-python-的函数参数传递)
	* [2 Python 中的元类 (metaclass)](#2-python-中的元类-metaclass)
		* [类也是对象](#类也是对象)
		* [动态地创建类](#动态地创建类)
		* [到底什么是元类](#到底什么是元类)
		* [`__metaclass__`属性](#metaclass__-属性)
		* [自定义元类](#自定义元类)
		* [为什么使用 metaclass 类而不是函数](#为什么使用-metaclass-类而不是函数)
		* [为什么要是用元类](#为什么要是用元类)
		* [结语](#结语)
	* [3 @staticmethod 和 @classmethod](#3-staticmethod-和-classmethod)
	* [4 类变量和实例变量](#4-类变量和实例变量)
	* [5 Python 自省](#5-python-自省)
	* [6 字典推导式](#6-字典推导式)
	* [7 Python 中单下划线和双下划线](#7-python-中单下划线和双下划线)
	* [8 字符串格式化：% 和.format](#8-字符串格式化：-和-format)
	* [9 迭代器和生成器](#9-迭代器和生成器)
		* [Iterables](#iterables)
		* [Generators](#generators)
		* [Yield](#yield)
		* [生成器：](#生成器：)
	* [10 `*args` and `**kwargs`](#10-args-and-kwargs)
	* [11 面向切面编程 AOP 和装饰器](#11-面向切面编程-aop-和装饰器)
	* [12 鸭子类型](#12-鸭子类型)
	* [13 Python 中重载](#13-python-中重载)
	* [14 新式类和旧式类](#14-新式类和旧式类)
	* [15 `__new__`和`__init__`的区别](#15-__new__-和-__init__-的区别)
	* [16 单例模式](#16-单例模式)
		* [1 使用`__new__`方法](#1-使用-__new__-方法)
		* [2 共享属性](#2-共享属性)
		* [3 metaclass 版本](#3-metaclass-版本)
		* [4 装饰器版本](#4-装饰器版本)
		* [5 import 方法](#5-import-方法)
	* [17 Python 中的作用域](#17-python-中的作用域)
	* [18 GIL 线程全局锁](#18-gil-线程全局锁)
	* [19 协程](#19-协程)
	* [20 闭包](#20-闭包)
	* [21 lambda 函数](#21-lambda-函数)
	* [python 如何进行类型转换](#python-如何进行类型转换)
	* [22 Python 函数式编程](#22-python-函数式编程)
	* [23 Python 里的拷贝](#23-python-里的拷贝)
	* [python 如何进行内存管理](#python-如何进行内存管理)
	* [24 Python 垃圾回收机制](#24-python-垃圾回收机制)
		* [1 引用计数](#1-引用计数)
		* [2 标记 - 清除机制](#2-标记-清除机制)
		* [3 分代技术](#3-分代技术)
	* [25 Python 的 List](#25-python-的-list)
	* [26 Python 的 is](#26-python-的-is)
	* [27 read,readline 和 readlines](#27-read-readline-和-readlines)
	* [28 Python2 和 3 的区别](#28-python2-和-3-的区别)
	* [29 super init](#29-super-init)
	* [30 range and xrange](#30-range-and-xrange)
* [操作系统](#操作系统)
	* [1 select,poll 和 epoll](#1-select-poll-和-epoll)
	* [2 调度算法](#2-调度算法)
	* [3 死锁](#3-死锁)
	* [4 程序编译与链接](#4-程序编译与链接)
		* [1 预处理](#1-预处理)
		* [2 编译](#2-编译)
		* [3 汇编](#3-汇编)
		* [4 链接](#4-链接)
	* [5 静态链接和动态链接](#5-静态链接和动态链接)
	* [6 虚拟内存技术](#6-虚拟内存技术)
	* [7 分页和分段](#7-分页和分段)
		* [分页与分段的主要区别](#分页与分段的主要区别)
	* [8 页面置换算法](#8-页面置换算法)
	* [9 边沿触发和水平触发](#9-边沿触发和水平触发)
* [数据库](#数据库)
	* [1 事务](#1-事务)
	* [2 数据库索引](#2-数据库索引)
	* [3 Redis 原理](#3-redis-原理)
	* [4 乐观锁和悲观锁](#4-乐观锁和悲观锁)
	* [5 MVCC](#5-mvcc)
	* [6 MyISAM 和 InnoDB](#6-myisam-和-innodb)
* [网络](#网络)
	* [1 三次握手](#1-三次握手)
	* [2 四次挥手](#2-四次挥手)
	* [3 ARP 协议](#3-arp-协议)
	* [4 urllib 和 urllib2 的区别](#4-urllib-和-urllib2-的区别)
	* [5 Post 和 Get](#5-post-和-get)
	* [6 Cookie 和 Session](#6-cookie-和-session)
	* [7 apache 和 nginx 的区别](#7-apache-和-nginx-的区别)
	* [8 网站用户密码保存](#8-网站用户密码保存)
	* [9 HTTP 和 HTTPS](#9-http-和-https)
	* [10 XSRF 和 XSS](#10-xsrf-和-xss)
	* [11 幂等 Idempotence](#11-幂等-idempotence)
	* [12 RESTful 架构 (SOAP,RPC)](#12-restful-架构-soap-rpc)
	* [13 SOAP](#13-soap)
	* [14 RPC](#14-rpc)
	* [15 CGI 和 WSGI](#15-cgi-和-wsgi)
	* [16 中间人攻击](#16-中间人攻击)
	* [17 c10k 问题](#17-c10k-问题)
	* [18 socket](#18-socket)
	* [19 浏览器缓存](#19-浏览器缓存)
	* [20 HTTP1.0 和 HTTP1.1](#20-http1-0-和-http1-1)
	* [21 Ajax](#21-ajax)
* [*NIX](#nix)
	* [unix 进程间通信方式 (IPC)](#unix-进程间通信方式-ipc)
* [数据结构](#数据结构)
	* [1 红黑树](#1-红黑树)
* [编程题](#编程题)
	* [1 台阶问题 / 斐波纳挈](#1-台阶问题-斐波纳挈)
	* [2 变态台阶问题](#2-变态台阶问题)
	* [3 矩形覆盖](#3-矩形覆盖)
	* [4 杨氏矩阵查找](#4-杨氏矩阵查找)
	* [5 去除列表中的重复元素](#5-去除列表中的重复元素)
	* [6 链表成对调换](#6-链表成对调换)
	* [7 创建字典的方法](#7-创建字典的方法)
		* [1 直接创建](#1-直接创建)
		* [2 工厂方法](#2-工厂方法)
		* [3 fromkeys() 方法](#3-fromkeys-方法)
	* [8 合并两个有序列表](#8-合并两个有序列表)
	* [9 交叉链表求交点](#9-交叉链表求交点)
	* [10 二分查找](#10-二分查找)
	* [11 快排](#11-快排)
	* [12 找零问题](#12-找零问题)
	* [13 广度遍历和深度遍历二叉树](#13-广度遍历和深度遍历二叉树)
	* [17 前中后序遍历](#17-前中后序遍历)
	* [18 求最大树深](#18-求最大树深)
	* [19 求两棵树是否相同](#19-求两棵树是否相同)
	* [20 前序中序求后序](#20-前序中序求后序)
	* [21 单链表逆置](#21-单链表逆置)
	* [22 两个字符串是否是变位词](#22-两个字符串是否是变位词)

<!-- vim-markdown-toc -->
# Python 语言特性

## 1 Python 的函数参数传递

看两个例子：

```python
a = 1
def fun(a):
    a = 2
fun(a)
print a  # 1
```

```python
a = []
def fun(a):
    a.append(1)
fun(a)
print a  # [1]
```

所有的变量都可以理解是内存中一个对象的“引用”，或者，也可以看似 c 中 void*的感觉。

通过`id`来看引用`a`的内存地址可以比较理解：

```python
a = 1
def fun(a):
    print "func_in",id(a)   # func_in 41322472
    a = 2
    print "re-point",id(a), id(2)   # re-point 41322448 41322448
print "func_out",id(a), id(1)  # func_out 41322472 41322472
fun(a)
print a  # 1
```

注：具体的值在不同电脑上运行时可能不同。

可以看到，在执行完`a = 2`之后，`a`引用中保存的值，即内存地址发生变化，由原来`1`对象的所在的地址变成了`2`这个实体对象的内存地址。

而第 2 个例子`a`引用保存的内存值就不会发生变化：

```python
a = []
def fun(a):
    print "func_in",id(a)  # func_in 53629256
    a.append(1)
print "func_out",id(a)     # func_out 53629256
fun(a)
print a  # [1]
```

这里记住的是类型是属于对象的，而不是变量。而对象有两种，“可更改”（mutable）与“不可更改”（immutable）对象。在 python 中，strings, tuples, 和 numbers 是不可更改的对象，而 list,dict 等则是可以修改的对象。（这就是这个问题的重点）

当一个引用传递给函数的时候，函数自动复制一份引用，这个函数里的引用和外边的引用没有半毛关系了。所以第一个例子里函数把引用指向了一个不可变对象，当函数返回的时候，外面的引用没半毛感觉。而第二个例子就不一样了，函数内的引用指向的是可变对象，对它的操作就和定位了指针地址一样，在内存里进行修改。

如果还不明白的话，这里有更好的解释：http://stackoverflow.com/questions/986006/how-do-i-pass-a-variable-by-reference

## 2 Python 中的元类 (metaclass)

这个非常的不常用，但是像 ORM 这种复杂的结构还是会需要的，详情请看：http://stackoverflow.com/questions/100003/what-is-a-metaclass-in-python

### 类也是对象
在理解元类之前，你需要先掌握 Python 中的类。Python 中类的概念借鉴于 Smalltalk，这显得有些奇特。在大多数编程语言中，类就是一组用来描述如何生成一个对象的代码段。在 Python 中这一点仍然成立：

```python
>>> class ObjectCreator(object):
…       pass
…
>>> my_object = ObjectCreator()
>>> print my_object
<__main__.ObjectCreator object at 0x8974f2c>
```
但是，Python 中的类还远不止如此。类同样也是一种对象。是的，没错，就是对象。只要你使用关键字 class，Python 解释器在执行的时候就会创建一个对象。下面的代码段：

```python
>>> class ObjectCreator(object):
…       pass
…
```
将在内存中创建一个对象，名字就是 ObjectCreator。这个对象（类）自身拥有创建对象（类实例）的能力，而这就是为什么它是一个类的原因。但是，它的本质仍然是一个对象，于是乎你可以对它做如下的操作：

- 你可以将它赋值给一个变量
- 你可以拷贝它
- 你可以为它增加属性
- 你可以将它作为函数参数进行传递

```python
>>> print ObjectCreator     # 你可以打印一个类，因为它其实也是一个对象
<class '__main__.ObjectCreator'>
>>> def echo(o):
…       print o
…
>>> echo(ObjectCreator)                 # 你可以将类做为参数传给函数
<class '__main__.ObjectCreator'>
>>> print hasattr(ObjectCreator, 'new_attribute')
Fasle
>>> ObjectCreator.new_attribute = 'foo' #  你可以为类增加属性
>>> print hasattr(ObjectCreator, 'new_attribute')
True
>>> print ObjectCreator.new_attribute
foo
>>> ObjectCreatorMirror = ObjectCreator # 你可以将类赋值给一个变量
>>> print ObjectCreatorMirror()
<__main__.ObjectCreator object at 0x8997b4c>
```
### 动态地创建类
因为类也是对象，你可以在运行时动态的创建它们，就像其他任何对象一样。首先，你可以在函数中创建类，使用 class 关键字即可
```python
>>> def choose_class(name):
…       if name == 'foo':
…           class Foo(object):
…               pass
…           return Foo     # 返回的是类，不是类的实例
…       else:
…           class Bar(object):
…               pass
…           return Bar
…
>>> MyClass = choose_class('foo')
>>> print MyClass              # 函数返回的是类，不是类的实例
<class '__main__'.Foo>
>>> print MyClass()            # 你可以通过这个类创建类实例，也就是对象
<__main__.Foo object at 0x89c6d4c>
```
但这还不够动态，因为你仍然需要自己编写整个类的代码。由于类也是对象，所以它们必须是通过什么东西来生成的才对。当你使用 class 关键字时，Python 解释器自动创建这个对象。但就和 Python 中的大多数事情一样，Python 仍然提供给你手动处理的方法。还记得内建函数 type 吗？这个古老但强大的函数能够让你知道一个对象的类型是什么，就像这样：
```python
>>> print type(1)
<type 'int'>
>>> print type("1")
<type 'str'>
>>> print type(ObjectCreator)
<type 'type'>
>>> print type(ObjectCreator())
<class '__main__.ObjectCreator'>
```
这里，type 有一种完全不同的能力，它也能动态的创建类。type 可以接受一个类的描述作为参数，然后返回一个类。（我知道，根据传入参数的不同，同一个函数拥有两种完全不同的用法是一件很傻的事情，但这在 Python 中是为了保持向后兼容性）

type 可以这样工作：
`type（类名，父类的元组（针对继承的情况，可以为空），包含属性的字典（名称和值）)`
```python

>>> class MyShinyClass(object):
…       pass
```
手动创建：
```python
>>> MyShinyClass = type('MyShinyClass', (), {})  # 返回一个类对象
>>> print MyShinyClass
<class '__main__.MyShinyClass'>
>>> print MyShinyClass()  #  创建一个该类的实例
<__main__.MyShinyClass object at 0x8997cec>
```

你会发现我们使用“MyShinyClass”作为类名，并且也可以把它当做一个变量来作为类的引用。类和变量是不同的，这里没有任何理由把事情弄的复杂。

type 接受一个字典来为类定义属性，因此

```python
>>> class Foo(object):
…       bar = True

# 可以翻译为
>>> Foo = type('Foo', (), {'bar':True})
# 可以将 Foo 作为一个普通的类进行使用
>>> print Foo
<class '__main__.Foo'>
>>> print Foo.bar
True
>>> f = Foo()
>>> print f
<__main__.Foo object at 0x8a9b84c>
>>> print f.bar
True

# 类的继承
>>> class FooChild(Foo):
…       pass

# 可以写成
>>> FooChild = type('FooChild', (Foo,),{})
>>> print FooChild
<class '__main__.FooChild'>
>>> print FooChild.bar   # bar 属性是由 Foo 继承而来
True

# 最终你会希望为你的类增加方法。只需要定义一个有着恰当签名的函数并将其作为属性赋值就可以了。
>>> def echo_bar(self):
…       print self.bar
…
>>> FooChild = type('FooChild', (Foo,), {'echo_bar': echo_bar})
>>> hasattr(Foo, 'echo_bar')
False
>>> hasattr(FooChild, 'echo_bar')
True
>>> my_foo = FooChild()
>>> my_foo.echo_bar()
True
```
### 到底什么是元类
元类就是用来创建类的“东西”。你创建类就是为了创建类的实例对象，不是吗？但是我们已经学习到了 Python 中的类也是对象。好吧，元类就是用来创建这些类（对象）的，元类就是类的类，你可以这样理解 为：
```python
MyClass = MetaClass()
MyObject = MyClass()

# 你已经看到了 type 可以让你像这样做：
MyClass = type('MyClass', (), {})
```
这是因为函数 type 实际上是一个元类。type 就是 Python 在背后用来创建所有类的元类。现在你想知道那为什么 type 会全部采用小写形式而不是 Type 呢？好吧，我猜这是为了和 str 保持一致性，str 是用来创建字符串对象的类，而 int 是用来创建整数对象的类。type 就是创建类对象的类。你可以通过检查__class__属性来看到这一点。Python 中所有的东西，注意，我是指所有的东西——都是对象。这包括整数、字符串、函数以及类。它们全部都是对象，而且它们都是从一个类创建而来。
```python
>>> age = 35
>>> age.__class__
<type 'int'>
>>> name = 'bob'
>>> name.__class__
<type 'str'>
>>> def foo(): pass
>>>foo.__class__
<type 'function'>
>>> class Bar(object): pass
>>> b = Bar()
>>> b.__class__
<class '__main__.Bar'>

# 现在，对于任何一个__class__的__class__属性又是什么呢？
>>> a.__class__.__class__
<type 'type'>
>>> age.__class__.__class__
<type 'type'>
>>> foo.__class__.__class__
<type 'type'>
>>> b.__class__.__class__
<type 'type'>

因此，元类就是创建类这种对象的东西。如果你喜欢的话，可以把元类称为“类工厂”（不要和工厂类搞混了：D） type 就是 Python 的内建元类，当然了，你也可以创建自己的元类。
```
###	`__metaclass__`属性
你可以在写一个类的时候为其添加__metaclass__属性。
```
class Foo(object):
	__metaclass__ = something…
[…]
```
如果你这么做了，Python 就会用元类来创建类 Foo。小心点，这里面有些技巧。你首先写下 class Foo(object)，但是类对象 Foo 还没有在内存中创建。Python 会在类的定义中寻找__metaclass__属性，如果找到了，Python 就会用它来创建类 Foo，如果没有找到，就会用内建的 type 来创建这个类。把下面这段话反复读几次。当你写如下代码时 :
```
class Foo(Bar):
    pass
```
Python 做了如下的操作：

Foo 中有__metaclass__这个属性吗？如果是，Python 会在内存中通过__metaclass__创建一个名字为 Foo 的类对象（我说的是类对象，请紧跟我的思路）。如果 Python 没有找到__metaclass__，它会继续在 Bar（父类）中寻找__metaclass__属性，并尝试做和前面同样的操作。如果 Python 在任何父类中都找不到__metaclass__，它就会在模块层次中去寻找__metaclass__，并尝试做同样的操作。如果还是找不到__metaclass__,Python 就会用内置的 type 来创建这个类对象。

现在的问题就是，你可以在__metaclass__中放置些什么代码呢？答案就是：可以创建一个类的东西。那么什么可以用来创建一个类呢？type，或者任何使用到 type 或者子类化 type 的东东都可以。
### 自定义元类
元类的主要目的就是为了当创建类时能够自动地改变类。通常，你会为 API 做这样的事情，你希望可以创建符合当前上下文的类。假想一个很傻的例子，你决定在你的模块里所有的类的属性都应该是大写形式。有好几种方法可以办到，但其中一种就是通过在模块级别设定__metaclass__。采用这种方法，这个模块中的所有类都会通过这个元类来创建，我们只需要告诉元类把所有的属性都改成大写形式就万事大吉了。

幸运的是，__metaclass__实际上可以被任意调用，它并不需要是一个正式的类（我知道，某些名字里带有‘class’的东西并不需要是一个 class，画画图理解下，这很有帮助）。所以，我们这里就先以一个简单的函数作为例子开始。

```python
# 元类会自动将你通常传给‘type’的参数作为自己的参数传入
def upper_attr(future_class_name, future_class_parents, future_class_attr):
    '''返回一个类对象，将属性都转为大写形式'''
    #  选择所有不以'__'开头的属性
    attrs = ((name, value) for name, value in future_class_attr.items() if not name.startswith('__'))

    # 将它们转为大写形式
    uppercase_attr = dict((name.upper(), value) for name, value in attrs)

    # 通过'type'来做类对象的创建
    return type(future_class_name, future_class_parents, uppercase_attr)

__metaclass__ = upper_attr  #  这会作用到这个模块中的所有类

class Foo(object):
    # 我们也可以只在这里定义__metaclass__，这样就只会作用于这个类中
    bar = 'bip'

print hasattr(Foo, 'bar')
# 输出：False
print hasattr(Foo, 'BAR')
# 输出：True

f = Foo()
print f.BAR
# 输出：'bip'
```
现在让我们再做一次，这一次用一个真正的 class 来当做元类。
```python
# 请记住，'type'实际上是一个类，就像'str'和'int'一样
# 所以，你可以从 type 继承
class UpperAttrMetaClass(type):
    # __new__ 是在__init__之前被调用的特殊方法
    # __new__是用来创建对象并返回之的方法
    # 而__init__只是用来将传入的参数初始化给对象
    # 你很少用到__new__，除非你希望能够控制对象的创建
    # 这里，创建的对象是类，我们希望能够自定义它，所以我们这里改写__new__
    # 如果你希望的话，你也可以在__init__中做些事情
    # 还有一些高级的用法会涉及到改写__call__特殊方法，但是我们这里不用
    def __new__(upperattr_metaclass, future_class_name, future_class_parents, future_class_attr):
        attrs = ((name, value) for name, value in future_class_attr.items() if not name.startswith('__'))
        uppercase_attr = dict((name.upper(), value) for name, value in attrs)
        return type(future_class_name, future_class_parents, uppercase_attr)
```
但是，这种方式其实不是 OOP。我们直接调用了 type，而且我们没有改写父类的__new__方法。现在让我们这样去处理：
```python
class UpperAttrMetaclass(type):
	def __new__(upperattr_metaclass, future_class_name, future_class_parents, future_class_attr):
		attrs = ((name, value) for name, value in future_class_attr.items() if not name.startswith('__'))
		uppercase_attr = dict((name.upper(), value) for name, value in attrs)
		# 复用 type.__new__方法
		# 这就是基本的 OOP 编程，没什么魔法
		return type.__new__(upperattr_metaclass, future_class_name, future_class_parents, uppercase_attr)
```
你可能已经注意到了有个额外的参数 upperattr_metaclass，这并没有什么特别的。类方法的第一个参数总是表示当前的实例，就像在普通的类方法中的 self 参数一样。当然了，为了清晰起见，这里的名字我起的比较长。但是就像 self 一样，所有的参数都有它们的传统名称。因此，在真实的产品代码中一个元类应该是像这样的：
```python
class UpperAttrMetaclass(type):
    def __new__(cls, name, bases, dct):
        attrs = ((name, value) for name, value in dct.items() if not name.startswith('__')
        uppercase_attr  = dict((name.upper(), value) for name, value in attrs)
        return type.__new__(cls, name, bases, uppercase_attr)
```
如果使用 super 方法的话，我们还可以使它变得更清晰一些，这会缓解继承（是的，你可以拥有元类，从元类继承，从 type 继承）
```python
class UpperAttrMetaclass(type):
    def __new__(cls, name, bases, dct):
        attrs = ((name, value) for name, value in dct.items() if not name.startswith('__'))
        uppercase_attr = dict((name.upper(), value) for name, value in attrs)
        return super(UpperAttrMetaclass, cls).__new__(cls, name, bases, uppercase_attr)
```
就是这样，除此之外，关于元类真的没有别的可说的了。使用到元类的代码比较复杂，这背后的原因倒并不是因为元类本身，而是因为你通常会使用元类去做一些晦涩的事情，依赖于自省，控制继承等等。确实，用元类来搞些“黑暗魔法”是特别有用的，因而会搞出些复杂的东西来。但就元类本身而言，它们其实是很简单的：
- 拦截类的创建
- 修改类
- 返回修改之后的类

### 为什么使用 metaclass 类而不是函数
由于`__metaclass__`可以接受任何可调用的对象，那为何还要使用类呢，因为很显然使用类会更加复杂啊？这里有好几个原因：
1）意图会更加清晰。当你读到 UpperAttrMetaclass(type) 时，你知道接下来要发生什么。

2）你可以使用 OOP 编程。元类可以从元类中继承而来，改写父类的方法。元类甚至还可以使用元类。

3）你可以把代码组织的更好。当你使用元类的时候肯定不会是像我上面举的这种简单场景，通常都是针对比较复杂的问题。将多个方法归总到一个类中会很有帮助，也会使得代码更容易阅读。

4）你可以使用`__new__`,` __init__`以及`__call__`这样的特殊方法。它们能帮你处理不同的任务。就算通常你可以把所有的东西都在`__new__`里处理掉，有些人还是觉得用`__init__`更舒服些。

5）哇哦，这东西的名字是 metaclass，肯定非善类，我要小心！

### 为什么要是用元类
元类的主要用途是创建 API。一个典型的例子是 Django ORM。它允许你像这样定义：
```python
class Person(models.Model):
    name = models.CharField(max_length=30)
    age = models.IntegerField()

guy  = Person(name='bob', age='35')
print guy.age
```
这并不会返回一个 IntegerField 对象，而是会返回一个 int，甚至可以直接从数据库中取出数据。这是有可能的，因为 models.Model 定义了__metaclass__， 并且使用了一些魔法能够将你刚刚定义的简单的 Person 类转变成对数据库的一个复杂 hook。Django 框架将这些看起来很复杂的东西通过暴露出一个简单的使用元类的 API 将其化简，通过这个 API 重新创建代码，在背后完成真正的工作。

### 结语
首先，你知道了类其实是能够创建出类实例的对象。好吧，事实上，类本身也是实例，当然，它们是元类的实例。
```python
>>>class Foo(object): pass
>>> id(Foo)
142630324
```
Python 中的一切都是对象，它们要么是类的实例，要么是元类的实例，除了 type。type 实际上是它自己的元类，在纯 Python 环境中这可不是你能够做到的，这是通过在实现层面耍一些小手段做到的。其次，元类是很复杂的。对于非常简单的类，你可能不希望通过使用元类来对类做修改。你可以通过其他两种技术来修改类：
- Monkey patching 或者叫鸭子类型
- class decorators
## 3 @staticmethod 和 @classmethod

Python 其实有 3 个方法，即静态方法 (staticmethod), 类方法 (classmethod) 和实例方法，如下：

```python
def foo(x):
    print "executing foo(%s)"%(x)

class A(object):
    def foo(self,x):
        print "executing foo(%s,%s)"%(self,x)

    @classmethod
    def class_foo(cls,x):
        print "executing class_foo(%s,%s)"%(cls,x)

    @staticmethod
    def static_foo(x):
        print "executing static_foo(%s)"%x

a=A()

```

这里先理解下函数参数里面的 self 和 cls. 这个 self 和 cls 是对类或者实例的绑定，对于一般的函数来说我们可以这么调用`foo(x)`, 这个函数就是最常用的，它的工作跟任何东西（类，实例）无关。对于实例方法，我们知道在类里每次定义方法的时候都需要绑定这个实例，就是`foo(self, x)`, 为什么要这么做呢？因为实例方法的调用离不开实例，我们需要把实例自己传给函数，调用的时候是这样的`a.foo(x)`（其实是`foo(a, x)`). 类方法一样，只不过它传递的是类而不是实例，`A.class_foo(x)`. 注意这里的 self 和 cls 可以替换别的参数，但是 python 的约定是这俩，还是不要改的好。

对于静态方法其实和普通的方法一样，不需要对谁进行绑定，唯一的区别是调用的时候需要使用`a.static_foo(x)`或者`A.static_foo(x)`来调用。

|\\|实例方法|类方法|静态方法|
|:--|:--|:--|:--|
|a = A()|a.foo(x)|a.class_foo(x)|a.static_foo(x)|
|A|不可用|A.class_foo(x)|A.static_foo(x)|

更多关于这个问题：http://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod-in-python

## 4 类变量和实例变量

```python
class Person:
    name="aaa"

p1=Person()
p2=Person()
p1.name="bbb"
print p1.name  # bbb
print p2.name  # aaa
print Person.name  # aaa
```

类变量就是供类使用的变量，实例变量就是供实例使用的。

这里`p1.name="bbb"`是实例调用了类变量，这其实和上面第一个问题一样，就是函数传参的问题，`p1.name`一开始是指向的类变量`name="aaa"`, 但是在实例的作用域里把类变量的引用改变了，就变成了一个实例变量，self.name 不再引用 Person 的类变量 name 了。

可以看看下面的例子：

```python
class Person:
    name=[]

p1=Person()
p2=Person()
p1.name.append(1)
print p1.name  # [1]
print p2.name  # [1]
print Person.name  # [1]
```

参考：http://stackoverflow.com/questions/6470428/catch-multiple-exceptions-in-one-line-except-block

```python
# 实例也能够访问类变量，如下：

class Foo(object):
    val = 0
    def __init__(self):
        pass
if __name__ == '__main__':
    foo = Foo()
    print foo.val
    print Foo.val

# 另外，可以通过以下方式访问类变量：

class Foo(object):
    val = 3
    def __init__(self):
        print self.__class__.val
if __name__ == '__main__':
    foo = Foo()

# 还可以这样
class Foo(object):
    val = 3
    def __init__(self):
        pass
    @classmethod
    def echo(cls):
        print cls.val
if __name__ == '__main__':
    Foo.echo()
```
调用父类的 init 方法有两种，第一种：
```python
class Foo(object):
    def __init__(self):
        self.val = 1
class Foo2(Foo):
    def __init__(self):
        Foo.__init__(self)   // 类调用实例方法时，需要传入 self 指代的实例
        print self.val

if __name__ == '__main__':
    foo2 = Foo2()

# 第二种：

class Foo(object):
    def __init__(self):
        self.val = 1
class Foo2(Foo):
    def __init__(self):
        super(Foo2, self).__init__()
        print self.val

if __name__ == '__main__':
    foo2 = Foo2()
```

## 5 Python 自省

这个也是 python 彪悍的特性。

自省就是面向对象的语言所写的程序在运行时，所能知道对象的类型。简单一句就是运行时能够获得对象的类型。比如 type(),dir(),getattr(),hasattr(),isinstance().setattr()

## 6 字典推导式

可能你见过列表推导时，却没有见过字典推导式，在 2.7 中才加入的：

```python
d = {key: value for (key, value) in iterable}
```

## 7 Python 中单下划线和双下划线

```python
>>> class MyClass():
...     def __init__(self):
...             self.__superprivate = "Hello"
...             self._semiprivate = ", world!"
...
>>> mc = MyClass()
>>> print mc.__superprivate
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: myClass instance has no attribute '__superprivate'
>>> print mc._semiprivate
, world!
>>> print mc.__dict__
{'_MyClass__superprivate': 'Hello', '_semiprivate': ', world!'}
```

`__foo__`: 一种约定，Python 内部的名字，用来区别其他用户自定义的命名，以防冲突。

`_foo`: 一种约定，用来指定变量私有。程序员用来指定私有变量的一种方式。

`__foo`: 这个有真正的意义：解析器用`_classname__foo`来代替这个名字，以区别和其他类相同的命名。

详情见：http://stackoverflow.com/questions/1301346/the-meaning-of-a-single-and-a-double-underscore-before-an-object-name-in-python

或者：http://www.zhihu.com/question/19754941

## 8 字符串格式化：% 和.format

.format 在许多方面看起来更便利。对于`%`最烦人的是它无法同时传递一个变量和元组。你可能会想下面的代码不会有什么问题：

```
"hi there %s" % name
```

但是，如果 name 恰好是 (1,2,3), 它将会抛出一个 TypeError 异常。为了保证它总是正确的，你必须这样做：

```
"hi there %s" % (name,)   # 提供一个单元素的数组而不是一个参数
```

但是有点丑..format 就没有这些问题。你给的第二个问题也是这样，.format 好看多了。

你为什么不用它？

* 不知道它（在读这个之前）
* 为了和 Python2.5 兼容（譬如 logging 库建议使用`%`([issue #4](https://github.com/taizilongxu/interview_python/issues/4)))

http://stackoverflow.com/questions/5082452/python-string-formatting-vs-format

## 9 迭代器和生成器

这个是 stackoverflow 里 python 排名第一的问题，值得一看：http://stackoverflow.com/questions/231767/what-does-the-yield-keyword-do-in-python

```python
def node._get_child_candidates(self, distance, min_dist, max_dist):
    if self._leftchild and distance - max_dist < self._median:
        yield self._leftchild
    if self._rightchild and distance + max_dist >= self._median:
        yield self._rightchild
```
下面是调用它：

```python
result, candidates = list(), [self]
while candidates:
    node = candidates.pop()
    distance = node._get_dist(obj)
    if distance <= max_dist and distance >= min_dist:
        result.extend(node._values)
    candidates.extend(node._get_child_candidates(distance, min_dist, max_dist))
return result
```
当_get_child_candidates 方法被调用的时候发生了什么？是返回一个列表？还是一个元祖？它还能第二次调用吗？后面的调用什么时候结束？

为了理解 yield 有什么用，首先得理解 generators, 而理解 generators 前还要理解 iterables

### Iterables

当你创建了一个列表，你可以一个一个的读取它的每一项，这叫做 iteration:

```python
>>> mylist = [1, 2, 3]
>>> for i in mylist:
...    print(i)
1
2
3
```
Mylist 是可迭代的。当你用列表推导式的时候，你就创建了一个列表，而这个列表也是可迭代的：

```python
>>> mylist = [x*x for x in range(3)]
>>> for i in mylist:
...    print(i)
0
1
4
```
所有你可以用在 for...in... 语句中的都是可迭代的：比如 lists,strings,files... 因为这些可迭代的对象你可以随意的读取所以非常方便易用，但是你必须把它们的值放到内存里，当它们有很多值时就会消耗太多的内存。

### Generators

生成器也是迭代器的一种，但是你只能迭代它们一次。原因很简单，因为它们不是全部存在内存里，它们只在要调用的时候在内存里生成：

```python
>>> mygenerator = (x*x for x in range(3))
>>> for i in mygenerator:
...    print(i)
0
1
4
```
生成器和迭代器的区别就是用 () 代替 [], 还有你不能用 for i in mygenerator 第二次调用生成器：首先计算 0, 然后会在内存里丢掉 0 去计算 1, 直到计算完 4.

### Yield

Yield 的用法和关键字 return 差不多，下面的函数将会返回一个生成器：

```python
>>> def createGenerator():
...    mylist = range(3)
...    for i in mylist:
...        yield i*i
...
>>> mygenerator = createGenerator() # 创建生成器
>>> print(mygenerator) # mygenerator is an object!
<generator object createGenerator at 0xb7555c34>
>>> for i in mygenerator:
...     print(i)
0
1
4
```
在这里这个例子好像没什么用，不过当你的函数要返回一个非常大的集合并且你希望只读一次的话，那么它就非常的方便了。

要理解 Yield 你必须先理解当你调用函数的时候，函数里的代码并没有运行。函数仅仅返回生成器对象，这就是它最微妙的地方：-)

然后呢，每当 for 语句迭代生成器的时候你的代码才会运转。

现在，到了最难的部分：

当 for 语句第一次调用函数里返回的生成器对象，函数里的代码就开始运作，直到碰到 yield, 然后会返回本次循环的第一个返回值。所以下一次调用也将运行一次循环然后返回下一个值，直到没有值可以返回。

一旦函数运行并没有碰到 yeild 语句就认为生成器已经为空了。原因有可能是循环结束或者没有满足 if/else 之类的。

对于你的代码的解释

### 生成器：

```python
# 这里你创建 node 方法的对象将会返回一个生成器
def node._get_child_candidates(self, distance, min_dist, max_dist):

  # 这里的代码你每次使用生成器对象的时候将会调用

  if self._leftchild and distance - max_dist < self._median:
      yield self._leftchild

  if self._rightchild and distance + max_dist >= self._median:
      yield self._rightchild

  # 如果代码运行到这里，生成器就被认为变成了空的
调用：

# 创建空列表和一个当前对象索引的列表
result, candidates = list(), [self]

# 在 candidates 上进行循环（在开始只保含一个元素）
while candidates:

    # 获得最后一个 condidate 然后从列表里删除
    node = candidates.pop()

    # 获取 obj 和 candidate 的 distance
    distance = node._get_dist(obj)

    # 如果 distance 何时将会填入 result
    if distance <= max_dist and distance >= min_dist:
        result.extend(node._values)

    candidates.extend(node._get_child_candidates(distance, min_dist, max_dist))

return result
```
这段代码有几个有意思的地方：

一般的时候我们会在循环迭代一个列表的同时在列表中添加元素：-) 尽管在有限循环里结束多少有一些危险，但也不失为一个简单的方法去遍历嵌套的数据。在这里 candidates.extend(node._get_child_candidates(distance, min_dist, max_dist)) 将遍历生成器的每一个值，但是 while 循环中的 condidates 将不再保存已经遍历过的生成器对象，也就是说添加进 condidates 的生成器对象只会遍历一遍。

extend() 是一个列表对象的方法，它可以把一个迭代对象添加进列表。

我们经常这么用：

```python
>>> a = [1, 2]
>>> b = [3, 4]
>>> a.extend(b)
>>> print(a)
[1, 2, 3, 4]
```
但是在你给的代码里得到的是生成器，这样做的好处：

你不需要读这个值两次
你能得到许多孩子节点但是你不希望他们全部存入内存。
这种方法之所以能很好的运行是因为 Python 不关心方法的参数是不是一个列表。它只希望接受一个迭代器，所以不管是 strings,lists,tuples 或者 generators 都可以！这种方法叫做 duck typing, 这也是 Python 看起来特别 cool 的原因之一。但是这又是另外一个传说了，另一个问题

好了，看到这里可以打住了，下面让我们看看生成器的高级用法：

控制迭代器的穷尽

```python
>>> class Bank(): # 让我们建个银行，生产许多 ATM
...    crisis = False
...    def create_atm(self):
...        while not self.crisis:
...            yield "$100"
>>> hsbc = Bank() # 当一切就绪了你想要多少 ATM 就给你多少
>>> corner_street_atm = hsbc.create_atm()
>>> print(corner_street_atm.next())
$100
>>> print(corner_street_atm.next())
$100
>>> print([corner_street_atm.next() for cash in range(5)])
['$100', '$100', '$100', '$100', '$100']
>>> hsbc.crisis = True # cao, 经济危机来了没有钱了！
>>> print(corner_street_atm.next())
<type 'exceptions.StopIteration'>
>>> wall_street_atm = hsbc.create_atm() # 对于其他 ATM, 它还是 True
>>> print(wall_street_atm.next())
<type 'exceptions.StopIteration'>
>>> hsbc.crisis = False # 麻烦的是，尽管危机过去了，ATM 还是空的
>>> print(corner_street_atm.next())
<type 'exceptions.StopIteration'>
>>> brand_new_atm = hsbc.create_atm() # 只能重新新建一个 bank 了
>>> for cash in brand_new_atm:
...    print cash
$100
$100
$100
$100
$100
$100
$100
$100
$100
...
```
它对于一些不断变化的值很有用，像控制你资源的访问。

Itertools, 你的好基友

itertools 模块包含了一些特殊的函数可以操作可迭代对象。有没有想过复制一个生成器？链接两个生成器？把嵌套列表里的值组织成一个列表？Map/Zip 还不用创建另一个列表？

来吧 import itertools

来一个例子？让我们看看 4 匹马比赛有多少个排名结果：

```python
>>> horses = [1, 2, 3, 4]
>>> races = itertools.permutations(horses)
>>> print(races)
<itertools.permutations object at 0xb754f1dc>
>>> print(list(itertools.permutations(horses)))
[(1, 2, 3, 4),
 (1, 2, 4, 3),
 (1, 3, 2, 4),
 (1, 3, 4, 2),
 (1, 4, 2, 3),
 (1, 4, 3, 2),
 (2, 1, 3, 4),
 (2, 1, 4, 3),
 (2, 3, 1, 4),
 (2, 3, 4, 1),
 (2, 4, 1, 3),
 (2, 4, 3, 1),
 (3, 1, 2, 4),
 (3, 1, 4, 2),
 (3, 2, 1, 4),
 (3, 2, 4, 1),
 (3, 4, 1, 2),
 (3, 4, 2, 1),
 (4, 1, 2, 3),
 (4, 1, 3, 2),
 (4, 2, 1, 3),
 (4, 2, 3, 1),
 (4, 3, 1, 2),
 (4, 3, 2, 1)]
```
理解迭代的内部机制

迭代是可迭代对象（对应__iter__() 方法）和迭代器（对应__next__() 方法）的一个过程。可迭代对象就是任何你可以迭代的对象（废话啊）. 迭代器就是可以让你迭代可迭代对象的对象（有点绕口，意思就是这个意思）

这是中文版：http://taizilongxu.gitbooks.io/stackoverflow-about-python/content/1/README.html

## 10 `*args` and `**kwargs`

用`*args`和`**kwargs`只是为了方便并没有强制使用它们。

当你不确定你的函数里将要传递多少参数时你可以用`*args`. 例如，它可以传递任意数量的参数：

```python
>>> def print_everything(*args):
        for count, thing in enumerate(args):
...         print '{0}. {1}'.format(count, thing)
...
>>> print_everything('apple', 'banana', 'cabbage')
0. apple
1. banana
2. cabbage
```

相似的，`**kwargs`允许你使用没有事先定义的参数名：

```python
>>> def table_things(**kwargs):
...     for name, value in kwargs.items():
...         print '{0} = {1}'.format(name, value)
...
>>> table_things(apple = 'fruit', cabbage = 'vegetable')
cabbage = vegetable
apple = fruit
```

你也可以混着用。命名参数首先获得参数值然后所有的其他参数都传递给`*args`和`**kwargs`. 命名参数在列表的最前端。例如：

```
def table_things(titlestring, **kwargs)
```

`*args`和`**kwargs`可以同时在函数的定义中，但是`*args`必须在`**kwargs`前面。

当调用函数时你也可以用`*`和`**`语法。例如：

```python
>>> def print_three_things(a, b, c):
...     print 'a = {0}, b = {1}, c = {2}'.format(a,b,c)
...
>>> mylist = ['aardvark', 'baboon', 'cat']
>>> print_three_things(*mylist)

a = aardvark, b = baboon, c = cat
```

就像你看到的一样，它可以传递列表（或者元组）的每一项并把它们解包。注意必须与它们在函数里的参数相吻合。当然，你也可以在函数定义或者函数调用时用*.

http://stackoverflow.com/questions/3394835/args-and-kwargs

## 11 面向切面编程 AOP 和装饰器

这个 AOP 一听起来有点懵，同学面阿里的时候就被问懵了...

装饰器是一个很著名的设计模式，经常被用于有切面需求的场景，较为经典的有插入日志、性能测试、事务处理等。装饰器是解决这类问题的绝佳设计，有了装饰器，我们就可以抽离出大量函数中与函数功能本身无关的雷同代码并继续重用。概括的讲，**装饰器的作用就是为已经存在的对象添加额外的功能。**

这个问题比较大，推荐：http://stackoverflow.com/questions/739654/how-can-i-make-a-chain-of-function-decorators-in-python

中文：http://taizilongxu.gitbooks.io/stackoverflow-about-python/content/3/README.html

## 12 鸭子类型

“当看到一只鸟走起来像鸭子、游泳起来像鸭子、叫起来也像鸭子，那么这只鸟就可以被称为鸭子。”

我们并不关心对象是什么类型，到底是不是鸭子，只关心行为。

比如在 python 中，有很多 file-like 的东西，比如 StringIO,GzipFile,socket。它们有很多相同的方法，我们把它们当作文件使用。

又比如 list.extend() 方法中，我们并不关心它的参数是不是 list, 只要它是可迭代的，所以它的参数可以是 list/tuple/dict/ 字符串 / 生成器等。

鸭子类型在动态语言中经常使用，非常灵活，使得 python 不想 java 那样专门去弄一大堆的设计模式。

## 13 Python 中重载

引自知乎：http://www.zhihu.com/question/20053359

函数重载主要是为了解决两个问题。

1. 可变参数类型。
2. 可变参数个数。

另外，一个基本的设计原则是，仅仅当两个函数除了参数类型和参数个数不同以外，其功能是完全相同的，此时才使用函数重载，如果两个函数的功能其实不同，那么不应当使用重载，而应当使用一个名字不同的函数。

好吧，那么对于情况 1 ，函数功能相同，但是参数类型不同，python 如何处理？答案是根本不需要处理，因为 python 可以接受任何类型的参数，如果函数的功能相同，那么不同的参数类型在 python 中很可能是相同的代码，没有必要做成两个不同函数。

那么对于情况 2 ，函数功能相同，但参数个数不同，python 如何处理？大家知道，答案就是缺省参数。对那些缺少的参数设定为缺省参数即可解决问题。因为你假设函数功能相同，那么那些缺少的参数终归是需要用的。

好了，鉴于情况 1 跟 情况 2 都有了解决方案，python 自然就不需要函数重载了。

## 14 新式类和旧式类

这个面试官问了，我说了老半天，不知道他问的真正意图是什么。

[stackoverflow](http://stackoverflow.com/questions/54867/what-is-the-difference-between-old-style-and-new-style-classes-in-python)

这篇文章很好的介绍了新式类的特性：http://www.cnblogs.com/btchenguang/archive/2012/09/17/2689146.html

新式类很早在 2.2 就出现了，所以旧式类完全是兼容的问题，Python3 里的类全部都是新式类。这里有一个 MRO 问题可以了解下（新式类是广度优先，旧式类是深度优先）,《Python 核心编程》里讲的也很多。

## 15 `__new__`和`__init__`的区别

这个`__new__`确实很少见到，先做了解吧。

1. `__new__`是一个静态方法，而`__init__`是一个实例方法。
2. `__new__`方法会返回一个创建的实例，而`__init__`什么都不返回。
3. 只有在`__new__`返回一个 cls 的实例时后面的`__init__`才能被调用。
3. 当创建一个新实例时调用`__new__`, 初始化一个实例时用`__init__`.

[stackoverflow](http://stackoverflow.com/questions/674304/pythons-use-of-new-and-init)

ps: `__metaclass__`是创建类时起作用。所以我们可以分别使用`__metaclass__`,`__new__`和`__init__`来分别在类创建，实例创建和实例初始化的时候做一些小手脚。

## 16 单例模式

这个绝对常考啊。绝对要记住 1~2 个方法，当时面试官是让手写的。

### 1 使用`__new__`方法

```python
class Singleton(object):
    def __new__(cls, *args, **kw):
        if not hasattr(cls, '_instance'):
            orig = super(Singleton, cls)
            cls._instance = orig.__new__(cls, *args, **kw)
        return cls._instance

class MyClass(Singleton):
    a = 1

one = MyClass()
two = MyClass()

two.a = 3
print one.a
# 3
print id(one)
# 399998
print id(two)
# 399998
print one == two
# True
print one is two
# true
```

### 2 共享属性

创建实例时把所有实例的`__dict__`指向同一个字典，这样它们具有相同的属性和方法。

```python

class Borg(object):
    _state = {}
    def __new__(cls, *args, **kw):
        ob = super(Borg, cls).__new__(cls, *args, **kw)
        ob.__dict__ = cls._state
        return ob

class MyClass2(Borg):
    a = 1

one = MyClass()
two = MyClass()

two.a = 3
print one.a
# 3
print id(one)
# 399242
print id(two)
# 399998
print one == two
# False
print one is two
# False

print id(one.__dict__)
# 30104000
print id(two.__dict__)
# 30104000
```
### 3 metaclass 版本

```python
class Singleton(type):
	def __init__(cls, name, bases, dict):
		super(Singleton,cls).__init__(name, bases, dict)
		cls._instance = None
	def __call__(cls, *args, **kw):
		if cls._instance is None:
			cls._instance = super(Singleton, cls).__call__(*args, **kw)
		return cls._instance

class Myclass(object):
	__metaclass__ = Singleton

one = MyClass()
two = MyClass()

two.a = 3
print one.a
# 3
print id(one)
# 399242
print id(two)
# 399242
print one == two
# True
print one is two
# True

```

### 4 装饰器版本



```python
def singleton(cls, *args, **kw):
    instances = {}
    def getinstance():
        if cls not in instances:
            instances[cls] = cls(*args, **kw)
        return instances[cls]
    return getinstance

@singleton
class MyClass:
	a = 1
	def __init__(self, x=0):
		self.x = x


one = MyClass()
two = MyClass()

two.a = 3
print one.a
# 3
print id(one)
# 399242
print id(two)
# 399242
print one == two
# True
print one is two
# True

one.x = 1
print one.x
# 1
print two.x
# 1

```

### 5 import 方法

作为 python 的模块是天然的单例模式

```python
# mysingleton.py
class My_Singleton(object):
    def foo(self):
        pass

my_singleton = My_Singleton()

# to use
from mysingleton import my_singleton

my_singleton.foo()

```

## 17 Python 中的作用域

Python 中，一个变量的作用域总是由在代码中被赋值的地方所决定的。

当 Python 遇到一个变量的话他会按照这样的顺序进行搜索：

本地作用域（Local）→当前作用域被嵌入的本地作用域（Enclosing locals）→全局 / 模块作用域（Global）→内置作用域（Built-in）

## 18 GIL 线程全局锁

线程全局锁 (Global Interpreter Lock), 即 Python 为了保证线程安全而采取的独立线程运行的限制，说白了就是一个核只能在同一时间运行一个线程。

见 [Python 最难的问题](http://www.oschina.net/translate/pythons-hardest-problem)

解决办法就是多进程和下面的协程（协程也只是单 CPU, 但是能减小切换代价提升性能）.

## 19 协程

知乎被问到了，呵呵哒，跪了

简单点说协程是进程和线程的升级版，进程和线程都面临着内核态和用户态的切换问题而耗费许多切换时间，而协程就是用户自己控制切换的时机，不再需要陷入系统的内核态。

Python 里最常见的 yield 就是协程的思想！可以查看第九个问题。

- yield
- send
- yield from
	重构生成器的作用
- asyncio
	- 编程模型就是一个消息循环。我们从 asyncio 模块中直接获取一个 EventLoop 的引用，然后把需要执行的协程扔到 EventLoop 中执行，就实现了异步 IO
	- @asyncio.coroutine
		- 把一个 generator 标记为 coroutine 类型，然后，我们就把这个 coroutine 扔到 EventLoop 中执行
	- asyncio.sleep()
		- 也是一个 coroutine，所以线程不会等待 asyncio.sleep()，而是直接中断并执行下一个消息循环。当 asyncio.sleep() 返回时，线程就可以从 yield from 拿到返回值（此处是 None），然后接着执行下一行语句



## 20 闭包

闭包 (closure) 是函数式编程的重要的语法结构。闭包也是一种组织代码的结构，它同样提高了代码的可重复使用性。

当一个内嵌函数引用其外部作作用域的变量，我们就会得到一个闭包。总结一下，创建一个闭包必须满足以下几点：

1. 必须有一个内嵌函数
2. 内嵌函数必须引用外部函数中的变量
3. 外部函数的返回值必须是内嵌函数

感觉闭包还是有难度的，几句话是说不明白的，还是查查相关资料。

重点是函数运行后并不会被撤销，就像 16 题的 instance 字典一样，当函数运行完后，instance 并不被销毁，而是继续留在内存空间里。这个功能类似类里的类变量，只不过迁移到了函数上。

闭包就像个空心球一样，你知道外面和里面，但你不知道中间是什么样。

## 21 lambda 函数

其实就是一个匿名函数，为什么叫 lambda? 因为和后面的函数式编程有关。
lambda 函数可以接受任意个参数，包括可选参数，但是表达式只能有一个

推荐：[知乎](http://www.zhihu.com/question/20125256)

```python
g = lambda x, y: x*y
g(3, 4)
# 12
g = lambda x, y=0, z=0: x + y + z
g(1)
# 1
g(1,2,3)
# 6
# 或者直接使用
(lambda x, y=0, z=0: x + y + z)(3, 5, 6)
# 14
```
## python 如何进行类型转换
python 提供将变量或值从一种类型转换成另一种类型的内置函数，int 函数能够将符合数学格式数字型字符串转化为整数，否则返回错误信息
```
int("34")
# 34
int("123dad")
# valueError
int(34.24)
# 34
int(-2.43)
# -2
float("12")
# 12.0
float("12.111")
# 12.111
str(98)
'98'
int(x, [, base])
long(x, [, base])
float(x)
complex(real [,img])
str(x)
repr(x) # 将 x 转化为表达式字符串
eval(str) # 用于计算在字符串中的有效 python 表达式，返回一个对象

chr(x) # 讲着整数转化为一个字符
unichr(x) # 将一个整数转化为 Unicode 字符
ord(x) # 将字符转为整数值
hex(x) # 将整数转为 16 进制字符串
oct(x) # 将整数转化为一个 8 进行字符串
```
## 22 Python 函数式编程

这个需要适当的了解一下吧，毕竟函数式编程在 Python 中也做了引用。

推荐：[酷壳](http://coolshell.cn/articles/10822.html)

python 中函数式编程支持：

filter 函数的功能相当于过滤器。调用一个布尔函数`bool_func`来迭代遍历每个 seq 中的元素；返回一个使`bool_seq`返回值为 true 的元素的序列。

```python
>>>a = [1,2,3,4,5,6,7]
>>>b = filter(lambda x: x > 5, a)
>>>print b
>>>[6,7]
```

map 函数是对一个序列的每个项依次执行函数，下面是对一个序列每个项都乘以 2：

```python
>>> a = map(lambda x:x*2,[1,2,3])
>>> list(a)
[2, 4, 6]
```

reduce 函数是对一个序列的每个项迭代调用函数，下面是求 3 的阶乘：

```python
>>> reduce(lambda x,y:x*y,range(1,4))
6
```

## 23 Python 里的拷贝

引用和 copy(),deepcopy() 的区别

```python
import copy
a = [1, 2, 3, 4, ['a', 'b']]  #原始对象

b = a  #赋值，传对象的引用
c = copy.copy(a)  #对象拷贝，浅拷贝
d = copy.deepcopy(a)  #对象拷贝，深拷贝

a.append(5)  #修改对象 a
a[4].append('c')  #修改对象 a 中的 ['a', 'b'] 数组对象

print 'a = ', a
print 'b = ', b
print 'c = ', c
print 'd = ', d

输出结果：
a =  [1, 2, 3, 4, ['a', 'b', 'c'], 5]
b =  [1, 2, 3, 4, ['a', 'b', 'c'], 5]
c =  [1, 2, 3, 4, ['a', 'b', 'c']]
d =  [1, 2, 3, 4, ['a', 'b']]
```
## python 如何进行内存管理
python 内存管理是有 python 解释器负责的
## 24 Python 垃圾回收机制

Python GC 主要使用引用计数（reference counting）来跟踪和回收垃圾。在引用计数的基础上，通过“标记 - 清除”（mark and sweep）解决容器对象可能产生的循环引用问题，通过“分代回收”（generation collection）以空间换时间的方法提高垃圾回收效率。

### 1 引用计数

PyObject 是每个对象必有的内容，其中`ob_refcnt`就是做为引用计数。当一个对象有新的引用时，它的`ob_refcnt`就会增加，当引用它的对象被删除，它的`ob_refcnt`就会减少。引用计数为 0 时，该对象生命就结束了。

优点：

1. 简单
2. 实时性

缺点：

1. 维护引用计数消耗资源
2. 循环引用

### 2 标记 - 清除机制

基本思路是先按需分配，等到没有空闲内存的时候从寄存器和程序栈上的引用出发，遍历以对象为节点、以引用为边构成的图，把所有可以访问到的对象打上标记，然后清扫一遍内存空间，把所有没标记的对象释放。

### 3 分代技术

分代回收的整体思想是：将系统中的所有内存块根据其存活时间划分为不同的集合，每个集合就成为一个“代”，垃圾收集频率随着“代”的存活时间的增大而减小，存活时间通常利用经过几次垃圾回收来度量。

Python 默认定义了三代对象集合，索引数越大，对象存活时间越长。

举例：
当某些内存块 M 经过了 3 次垃圾收集的清洗之后还存活时，我们就将内存块 M 划到一个集合 A 中去，而新分配的内存都划分到集合 B 中去。当垃圾收集开始工作时，大多数情况都只对集合 B 进行垃圾回收，而对集合 A 进行垃圾回收要隔相当长一段时间后才进行，这就使得垃圾收集机制需要处理的内存少了，效率自然就提高了。在这个过程中，集合 B 中的某些内存块由于存活时间长而会被转移到集合 A 中，当然，集合 A 中实际上也存在一些垃圾，这些垃圾的回收会因为这种分代的机制而被延迟。

## 25 Python 的 List

推荐：http://www.jianshu.com/p/J4U6rR

## 26 Python 的 is

is 是对比地址，== 是对比值

## 27 read,readline 和 readlines

* read        读取整个文件
* readline    读取下一行，使用生成器方法
* readlines   读取整个文件到一个迭代器以供我们遍历

## 28 Python2 和 3 的区别
推荐：[Python 2.7.x 与 Python 3.x 的主要差异](http://chenqx.github.io/2014/11/10/Key-differences-between-Python-2-7-x-and-Python-3-x/)

## 29 super init
super() lets you avoid referring to the base class explicitly, which can be nice. But the main advantage comes with multiple inheritance, where all sorts of fun stuff can happen. See the standard docs on super if you haven't already.

Note that the syntax changed in Python 3.0: you can just say super().`__init__`() instead of super(ChildB, self).`__init__`() which IMO is quite a bit nicer.

http://stackoverflow.com/questions/576169/understanding-python-super-with-init-methods

## 30 range and xrange
都在循环时使用，xrange 内存性能更好。
for i in range(0, 20):
for i in xrange(0, 20):
What is the difference between range and xrange functions in Python 2.X?
 range creates a list, so if you do range(1, 10000000) it creates a list in memory with 9999999 elements.
 xrange is a sequence object that evaluates lazily.

http://stackoverflow.com/questions/94935/what-is-the-difference-between-range-and-xrange-functions-in-python-2-x

# 操作系统

## 1 select,poll 和 epoll

其实所有的 I/O 都是轮询的方法，只不过实现的层面不同罢了。

这个问题可能有点深入了，但相信能回答出这个问题是对 I/O 多路复用有很好的了解了。其中 tornado 使用的就是 epoll 的。

[selec,poll 和 epoll 区别总结](http://www.cnblogs.com/Anker/p/3265058.html)

基本上 select 有 3 个缺点：

1. 连接数受限
2. 查找配对速度慢
3. 数据由内核拷贝到用户态

poll 改善了第一个缺点

epoll 改了三个缺点。

关于 epoll 的：http://www.cnblogs.com/my_life/articles/3968782.html

## 2 调度算法

1. 先来先服务 (FCFS, First Come First Serve)
2. 短作业优先 (SJF, Shortest Job First)
3. 最高优先权调度 (Priority Scheduling)
4. 时间片轮转 (RR, Round Robin)
5. 多级反馈队列调度 (multilevel feedback queue scheduling)

实时调度算法：

1. 最早截至时间优先 EDF
2. 最低松弛度优先 LLF

## 3 死锁
原因：

1. 竞争资源
2. 程序推进顺序不当

必要条件：

1. 互斥条件
2. 请求和保持条件
3. 不剥夺条件
4. 环路等待条件

处理死锁基本方法：

1. 预防死锁（摒弃除 1 以外的条件）
2. 避免死锁（银行家算法）
3. 检测死锁（资源分配图）
4. 解除死锁
    1. 剥夺资源
    2. 撤销进程


## 4 程序编译与链接

推荐：http://www.ruanyifeng.com/blog/2014/11/compiler.html

Bulid 过程可以分解为 4 个步骤：预处理 (Prepressing), 编译 (Compilation)、汇编 (Assembly)、链接 (Linking)

以 c 语言为例：

### 1 预处理

预编译过程主要处理那些源文件中的以“#”开始的预编译指令，主要处理规则有：

1. 将所有的“#define”删除，并展开所用的宏定义
2. 处理所有条件预编译指令，比如“#if”、“#ifdef”、 “#elif”、“#endif”
3. 处理“#include”预编译指令，将被包含的文件插入到该编译指令的位置，注：此过程是递归进行的
4. 删除所有注释
5. 添加行号和文件名标识，以便于编译时编译器产生调试用的行号信息以及用于编译时产生编译错误或警告时可显示行号
6. 保留所有的#pragma 编译器指令。

### 2 编译

编译过程就是把预处理完的文件进行一系列的词法分析、语法分析、语义分析及优化后生成相应的汇编代码文件。这个过程是整个程序构建的核心部分。

### 3 汇编

汇编器是将汇编代码转化成机器可以执行的指令，每一条汇编语句几乎都是一条机器指令。经过编译、链接、汇编输出的文件成为目标文件 (Object File)

### 4 链接

链接的主要内容就是把各个模块之间相互引用的部分处理好，使各个模块可以正确的拼接。
链接的主要过程包块 地址和空间的分配（Address and Storage Allocation）、符号决议 (Symbol Resolution) 和重定位 (Relocation) 等步骤。

## 5 静态链接和动态链接

静态链接方法：静态链接的时候，载入代码就会把程序会用到的动态代码或动态代码的地址确定下来
静态库的链接可以使用静态链接，动态链接库也可以使用这种方法链接导入库

动态链接方法：使用这种方式的程序并不在一开始就完成动态链接，而是直到真正调用动态库代码时，载入程序才计算（被调用的那部分）动态代码的逻辑地址，然后等到某个时候，程序又需要调用另外某块动态代码时，载入程序又去计算这部分代码的逻辑地址，所以，这种方式使程序初始化时间较短，但运行期间的性能比不上静态链接的程序

## 6 虚拟内存技术

虚拟存储器是指具有请求调入功能和置换功能，能从逻辑上对内存容量加以扩充的一种存储系统。

## 7 分页和分段

分页：用户程序的地址空间被划分成若干固定大小的区域，称为“页”，相应地，内存空间分成若干个物理块，页和块的大小相等。可将用户程序的任一页放在内存的任一块中，实现了离散分配。

分段：将用户程序地址空间分成若干个大小不等的段，每段可以定义一组相对完整的逻辑信息。存储分配时，以段为单位，段与段在内存中可以不相邻接，也实现了离散分配。

### 分页与分段的主要区别

1. 页是信息的物理单位，分页是为了实现非连续分配，以便解决内存碎片问题，或者说分页是由于系统管理的需要。段是信息的逻辑单位，它含有一组意义相对完整的信息，分段的目的是为了更好地实现共享，满足用户的需要。
2. 页的大小固定，由系统确定，将逻辑地址划分为页号和页内地址是由机器硬件实现的。而段的长度却不固定，决定于用户所编写的程序，通常由编译程序在对源程序进行编译时根据信息的性质来划分。
3. 分页的作业地址空间是一维的。分段的地址空间是二维的。

## 8 页面置换算法

1. 最佳置换算法 OPT: 不可能实现
2. 先进先出 FIFO
3. 最近最久未使用算法 LRU: 最近一段时间里最久没有使用过的页面予以置换。
4. clock 算法

## 9 边沿触发和水平触发

边缘触发是指每当状态变化时发生一个 io 事件，条件触发是只要满足条件就发生一个 io 事件

# 数据库

## 1 事务

数据库事务 (Database Transaction) ，是指作为单个逻辑工作单元执行的一系列操作，要么完全地执行，要么完全地不执行。

## 2 数据库索引

推荐：http://tech.meituan.com/mysql-index.html

[MySQL 索引背后的数据结构及算法原理](http://blog.codinglabs.org/articles/theory-of-mysql-index.html)

聚集索引，非聚集索引，B-Tree,B+Tree, 最左前缀原理


## 3 Redis 原理


## 4 乐观锁和悲观锁

悲观锁：假定会发生并发冲突，屏蔽一切可能违反数据完整性的操作

乐观锁：假设不会发生并发冲突，只在提交操作时检查是否违反数据完整性。

## 5 MVCC


## 6 MyISAM 和 InnoDB

MyISAM 适合于一些需要大量查询的应用，但其对于有大量写操作并不是很好。甚至你只是需要 update 一个字段，整个表都会被锁起来，而别的进程，就算是读进程都无法操作直到读操作完成。另外，MyISAM 对于 SELECT COUNT(*) 这类的计算是超快无比的。

InnoDB 的趋势会是一个非常复杂的存储引擎，对于一些小的应用，它会比 MyISAM 还慢。他是它支持“行锁” ，于是在写操作比较多的时候，会更优秀。并且，他还支持更多的高级应用，比如：事务。

# 网络

## 1 三次握手

1. 客户端通过向服务器端发送一个 SYN 来创建一个主动打开，作为三路握手的一部分。客户端把这段连接的序号设定为随机数 A。
2. 服务器端应当为一个合法的 SYN 回送一个 SYN/ACK。ACK 的确认码应为 A+1，SYN/ACK 包本身又有一个随机序号 B。
3. 最后，客户端再发送一个 ACK。当服务端受到这个 ACK 的时候，就完成了三路握手，并进入了连接创建状态。此时包序号被设定为收到的确认号 A+1，而响应则为 B+1。

## 2 四次挥手

_注意：中断连接端可以是客户端，也可以是服务器端。下面仅以客户端断开连接举例，反之亦然._

1. 客户端发送一个数据分段，其中的 FIN 标记设置为 1. 客户端进入 FIN-WAIT 状态。该状态下客户端只接收数据，不再发送数据。
2. 服务器接收到带有 FIN = 1 的数据分段，发送带有 ACK = 1 的剩余数据分段，确认收到客户端发来的 FIN 信息。
3. 服务器等到所有数据传输结束，向客户端发送一个带有 FIN = 1 的数据分段，并进入 CLOSE-WAIT 状态，等待客户端发来带有 ACK = 1 的确认报文。
4. 客户端收到服务器发来带有 FIN = 1 的报文，返回 ACK = 1 的报文确认，为了防止服务器端未收到需要重发，进入 TIME-WAIT 状态。服务器接收到报文后关闭连接。客户端等待 2MSL 后未收到回复，则认为服务器成功关闭，客户端关闭连接。

## 3 ARP 协议

地址解析协议 (Address Resolution Protocol)，其基本功能为透过目标设备的 IP 地址，查询目标的 MAC 地址，以保证通信的顺利进行。它是 IPv4 网络层必不可少的协议，不过在 IPv6 中已不再适用，并被邻居发现协议（NDP）所替代。

## 4 urllib 和 urllib2 的区别

这个面试官确实问过，当时答的 urllib2 可以 Post 而 urllib 不可以。

1. urllib 提供 urlencode 方法用来 GET 查询字符串的产生，而 urllib2 没有。这是为何 urllib 常和 urllib2 一起使用的原因。
2. urllib2 可以接受一个 Request 类的实例来设置 URL 请求的 headers，urllib 仅可以接受 URL。这意味着，你不可以伪装你的 User Agent 字符串等。


## 5 Post 和 Get
[GET 和 POST 有什么区别？及为什么网上的多数答案都是错的](http://www.cnblogs.com/nankezhishi/archive/2012/06/09/getandpost.html)
[知乎回答](https://www.zhihu.com/question/31640769?rf=37401322)

get: [RFC 2616 - Hypertext Transfer Protocol -- HTTP/1.1](http://tools.ietf.org/html/rfc2616#section-9.3)
post: [RFC 2616 - Hypertext Transfer Protocol -- HTTP/1.1](http://tools.ietf.org/html/rfc2616#section-9.5)



## 6 Cookie 和 Session

||Cookie|Session|
|:--|:--|:--|
|储存位置|客户端|服务器端|
|目的|跟踪会话，也可以保存用户偏好设置或者保存用户名密码等|跟踪会话|
|安全性|不安全|安全|

session 技术是要使用到 cookie 的，之所以出现 session 技术，主要是为了安全。

## 7 apache 和 nginx 的区别

nginx 相对 apache 的优点：
* 轻量级，同样起 web 服务，比 apache 占用更少的内存及资源
* 抗并发，nginx 处理请求是异步非阻塞的，支持更多的并发连接，而 apache 则是阻塞型的，在高并发下 nginx 能保持低资源低消耗高性能
* 配置简洁
* 高度模块化的设计，编写模块相对简单
* 社区活跃

apache 相对 nginx 的优点：
* rewrite ，比 nginx 的 rewrite 强大
* 模块超多，基本想到的都可以找到
* 少 bug ，nginx 的 bug 相对较多
* 超稳定

## 8 网站用户密码保存

1. 明文保存
2. 明文 hash 后保存，如 md5
3. MD5+Salt 方式，这个 salt 可以随机
4. 知乎使用了 Bcrypy（好像）加密

## 9 HTTP 和 HTTPS


|状态码|定义|
|:--|:--|
|1xx 报告|接收到请求，继续进程|
|2xx 成功|步骤成功接收，被理解，并被接受|
|3xx 重定向|为了完成请求，必须采取进一步措施|
|4xx 客户端出错|请求包括错的顺序或不能完成|
|5xx 服务器出错|服务器无法完成显然有效的请求|

403: Forbidden
404: Not Found

HTTPS 握手，对称加密，非对称加密，TLS/SSL,RSA

## 10 XSRF 和 XSS

* CSRF(Cross-site request forgery) 跨站请求伪造
* XSS(Cross Site Scripting) 跨站脚本攻击

CSRF 重点在请求，XSS 重点在脚本

## 11 幂等 Idempotence

HTTP 方法的幂等性是指一次和多次请求某一个资源应该具有同样的**副作用**。（注意是副作用）

`GET http://www.bank.com/account/123456`，不会改变资源的状态，不论调用一次还是 N 次都没有副作用。请注意，这里强调的是一次和 N 次具有相同的副作用，而不是每次 GET 的结果相同。`GET http://www.news.com/latest-news`这个 HTTP 请求可能会每次得到不同的结果，但它本身并没有产生任何副作用，因而是满足幂等性的。

DELETE 方法用于删除资源，有副作用，但它应该满足幂等性。比如：`DELETE http://www.forum.com/article/4231`，调用一次和 N 次对系统产生的副作用是相同的，即删掉 id 为 4231 的帖子；因此，调用者可以多次调用或刷新页面而不必担心引起错误。


POST 所对应的 URI 并非创建的资源本身，而是资源的接收者。比如：`POST http://www.forum.com/articles`的语义是在`http://www.forum.com/articles`下创建一篇帖子，HTTP 响应中应包含帖子的创建状态以及帖子的 URI。两次相同的 POST 请求会在服务器端创建两份资源，它们具有不同的 URI；所以，POST 方法不具备幂等性。

PUT 所对应的 URI 是要创建或更新的资源本身。比如：`PUT http://www.forum/articles/4231`的语义是创建或更新 ID 为 4231 的帖子。对同一 URI 进行多次 PUT 的副作用和一次 PUT 是相同的；因此，PUT 方法具有幂等性。


## 12 RESTful 架构 (SOAP,RPC)

推荐：http://www.ruanyifeng.com/blog/2011/09/restful.html


## 13 SOAP

SOAP（原为 Simple Object Access Protocol 的首字母缩写，即简单对象访问协议）是交换数据的一种协议规范，使用在计算机网络 Web 服务（web service）中，交换带结构信息。SOAP 为了简化网页服务器（Web Server）从 XML 数据库中提取数据时，节省去格式化页面时间，以及不同应用程序之间按照 HTTP 通信协议，遵从 XML 格式执行资料互换，使其抽象于语言实现、平台和硬件。

## 14 RPC

RPC（Remote Procedure Call Protocol）——远程过程调用协议，它是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。RPC 协议假定某些传输协议的存在，如 TCP 或 UDP，为通信程序之间携带信息数据。在 OSI 网络通信模型中，RPC 跨越了传输层和应用层。RPC 使得开发包括网络分布式多程序在内的应用程序更加容易。

总结：服务提供的两大流派。传统意义以方法调用为导向通称 RPC。为了企业 SOA, 若干厂商联合推出 webservice, 制定了 wsdl 接口定义，传输 soap. 当互联网时代，臃肿 SOA 被简化为 http+xml/json. 但是简化出现各种混乱。以资源为导向，任何操作无非是对资源的增删改查，于是统一的 REST 出现了。

进化的顺序：RPC -> SOAP -> RESTful

## 15 CGI 和 WSGI
CGI 是通用网关接口，是连接 web 服务器和应用程序的接口，用户通过 CGI 来获取动态数据或文件等。
CGI 程序是一个独立的程序，它可以用几乎所有语言来写，包括 perl，c，lua，python 等等。

WSGI, Web Server Gateway Interface，是 Python 应用程序或框架和 Web 服务器之间的一种接口，WSGI 的其中一个目的就是让用户可以用统一的语言 (Python) 编写前后端。

官方说明：[PEP-3333](https://www.python.org/dev/peps/pep-3333/)

## 16 中间人攻击

在 GFW 里屡见不鲜的，呵呵。

中间人攻击（Man-in-the-middle attack，通常缩写为 MITM）是指攻击者与通讯的两端分别创建独立的联系，并交换其所收到的数据，使通讯的两端认为他们正在通过一个私密的连接与对方直接对话，但事实上整个会话都被攻击者完全控制。

## 17 c10k 问题

所谓 c10k 问题，指的是服务器同时支持成千上万个客户端的问题，也就是 concurrent 10 000 connection（这也是 c10k 这个名字的由来）。
推荐：http://www.kegel.com/c10k.html

## 18 socket

推荐：http://www.360doc.com/content/11/0609/15/5482098_122692444.shtml

Socket=Ip address+ TCP/UDP + port

## 19 浏览器缓存

推荐：http://www.cnblogs.com/skynet/archive/2012/11/28/2792503.html

304 Not Modified

## 20 HTTP1.0 和 HTTP1.1

推荐：http://blog.csdn.net/elifefly/article/details/3964766

1. 请求头 Host 字段，一个服务器多个网站
2. 长链接
3. 文件断点续传
3. 身份认证，状态管理，Cache 缓存

## 21 Ajax
AJAX,Asynchronous JavaScript and XML（异步的 JavaScript 和 XML）, 是与在不重新加载整个页面的情况下，与服务器交换数据并更新部分网页的技术。

# *NIX

## unix 进程间通信方式 (IPC)

1. 管道（Pipe）：管道可用于具有亲缘关系进程间的通信，允许一个进程和另一个与它有共同祖先的进程之间进行通信。
2. 命名管道（named pipe）：命名管道克服了管道没有名字的限制，因此，除具有管道所具有的功能外，它还允许无亲缘关系进程间的通信。命名管道在文件系统中有对应的文件名。命名管道通过命令 mkfifo 或系统调用 mkfifo 来创建。
3. 信号（Signal）：信号是比较复杂的通信方式，用于通知接受进程有某种事件发生，除了用于进程间通信外，进程还可以发送信号给进程本身；linux 除了支持 Unix 早期信号语义函数 sigal 外，还支持语义符合 Posix.1 标准的信号函数 sigaction（实际上，该函数是基于 BSD 的，BSD 为了实现可靠信号机制，又能够统一对外接口，用 sigaction 函数重新实现了 signal 函数）。
4. 消息（Message）队列：消息队列是消息的链接表，包括 Posix 消息队列 system V 消息队列。有足够权限的进程可以向队列中添加消息，被赋予读权限的进程则可以读走队列中的消息。消息队列克服了信号承载信息量少，管道只能承载无格式字节流以及缓冲区大小受限等缺
5. 共享内存：使得多个进程可以访问同一块内存空间，是最快的可用 IPC 形式。是针对其他通信机制运行效率较低而设计的。往往与其它通信机制，如信号量结合使用，来达到进程间的同步及互斥。
6. 内存映射（mapped memory）：内存映射允许任何多个进程间通信，每一个使用该机制的进程通过把一个共享的文件映射到自己的进程地址空间来实现它。
7. 信号量（semaphore）：主要作为进程间以及同一进程不同线程之间的同步手段。
8. 套接口（Socket）：更为一般的进程间通信机制，可用于不同机器之间的进程间通信。起初是由 Unix 系统的 BSD 分支开发出来的，但现在一般可以移植到其它类 Unix 系统上：Linux 和 System V 的变种都支持套接字。


# 数据结构

## 1 红黑树

红黑树与 AVL 的比较：

AVL 是严格平衡树，因此在增加或者删除节点的时候，根据不同情况，旋转的次数比红黑树要多；

红黑是用非严格的平衡来换取增删节点时候旋转次数的降低；

所以简单说，如果你的应用中，搜索的次数远远大于插入和删除，那么选择 AVL，如果搜索，插入删除次数几乎差不多，应该选择 RB。

# 编程题

## 1 台阶问题 / 斐波纳挈

一只青蛙一次可以跳上 1 级台阶，也可以跳上 2 级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

```python
fib = lambda n: n if n <= 2 else fib(n - 1) + fib(n - 2)
```

第二种记忆方法

```python
def memo(func):
    cache = {}
    def wrap(*args):
        if args not in cache:
            cache[args] = func(*args)
        return cache[args]
    return wrap


@memo
def fib(i):
    if i < 2:
        return 1
    return fib(i-1) + fib(i-2)
```

第三种方法

```python
def fib(n):
    a, b = 0, 1
    for _ in xrange(n):
        a, b = b, a + b
    return b
```

## 2 变态台阶问题

一只青蛙一次可以跳上 1 级台阶，也可以跳上 2 级……它也可以跳上 n 级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

```python
fib = lambda n: n if n < 2 else 2 * fib(n - 1)
```

## 3 矩形覆盖

我们可以用`2*1`的小矩形横着或者竖着去覆盖更大的矩形。请问用 n 个`2*1`的小矩形无重叠地覆盖一个`2*n`的大矩形，总共有多少种方法？

>第`2*n`个矩形的覆盖方法等于第`2*(n-1)`加上第`2*(n-2)`的方法。

```python
f = lambda n: 1 if n < 2 else f(n - 1) + f(n - 2)
```

## 4 杨氏矩阵查找

在一个 m 行 n 列二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

使用 Step-wise 线性搜索。

```python
def get_value(l, r, c):
    return l[r][c]

def find(l, x):
    m = len(l) - 1
    n = len(l[0]) - 1
    r = 0
    c = n
    while c >= 0 and r <= m:
        value = get_value(l, r, c)
        if value == x:
            return True
        elif value > x:
            c = c - 1
        elif value < x:
            r = r + 1
    return False
```

## 5 去除列表中的重复元素

用集合

```python
list(set(l))
```

用字典

```python
l1 = ['b','c','d','b','c','a','a']
l2 = {}.fromkeys(l1).keys()
print l2
```

用字典并保持顺序

```python
l1 = ['b','c','d','b','c','a','a']
l2 = list(set(l1))
l2.sort(key=l1.index)
print l2
```

列表推导式

```python
l1 = ['b','c','d','b','c','a','a']
l2 = []
[l2.append(i) for i in l1 if not i in l2]
```

面试官提到的，先排序然后删除。

## 6 链表成对调换

`1->2->3->4`转换成`2->1->4->3`.

```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # @param a ListNode
    # @return a ListNode
    def swapPairs(self, head):
        if head != None and head.next != None:
            next = head.next
            head.next = self.swapPairs(next.next)
            next.next = head
            return next
        return head
```

## 7 创建字典的方法

### 1 直接创建

```python
dict = {'name':'earth', 'port':'80'}
```

### 2 工厂方法

```python
items=[('name','earth'),('port','80')]
dict2=dict(items)
dict1=dict((['name','earth'],['port','80']))
```

### 3 fromkeys() 方法

```python
dict1={}.fromkeys(('x','y'),-1)
dict={'x':-1,'y':-1}
dict2={}.fromkeys(('x','y'))
dict2={'x':None, 'y':None}
```

## 8 合并两个有序列表

知乎远程面试要求编程

尾递归

```python
def _recursion_merge_sort2(l1, l2, tmp):
    if len(l1) == 0 or len(l2) == 0:
        tmp.extend(l1)
        tmp.extend(l2)
        return tmp
    else:
        if l1[0] < l2[0]:
            tmp.append(l1[0])
            del l1[0]
        else:
            tmp.append(l2[0])
            del l2[0]
        return _recursion_merge_sort2(l1, l2, tmp)

def recursion_merge_sort2(l1, l2):
    return _recursion_merge_sort2(l1, l2, [])
```

循环算法

```pyhton
def loop_merge_sort(l1, l2):
    tmp = []
    while len(l1) > 0 and len(l2) > 0:
        if l1[0] < l2[0]:
            tmp.append(l1[0])
            del l1[0]
        else:
            tmp.append(l2[0])
            del l2[0]
    tmp.extend(l1)
    tmp.extend(l2)
    return tmp
```

## 9 交叉链表求交点

去哪儿的面试，没做出来。

```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
def node(l1, l2):
    length1, lenth2 = 0, 0
    # 求两个链表长度
    while l1.next:
        l1 = l1.next
        length1 += 1
    while l2.next:
        l2 = l2.next
        length2 += 1
    # 长的链表先走
    if length1 > lenth2:
        for _ in range(length1 - length2):
            l1 = l1.next
    else:
        for _ in range(length2 - length1):
            l2 = l2.next
    while l1 and l2:
        if l1.next == l2.next:
            return l1.next
        else:
            l1 = l1.next
            l2 = l2.next
```

## 10 二分查找

```python
def binarySearch(l, t):
    low, high = 0, len(l) - 1
    while low < high:
        print low, high
        mid = (low + high) / 2
        if l[mid] > t:
            high = mid
        elif l[mid] < t:
            low = mid + 1
        else:
            return mid
    return low if l[low] == t else False

if __name__ == '__main__':
    l = [1, 4, 12, 45, 66, 99, 120, 444]
    print binarySearch(l, 12)
    print binarySearch(l, 1)
    print binarySearch(l, 13)
    print binarySearch(l, 444)
```

## 11 快排

```python
def qsort(seq):
    if seq==[]:
        return []
    else:
        pivot=seq[0]
        lesser=qsort([x for x in seq[1:] if x<pivot])
        greater=qsort([x for x in seq[1:] if x>=pivot])
        return lesser+[pivot]+greater

if __name__=='__main__':
    seq=[5,6,78,9,0,-1,2,3,-65,12]
    print(qsort(seq))
```

## 12 找零问题

```python
def  coinChange(values, money, coinsUsed):
    #values    T[1:n] 数组
    #valuesCounts   钱币对应的种类数
    #money  找出来的总钱数
    #coinsUsed   对应于目前钱币总数 i 所使用的硬币数目
    for cents in range(1, money+1):
        minCoins = cents     #从第一个开始到 money 的所有情况初始
        for value in values:
            if value <= cents:
                temp = coinsUsed[cents - value] + 1
                if temp < minCoins:
                    minCoins = temp
        coinsUsed[cents] = minCoins
        print('面值为：{0} 的最小硬币数目为：{1} '.format(cents, coinsUsed[cents]) )

if __name__ == '__main__':
    values = [ 25, 21, 10, 5, 1]
    money = 63
    coinsUsed = {i:0 for i in range(money+1)}
    coinChange(values, money, coinsUsed)
```

## 13 广度遍历和深度遍历二叉树

给定一个数组，构建二叉树，并且按层次打印这个二叉树

```python
## 14 二叉树节点
class Node(object):
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

tree = Node(1, Node(3, Node(7, Node(0)), Node(6)), Node(2, Node(5), Node(4)))

## 15 层次遍历
def lookup(root):
    stack = [root]
    while stack:
        current = stack.pop(0)
        print current.data
        if current.left:
            stack.append(current.left)
        if current.right:
            stack.append(current.right)
## 16 深度遍历
def deep(root):
    if not root:
        return
    print root.data
    deep(root.left)
    deep(root.right)

if __name__ == '__main__':
    lookup(tree)
    deep(tree)
```

## 17 前中后序遍历

深度遍历改变顺序就 OK 了

## 18 求最大树深

```python
def maxDepth(root):
        if not root:
            return 0
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
```

## 19 求两棵树是否相同

```python
def isSameTree(p, q):
    if p == None and q == None:
        return True
    elif p and q :
        return p.val == q.val and isSameTree(p.left,q.left) and isSameTree(p.right,q.right)
    else :
        return False
```

## 20 前序中序求后序

推荐：http://blog.csdn.net/hinyunsin/article/details/6315502

```python
def rebuild(pre, center):
    if not pre:
        return
    cur = Node(pre[0])
    index = center.index(pre[0])
    cur.left = rebuild(pre[1:index + 1], center[:index])
    cur.right = rebuild(pre[index + 1:], center[index + 1:])
    return cur

def deep(root):
    if not root:
        return
    deep(root.left)
    deep(root.right)
    print root.data
```

## 21 单链表逆置

```python
class Node(object):
    def __init__(self, data=None, next=None):
        self.data = data
        self.next = next

link = Node(1, Node(2, Node(3, Node(4, Node(5, Node(6, Node(7, Node(8, Node(9)))))))))

def rev(link):
    pre = link
    cur = link.next
    pre.next = None
    while cur:
        tmp = cur.next
        cur.next = pre
        pre = cur
        cur = tmp
    return pre

root = rev(link)
while root:
    print root.data
    root = root.next
```

## 22 两个字符串是否是变位词

```python
class Anagram:
    """
    @:param s1: The first string
    @:param s2: The second string
    @:return true or false
    """
    def Solution1(s1,s2):
        alist = list(s2)

        pos1 = 0
        stillOK = True

        while pos1 < len(s1) and stillOK:
            pos2 = 0
            found = False
            while pos2 < len(alist) and not found:
                if s1[pos1] == alist[pos2]:
                    found = True
                else:
                    pos2 = pos2 + 1

            if found:
                alist[pos2] = None
            else:
                stillOK = False

            pos1 = pos1 + 1

        return stillOK

    print(Solution1('abcd','dcba'))

    def Solution2(s1,s2):
        alist1 = list(s1)
        alist2 = list(s2)

        alist1.sort()
        alist2.sort()


        pos = 0
        matches = True

        while pos < len(s1) and matches:
            if alist1[pos] == alist2[pos]:
                pos = pos + 1
            else:
                matches = False

        return matches

    print(Solution2('abcde','edcbg'))

    def Solution3(s1,s2):
        c1 = [0]*26
        c2 = [0]*26

        for i in range(len(s1)):
            pos = ord(s1[i])-ord('a')
            c1[pos] = c1[pos] + 1

        for i in range(len(s2)):
            pos = ord(s2[i])-ord('a')
            c2[pos] = c2[pos] + 1

        j = 0
        stillOK = True
        while j<26 and stillOK:
            if c1[j] == c2[j]:
                j = j + 1
            else:
                stillOK = False

        return stillOK

    print(Solution3('apple','pleap'))

```


