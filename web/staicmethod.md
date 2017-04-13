# dynamic and static function

```python
# 动态添加属性和方法
class Foo:
	Age = 18

	def __init__(self):
		"""docstring for __init__"""
		self.var = "djj"

	def Func1(self):
		"""docstring for Func1"""
		print "Func1"

	def Func3(self):
		"""docstring for Func3"""
		pass

	@staticmethod
	def Func4(self):
		"""docstring for Func4"""
		pass


def Test(arg):
	print 'test'
# 动态添加方法，只能添加动态方法
Foo.Func2 = Test
# excute function
f = Foo()
f.Func2()

# This is error because Func2 is dynamic function, but It is excute static function
Foo.Func2()

# It is ok
Foo.Func4

# add static attr
Foo.Num = 18
print Foo.Num

# add dynamic attr
f.Gen = "man"

```
# 经典类和新式类

## 新式类
### slots
```python
class Foo(object):
	__slots__ = ('name', 'age')

f = Foo()
f.name = 'djj'
print f.name

# It is error __slots__ control attr adding
f.address = "earth"
print f.address
```

### inheart

```python
# 经典类执行不会自动执行父类构造函数
# 新式类可以自动执行父类构造函数
class Fa(object):
# 新式类
	def __init__(self):
		"""docstring for __init__"""
		print "Fa.__init__"

class So(Fa):
	def __init__(self):
	# two method to run father function
	# 用于经典类
	# Fa.__init__(self)
		super(So, self).__init__()
		# super 必须使用新式类
		"""docstring for __init__"""
		print 'Sa.__init__'

s = So()
```

# look class' all father class
issubclass(C, B)  C is B sub class
isinstance(object, class_or_type_tuple)
```python
class A:
	pass
class B(A):
	pass
class C(A, B):
	pass
print C.__bases__

output: (<class __main__.A at 0x0216FFB8>, <class __main__.B at 0x021E1AB0>)

```
# __call__
```python
# __call__

class Foo:
	def __init__(self):
		"""docstring for __init__"""
		self.Name = "djj"

	def Func(self):
		"""docstring for Func"""
		print "Func"

	def __call__(self):
		print "f()"


f = Foo()
f.Func()
# __call__ excute
f()
```

# type()
```python
# type dynamic create class
class Foo:
	def __init__(self):
		"""docstring for __init__"""
		self.Name = "djj"

	def Func(self):
		"""docstring for Func"""
		print "Func"

	def __call__(self):
		print "f()"

print type(Foo) # classobj
f = Foo()
print type(f)  # instance
print type(type(f)) # type

# add attr and function
bar = type('bar', (object,), {'Name':"djj", "Func":func})

print bar # class
print bar.Name
bar.Func()
print dir(Bar) # show all function and attr
```

# type subclass create class
```python
class Mytype(type):
	def __init__(self, names, bases, dict):
		"""docstring for __init__"""
		print "create class"
		# self 是一个类或者类型

bar = Mytype('bar', (object,), {'Name':"djj", "Func":func})
print bar
print bar.Name
print dir(bar)
```
# metaclass
```python
class Foo:
    # metaclass 制定类进行创建
	__metaclass__ = Mytype
	def __init__(self):
		self.Name = "djj"
		# self 是一个对象
		print 'djj'
	def Func(self):
		print "Func"
	def __call__(self):
		print 'call'

f = Foo()

```

# new()
```python
# __new__
作用是实例化，生成一个对象
