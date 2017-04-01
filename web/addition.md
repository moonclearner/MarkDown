# code
unicode to utf-8:
unicode_str.encode('utf-8')

utf-8 to unicode:
utf_str.decode('utf-8')
unicode(utf_str, 'utf-8')

utf-8 变长码
unicode 2 个字节


# Its equal
a = 1
b = 2
id(a)
id(b)

# three unit cal
a = 3 if a == b else 4

# lambda
a = lambda x,y: x+y

# yield

# in-function
print dir()
print vars()
reload()

chr()
chr(97)
"a"
ord()

s = " i am {o} "
print s.format('djj')

apply(func, ('djj'))  # run function

map
filter(lambda x: x==1, [1,2,3]) # return [ture, false, false]
reduce(lambda x,y: x*y*10, [1,2,3])

## reflextion 反射
\_\_import\_\_()
hasattr()
delattr()
getattr()

import temp
It can treat 'temp' as variables
module = \_\_import\_\_('temp')
print dir(module)

val = hasattr(module, 'version')
val = getattr(module, 'version')
val()
run function
print val


## decorator
def wrapper(func):
	def result():
		func()
	return result


@wrapper
def foo():
	print 'foo'

foo()


### a instance
def Before(request, kargs):

def after(request, kargs)

def filter(Before_func, after_func)
	def outer(main_func):
		def wrapper(request, kargs):
			Before_func()
			main_func()
			after_func()
		return wrapper
	return outer

@filter(module.Before, module.after)
def synclist(request, kargs):

## callable

### exec
code = "for i range(0, 10):print i"
cmpcode = compile(code, '', 'single')
exec cmpcode

## inhert
isinstance()
issubclass()  是否是子类
super()   代用父类函数
staticmethod()  类的静态方法

## random
random.random()  # 0-1  0.1
random.randint(1, 2)    include 2
random.randrange(1, 2)  not include 2

## md5
import hashlib
hash = hashlib.md5()
hash.updata('admin')
print hash.hexdigest()

## date time
import time

print time.time
print time.mktime(time.localtime())

time.gmtime()
time.localtime()
time.strptime('2014-11-11', '$Y-%m-%d')

**current time**
time.strptime('%Y-%m-%d')
time.strptime('%Y-%m-%d', time.localtime())

time.asctime()
time.asctime(time.localtime()
time.ctime(time.time())

## os module

## re module

## sys module

## string module
