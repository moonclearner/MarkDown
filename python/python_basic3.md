# pyhton基础知识 three

## 面向对象的编程

### self

Python中的self等价于C++中的self指针和Java、C#中的this参考。

### 创建一个类

```python
class Person:
	pass # An empty block
p = Person()
print p
```

输出

```
$ python simplestclass.py
<__main__.Person instance at 0xf6fcb18c>   #__main__模块中有了一个Person类的实例。
```

### 对象方法

```python
class Person:
	def sayHi(self):
		print 'Hello, how are you?'
p = Person()
p.sayHi()

# This short example can also be written as Person().sayHi()
```

注意sayHi方法没有任何参数，但仍然在函数定义时有self。

### \_\_init\_\_方法

\_\_init\_\_方法在类的一个对象被建立时，马上运行。这个方法可以用来对你的对象做一些你希望的 初始化 **即构造函数**

```python
class Person:
	def __init__(self, name):
		self.name = name
	def sayHi(self):
		print 'Hello, my name is', self.name
        
p = Person('Swaroop')
p.sayHi()
# This short example can also be written as Person('Swaroop').sayHi()
```

### 使用类与对象的变量

```python
class Person:
	'''Represents a person.'''
	population = 0
	def __init__(self, name):
		'''Initializes the person's data.'''
		self.name = name
		print '(Initializing %s)' % self.name
		# When this person is created, he/she
		# adds to the population
		Person.population += 1
	def __del__(self):
		'''I am dying.'''
		print '%s says bye.' % self.name
		Person.population -= 1
		if Person.population == 0:
			print 'I am the last one.'
		else:
			print 'There are still %d people left.' % Person.population
	def sayHi(self):
		'''Greeting by the person.       # docstring 使用
		
			Really, that's all it does.'''
		print 'Hi, my name is %s.' % self.name
        
	def howMany(self):
		'''Prints the current population.'''
		if Person.population == 1:
			print 'I am the only person here.'
		else:
			print 'We have %d persons here.' % Person.population
            
swaroop = Person('Swaroop')
swaroop.sayHi()
swaroop.howMany()

kalam = Person('Abdul Kalam')
kalam.sayHi()
kalam.howMany()

swaroop.sayHi()
swaroop.howMany()
```

输出

```python
(Initializing Swaroop)
Hi, my name is Swaroop.
I am the only person here.

(Initializing Abdul Kalam)
Hi, my name is Abdul Kalam.
We have 2 persons here.

Hi, my name is Swaroop.
We have 2 persons here.

Abdul Kalam says bye.
There are still 1 people left.
Swaroop says bye.
I am the last one.
```

population属于Person类，因此是一个类的变量。name变量属于对象（它使用self赋值）因此是对象的变量。

docstring对于类和方法同样有用。我们可以在运行时使用Person.\_\_doc\_\_和Person.sayHi.\_\_doc\_\_来分别访问类与方法的文档字符串。

特殊的方法\_\_del\_\_，它在对象消逝的时候被调用。对象消逝即对象不再被使用，它所占用的内存将返回给系统作它用。在这个方法里面，我们只是简单地把Person.population减1。

当对象不再被使用时，\_\_del\_\_方法运行，但是很难保证这个方法究竟在 什么时候 运行。如果你想要指明它的运行，你就得使用del语句，就如同我们在以前的例子中使用的那样。

**Python中所有的类成员（包括数据成员）都是 公共的 ，所有的方法都是 有效的**

只有一个例外：如果你使用的数据成员名称以 双下划线前缀 比如\_\_privatevar，Python的名称管理体系会有效地把它作为私有变量。这样就有一个惯例，如果某个变量只想在类或对象中使用，就应该以单下划线前缀。而其他的名称都将作为公共的，可以被其他类/对象使用。记住这只是一个惯例，并不是Python所要求的（与双下划线前缀不同）。同样，注意方法\_\_del\_\_与 destructor 的概念类似。

**类的变量其类的所有对象共同使用 比如example的population**

### 继承

SchoolMember类被称为 基本类 或 超类 。而Teacher和Student类被称为 导出类 或 子类 。

```python
class SchoolMember:
	'''Represents any school member.'''
	def __init__(self, name, age):
		self.name = name
		self.age = age
		print '(Initialized SchoolMember: %s)' % self.name
	
    def tell(self):
		'''Tell my details.'''
		print 'Name:"%s" Age:"%s"' % (self.name, self.age),

class Teacher(SchoolMember):
	'''Represents a teacher.'''
	def __init__(self, name, age, salary):
		SchoolMember.__init__(self, name, age)
		self.salary = salary
		print '(Initialized Teacher: %s)' % self.name

    def tell(self):
		SchoolMember.tell(self)
		print 'Salary: "%d"' % self.salary
class Student(SchoolMember):
	'''Represents a student.'''
	def __init__(self, name, age, marks):
		SchoolMember.__init__(self, name, age)
		self.marks = marks
		print '(Initialized Student: %s)' % self.name
	def tell(self):
		SchoolMember.tell(self)
		print 'Marks: "%d"' % self.marks

t = Teacher('Mrs. Shrividya', 40, 30000)
s = Student('Swaroop', 22, 75)

print # prints a blank line

members = [t, s]
for member in members:
	member.tell() # works for both Teachers and Students
```

输出

```python
(Initialized SchoolMember: Mrs. Shrividya)
(Initialized Teacher: Mrs. Shrividya)

(Initialized SchoolMember: Swaroop)
(Initialized Student: Swaroop)

Name:"Mrs. Shrividya" Age:"40" Salary: "30000"
Name:"Swaroop" Age:"22" Marks: "75"
```

**Python不会自动调用基本类的constructor，你得亲自专门调用它**

我们调用了子类型的tell方法，而不是SchoolMember类的tell方法。可以这样来理解，Python总是首先查找对应类型的方法，在这个例子中就是如此。如果它不能在导出类中找到对应的方法，它才开始到基本类中逐个查找。

基本类是在类定义的时候，在元组之中指明的。

一个术语的注释——如果在继承元组中列了一个以上的类，那么它就被称作 多重继承 。class Dog(Mammal, Runnable):

## 输入/输出

raw_input和print

```python
poem = '''\
Programming is fun
When the work is done
if you wanna make your work also fun:
use Python!
'''
f = file('poem.txt', 'w')  # open for 'w'riting
f.write(poem) 	# write text to file
f.close() 	# close the file
f = file('poem.txt')
# if no mode is specified, 'r'ead mode is assumed by default
while True:
	line = f.readline()
	if len(line) == 0: # Zero length indicates EOF
		break
	print line,
	# Notice comma to avoid automatic newline added by Python
f.close() # close the file
```

### 存储器

Python提供一个标准的模块，称为pickle。使用它你可以在一个文件中储存任何Python对象，之后你又可以把它完整无缺地取出来。这被称为 持久地 储存对象。

还有另一个模块称为cPickle，它的功能和pickle模块完全相同，只不过它是用C语言编写的，因此要快得多（比pickle1000倍）。你可以使用它们中的任一个，而我们在这里将使用cPickle模块。记住，我们把这两个模块都简称为pickle模块。

```python
import cPickle as p             #了import..as语法。这是一种便利方法，以便于我们可以使用更短的模块名称。
shoplistfile='shoplist.data'

shoplist=['apple','mango','carrot']

f=file(shoplistfile,'w')
p.dump(shoplist,f)       # dump(object,file)   把shoplist对象存在f文件中
f.close()

del shoplist

f=file(shoplistfile)
storedlist=p.load(f)    #读取文件中的对象
print storedlist
```

## 异常

### 处理异常

```python
import sys
try:
	s = raw_input('Enter something --> ')
except EOFError:
	print '\nWhy did you do an EOF on me?'  #EOFError  意味着它发现一个不期望的 文件尾（由Ctrl-d表示）
	sys.exit() # exit the program
except:
	print '\nSome error/exception occurred.'
	# here, we are not exiting the program
print 'Done'
```

try..catch块关联上一个else从句，当没有异常发生的时候，else从句将被执行

### 引发异常

```python
class ShortInputException(Exception):  #继承异常类  
	'''A user-defined exception class.'''
	def __init__(self, length, atleast):
		Exception.__init__(self)
		self.length = length   #输入字长度
		self.atleast = atleast   #至少的字长度
try:
	s = raw_input('Enter something --> ')
	if len(s) < 3:
		raise ShortInputException(len(s), 3)    #raise语句 引发 异常
	# Other work can continue as usual here
except EOFError:
	print '\nWhy did you do an EOF on me?'
except ShortInputException, x:
	print 'ShortInputException: The input was of length %d, \
		was expecting at least %d' % (x.length, x.atleast)
else:
	print 'No exception was raised.'
```

```python
$ python raising.py
Enter something -->(ctrl +d)
Why did you do an EOF on me?
$ python raising.py
Enter something --> ab
ShortInputException: The input was of length 2, was expecting at least 3
$ python raising.py
Enter something --> abc
No exception was raised.
```

### try..finally

假如你在读一个文件的时候，希望在无论异常发生与否的情况下都关闭文件，该怎么做呢？这可以使用finally块来完成。注意，在一个try块下，你可以同时使用except从句和finally块。如果你要同时使用它们的话，需要把一嵌入另外一个。

```python
import time
try:
	f = file('poem.txt')
	while True: # our usual file-reading idiom
		line = f.readline()
		if len(line) == 0:
			break
		time.sleep(2)  #暂停2秒 以便（ctrl +c）引发KeyboardInterrupt异常
		print line,
finally:
	f.close()  #无论引发异常，还是会执行finally
	print 'Cleaning up...closed the file'
```

### Python标准库

### sys模块

```python
#filename:cat.py
import sys

def readfile(filename):
	'''Print a flie to the standard output'''
	f=file(filename)
	while True:
		line=f.readline()
		if len(line)==0:
			break
		print line,
	f.close()
#script start
if len(sys.argv)<2:
	print 'NO action specified'
	sys.exit()

if sys.argv[1].startswith('--'):
	option=sys.argv[1][2:]
	#fetch sys.argv[1]
	if option=='version':
		print 'Verion 1.2'
	elif option=='help':
		print '''\
This program prints files to the standard output.
Any number of files can be specified.
Options include:
--version : Prints the version number
--help : Display this help'''
	else:
		print 'Unknown option'
	sys.exit()
else:
	for filename in sys.argv[1:]:
		readfile(filename)
```

输出：

```python
$ python cat.py
No action specified.
$ python cat.py --help
This program prints files to the standard output.
Any number of files can be specified.
Options include:
--version : Prints the version number
--help : Display this help
$ python cat.py --version
Version 1.2
$ python cat.py --nonsense
Unknown option.
$ python cat.py poem.txt
Programming is fun
When the work is done
if you wanna make your work also fun:
use Python!
```

在Python程序运行的时候，即不是在交互模式下，在sys.argv列表中总是至少有一个项目。它就是当前运行的程序名称，作为sys.argv[0]。其他的命令行参数在这个项目之后。

sys.exit函数退出正在运行的程序

名称cat是 concatenate 的缩写，打印一个文件或者把两个或两个以上文件连接/级连在一起打印

### 其他sys内容

sys.version字符串给你提供安装的Python的版本信息。

sys.version_info元组则提供一个更简单的方法来使你的程序具备Python版本要求功能。

### os模块

模块包含普遍的操作系统功能。如果你希望你的程序能够与平台无关的话，这个模块是尤为重要的

即它允许一个程序在编写后不需要任何改动，也不会发生任何问题，就可以在Linux和Windows下运行。一个例子就是使用os.sep可以取代操作系统特定的路径分割符。

● os.name字符串指示你正在使用的平台。比如对于Windows，它是'nt'，而对于Linux/Unix
用户，它是'posix'。
● os.getcwd()函数得到当前工作目录，即当前Python脚本工作的目录路径。
● os.getenv()和os.putenv()函数分别用来读取和设置环境变量。
● os.listdir()返回指定目录下的所有文件和目录名。
● os.remove()函数用来删除一个文件。
● os.system()函数用来运行shell命令。
● os.linesep字符串给出当前平台使用的行终止符。例如，Windows使用'\r\n'，Linux使
用'\n'而Mac使用'\r'。
● os.path.split()函数返回一个路径的目录名和文件名。

\>>>os.path.split('/home/swaroop/byte/code/poem.txt')
('/home/swaroop/byte/code', 'poem.txt')

● os.path.isfile()和os.path.isdir()函数分别检验给出的路径是一个文件还是目录。类似地，os.
path.exists()函数用来检验给出的路径是否真地存在。

help(sys)  找到更多资料