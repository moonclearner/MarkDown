# pyhton基础知识 two

## 数据结构

- 列表
- 元组
- 字典

### 列表

```python
list = ['apple', 'mango', 'carrot', 'banana']
```



len(list)  

list.append(' ')

list.sort()

del list[0]

```python
print 'These items are:', # Notice the comma at end of the line
```

我们在print语句的结尾使用了一个**逗号**来消除每个print语句自动打印的换行符。

### 元组

```python
tuple = ('wolf', 'elephant', 'penguin')
tuple2 = ('wolf', 'elephant', tuple)
print tuple2
print tuple2[2]
print  tuple2[2][2]
```

输出

```python
('wolf', 'elephant', ('wolf', 'elephant', 'penguin'))
('wolf', 'elephant', 'penguin')
penguin
```

含有0个或1个项目的元组。一个空的元组由一对空的圆括号组成，如myempty = ()。然而，含有单个元素的元组就不那么简单了。你必须在第一个（唯一一个）项目后跟一个逗号，这样Python才能区分元组和表达式中一个带圆括号的对象。即如果你想要的是一个包含项目2的元组的时候，你应该指明singleton = (2 , )

### print打印

```python
age = 22
name = 'Swaroop'
print '%s is %d years old' % (name, age)
print 'Why is %s playing with that python?' % name
```

### 字典

```python
dict = {key1 : value1, key2 : value2 }
```

特点：

- key唯一
- 字典中的键/值对是没有顺序

```python
ab = { 'Swaroop' : 'swaroopch@byteofpython.info',
'Larry' : 'larry@wall.org',
'Matsumoto' : 'matz@ruby-lang.org'
}
print "Swaroop's address is %s" % ab['Swaroop']
# Adding a key/value pair
ab['Guido'] = 'guido@python.org'
# Deleting a key/value pair
del ab['Spammer']
print '\nThere are %d contacts in the address-book\n' % len(ab)
for name, address in ab.items():
	print 'Contact %s at %s' % (name, address)
if 'Guido' in ab: # OR ab.has_key('Guido')  #in操作符来检验一个键/值对是否存在，或者使用dict类的has_key方法
	print "\nGuido's address is %s" % ab['Guido']
```

### 引用

```python
shoplist = ['apple', 'mango', 'carrot', 'banana']
mylist = shoplist # mylist is just another name pointing to the same object!
del shoplist[0]
print 'shoplist is', shoplist
print 'mylist is', mylist
```

输出：

```python
shoplist is ['mango', 'carrot', 'banana']
mylist is ['mango', 'carrot', 'banana'] #因为mylist和shoplist指向同一个地址
```

```python
mylist = shoplist[:]   # 切片操作符来取得拷贝
del mylist[0] # remove first item
print 'shoplist is', shoplist
print 'mylist is', mylist
```

输出：

```python
shoplist is ['mango', 'carrot', 'banana']
mylist is ['carrot', 'banana']
```

**如果你只是想要使用另一个变量名，两个名称都 引用 同一个对象，那么如果你不小心的话，可能会引来各种麻烦**

### str

```python
name = 'Swaroop' # This is a string object
if name.startswith('Swa'):
print 'Yes, the string starts with "Swa"'

if 'a' in name:
print 'Yes, it contains the string "a"'

if name.find('war') != -1:   #  find函数返回值：如果查到：返回查找的第一个出现的位置。否则，返回-1。
print 'Yes, it contains the string "war"'

delimiter = '_*_'
mylist = ['Brazil', 'Russia', 'India', 'China']
print delimiter.join(mylist)    #   Brazil_*_Russia_*_India_*_China
```

startwith方法是用来测试字符串是否以给定字符串开始。

in操作符用来检验一个给定字符串是否为另一个字符串的一部分。

find 方法用来找出给定字符串在另一个字符串中的位置，或者返回-1以表示找不到子字符串。

str类也有以一个作为分隔符的字符串join序列的项目的整洁的方法，它返回一个生成的大字符串。

## python脚本

Q:我想要一个可以为我的所有重要文件创建备份的程序。

solution:

1. 需要备份的文件和目录由一个列表指定。
2. 备份应该保存在主备份目录中。
3. 文件备份成一个zip文件。
4. zip存档的名称是当前的日期和时间。
5. 我们使用标准的zip命令，它通常默认地随Linux/Unix发行版提供。Windows用户可以使
   用Info-Zip程序。注意你可以使用任何地存档命令，只要它有命令行界面就可以了，那
   样的话我们可以从我们的脚本中传递参数给它。

```python
import os
import time
# 1. The files and directories to be backed up are specified in a list.
source = ['/home/swaroop/byte', '/home/swaroop/bin']
# If you are using Windows, use source = [r'C:\Documents', r'D:\Work'] or something like that
# 2. The backup must be stored in a main backup directory
target_dir = '/mnt/e/backup/' # Remember to change this to what you will be using
# 3. The files are backed up into a zip file.
# 4. The name of the zip archive is the current date and time
target = target_dir + time.strftime('%Y%m%d%H%M%S') + '.zip'
# 5. We use the zip command (in Unix/Linux) to put the files in a zip archive
zip_command = "zip -qr '%s' %s" % (target, ' '.join(source))
# Run the backup
if os.system(zip_command) == 0:
	print 'Successful backup to', target
else:
	print 'Backup FAILED'
```

你可以把source列表和target目录设置成任何文件和目录名，但是在Windows中你得小心一些。问题是Windows把反斜杠（\）作为目录分隔符，而Python用反斜杠表示转义符！所以，你得使用转义符来表示反斜杠本身或者使用自然字符串。例如，**使用'C:\\\Documents'或r'C:\Documents'而不是'C:\Documents'**——你在使用一个不知名的转义符\D！

我的win10使用的是好压，我在好压的根目录中找到用命令行操作好压进行压缩HaoZipC

不要在IDE中运行该脚本，不然会出现IDE找不到命令的问题，在cmd中 python  文件.py运行该脚本即可

### 改版

```python
#!usr/bin/python    
#Filename:backup_ver1.py


import os
import time
source=['D:\\test_backup','d:\\teleport_ultra']
#on windows  source=[r'D:\test_backup',r'd:\teleport_ultra']
target_dir='D:\\backup\\'

today = target_dir + time.strftime('%Y%m%d')

now = time.strftime('%H%M%S')

comment = raw_input('Enter a comment --> ')  #获取输入付给comment

if len(comment) == 0:       		# check if a comment was entered
	target_name = today + os.sep + now + '.zip'
else:
	target_name = today + os.sep + now + '_' +\  #用斜杠来连接下一行代码
	comment.replace(' ', '_') + '.zip'    #字符串替换将空格替换为下划线

if not os.path.exists(today):   #检查目录是否存在
	os.mkdir(today)         # make directory  创建目录
	print 'Successfully created directory', today


zip_command="HaoZipC a -tzip %s %s"%(target_name,' '.join(source))  #' '.join(source)以空格连接字符串

if os.system(zip_command)==0:
    print 'Successful backup to',target_name
else:
    print 'Backup fail'
    
```

os.path.exists() 文件夹是否存在

os.mkdir()创建文件夹

os.sep变量的用法——这会根据你的操作系统给出目录分隔符，即在Linux、Unix下它是'/'，在Windows下它是'\\'，而在Mac OS下它是':'。使用os.sep而非直接使用字符，会使我们的程序具有移植性，可以在上述这些系统下工作。

### 进一步优化

你可以在程序中包含 交互 程度——你可以用-v选项来使你的程序更具交互性。

另一个可能的改进是使文件和目录能够通过命令行直接传递给脚本。我们可以通过sys.argv列表来获取它们，然后我们可以使用list类提供的extend方法把它们加到source列表中去。

我还希望有的一个优化是使用tar命令替代zip命令。这样做的一个优势是在你结合使用tar和gzip命令的时候，备份会更快更小。如果你想要在Windows中使用这些归档，WinZip也能方便地处理这些.tar.gz文件。tar命令在大多数Linux/Unix系统中都是默认可用的。Windows用户也可以下载安装它。命令字符串现在将称为：

`tar = 'tar -cvzf %s %s -X /home/swaroop/excludes.txt' % (target, ' '.join(srcdir))`

选项解释如下：
● -c表示创建一个归档。
● -v表示交互，即命令更具交互性。
● -z表示使用gzip滤波器。
● -f表示强迫创建归档，即如果已经有一个同名文件，它会被替换。
● -X表示含在指定文件名列表中的文件会被排除在备份之外。例如，你可以在文件中指定*~，从而不让备份包括所有以~结尾的文件。
**重要**
最理想的创建这些归档的方法是分别使用zipfile和tarfile。它们是Python标准库的一部分，可以供你使用。使用这些库就避免了使用os.system这个不推荐使用的函数，它容易引发严重的错误。