# python 正则表达式

[TOC]


找到以imooc开头的字符串

```python
def find_start_imooc(fname):
    f=open(fname)
    for line in f:
        if line.startswith('imooc'):
            print line
```

找以imooc开头和结尾的字符串

```python
def fine_in_imooc(fname):
    f=open(fname)
    f line in f:
        if line.startswith('imooc')\
        	and line.endswith('imooc\n'):   #因为文件都是以\n结束的所以要加上\n  或者\r\n
            #或者使用切片操作：
            # and line[:-1].endswith('imooc'):
            print line
```

匹配下划线或者数字的变量名

```python
a[0]=='_' or 'a'<=a[0]<='z' or 'A'<=a[0]<='Z'
```

## re模块的使用

```python
# coding=UTF-8
import re
str1 = 'imooc-learning'
pa = re.compile(r'imooc')
ma = pa.match(str1)
# 返回找到的字符串或者返回元组
print ma.group()  #ma.groups()  返回元组
# 返回字符的索引位置
print ma.span()
# 显示字符串
print ma.string
# 显示实例
print ma.re

# 以下划线开头
pal = re.compile(r'_')
mal = pal.match('_value')
mal.group()

pa = re.compile(r'imooc', re.I)  # re.I 忽略大小写
ma = pa.match('imooc python')
ma.group()

#便捷使用
ma=re.match(r'imooc',str1)
ma.group()


#返回元组的使用
ma=re.match(r'(imooc)',str1)
print ma.groups()  #返回元组
```

## 正则表达式语法

match是从字符串头开始搜索的

| 字符      | 匹配                         |
| ------- | -------------------------- |
| .       | 匹配任意字符（除了                  |
| [...]   | 匹配字符集                      |
| \d / \D | 匹配数字/非数字                   |
| \s / \S | 匹配空白/非空白字符                 |
| \w / \W | 匹配单词字符[a-z A-Z 0-9] \非单词字符 |

匹配大括号之间任意的值  {d}

```平日python
re.match(r'{.}', {d}) #两个点代表两个字符
```

匹配字符集

```python
re.match(r'[abc]','a')
re.match(r'[abc]','c')#匹配中括号中的字符集

re.match(r'[a-zA-Z])','F')
re.match(r'[\w])','F')
```

如何匹配[ ]，使用\转义

```python
re.match(r'\[[a-z]\]','[a]')  #'[a]'
```

### 次数指定匹配

```python
re.match(r'\[[\w]\])','[a]')
```

| 字符            | 匹配                 |
| ------------- | ------------------ |
| *             | 匹配前一个字符0次或者无限次     |
| +             | 匹配前一个字符必须出现1次或者无限次 |
| ？             | 匹配前一个字符0次或者1次      |
| {m} /{m,n}    | 匹配前一个字符m次或者n次      |
| *？ /  +？ / ？？ | 匹配魔兽变维非贪婪（尽可能少匹配）  |

匹配以大写字母开始的字符

```python 
re.match(r'[A-Z][a-z]*','A')
re.match(r'[A-Z][a-z]*','As')
re.match(r'[A-Z][a-z]*','Asaadad')
```

匹配下划线变量（+使用）

```python
re.match(r'[_a-zA-Z]+[_\w*]','_dadf')
#[_a-zA-Z]+ 必须出现一次或者无限次
```

匹配0-999

```python
re.match(r'[1-9]?[0-9]','90')
re.match(r'[1-9]?[0-9]','9')
re.match(r'[1-9]?[0-9]','9') #group  ’0‘
re.match(r'[1-9]?[0-9]','09') #group 得到的结果是'0'  
#因为[1-9]?可以出现0-1次 [1-9]  所以不出现，下一个就是[0-9] 匹配0 即答案为0
```

匹配qq邮箱出现6次的字符

```python
re.match(r'[a-ZA-Z0-9]{6}@163.com,'adc123@163.com')
re.match(r'[a-ZA-Z0-9]{6,10}@163.com,'adc1234@.com')#6到10次
```

```python
re.match(r'[0-9][a-z]*','lbc')  # 'lbc'
re.match(r'[0-9][a-z]*?','lbc') # 'l'  尽可能少匹配  即0匹配
re.match(r'[0-9][a-z]+?','lbc') # 'lb'  匹配1次
```

#### 边界匹配

| 字符           | 匹配                  |
| ------------ | ------------------- |
| ^            | 匹配字符串开头             |
| $            | 匹配字符串结尾             |
| \A   /    \Z | 指定的字符串必须出现在现在的开头/结尾 |

163邮箱匹配

结尾匹配

```python
re.match(r'[a-ZA-Z0-9]{6}@163.com,'adc123@163.comabc')  #  'adc123@163.com'
re.match(r'[a-ZA-Z0-9]{6}@163.com$,'adc123@163.comabc')  #  
re.match(r'[a-ZA-Z0-9]{6}@163.com$,'adc123@163.com')  #  'adc123@163.com'
```

开头匹配

```python
re.match(r'\Aimooc[\w]*','imoocpython')  #  'imoocpython'
```

### 分组匹配

| 字符         | 匹配                 |
| ---------- | ------------------ |
| \|         | 匹配左右任意一个表达式        |
| (ab)       | 括号中表达式作为一个分组       |
| \\<number> | 引用编号为num的分组匹配到的字符串 |
| (?P<name>) | 分组起一个别名            |
| (?P<name>) | 引用别名为name的分组匹配字符串  |

匹配0-100的字符串

```python
re.match(r'[1-9]?\d$','09')  #匹配不出来   因为0匹配为\d 但并不是结尾
re.match(r'[1-9]?\d$','100')  #也匹配不出来   100为三个数字
re.match(r'[1-9]?\d$|100','100')  #即可了
```

#### 分组  每次使用自动加一

```python
re.match(r'[\w]{4,6}@(163|126).com','imooc@163.com')  #可以
re.match(r'[\w]{4,6}@(163|126).com','imooc@126.com')  #可以
```

匹配xml的可靠性<book>python</book> # 前面的标签book和后面的book要相同

```python
re.match(r'<[\w]+>','<book>') #可以匹配
#对其进行分组
re.match(r'<([\w]+>)','<book>')  # '<book>' 

re.match(r'<([\w]+>)\1','<book>')  
.groups() #存如空间中
# ('book>')   \1代表book>
re.match(r'<([\w]+>)\1','<book>book>')  # '<book>book>' 

#完整的表达式
re.match(r'<([\w]+>)[\w]+</\1','<book>python</book>')  # '<book>python</book>' 
```

给分组起个别名

```pytho
re.match(r'<(?P<mark>[\w]+>)[\w]+</(?P=mark)','<book>python</book>')  # '<book>python</book>' 
```

## re模块其他方法

### search（pattern，string，flags=0）

在字符串中查找，类似sting.find

```python
str1='imooc videonum=1000'
str1.find('1000')  #返回17 索引  指定1000  当str1中的数字改变就找不到了
#用正则表达式找出数字
re.search(r'\d+',str1)  #.group()=‘1000’
```

### findall（pattern，string，flags=0）

找到匹配，返回所有的值存入列表

```python
str2='c++100,java=90,python=80'

re.search(r'\d+',str2)  #.group()=‘100’

info=re.findall(r'\d+',str2)  #info   ['100','90','80']

#使用列表解析，将列表所有的数字加在一起
sum([int(x) for x in info])  #270
```

### sub(pattern,repl,string,count=0,flags=0)

将字符串中匹配正则表达式的部分替换为其他值,repl可以为字符串 也可以为一个函数返回的值

```python
str3='imooc videonum=1000'

info=re.sub(r'\d+','1001',str3)  #info  imooc videonum=1001
#默认每次使用一次加一
#既需要定义一个函数代替repl

def  addone(match):   #为sub使用时候，在pattern中自动会产生一个match对象
    va1=match.group()
    num=int(va1)+1
    return str(num)

str3='imooc videonum=1000'
re.sub(r'\d+',addone,str3)  #imooc videonum=1001
```

### split(pattern,string,maxsplit(分割次数)=0,flags=0)

```python
str4='imooc:C C++ Java Python,C#'
re.split(r':| ',str4)  # 有冒号  有空格  返回 ['imooc','C','C++','java'，'Python','C#']
```

## 正则表达式练习

抓取网页，图片，并且保存：

```python
#coding=UTF-8
import urllib2
import re
import os

req=urllib2.urlopen('http://www.imooc.com/')

buf=req.read()
#打印抓取的网站
print buf

#获取图片url
listpic=re.findall(r'http:.*\.jpg',buf)  #第一个点代表任意字符 第二点使用\.进行转义 为真正的点
listpic2=re.findall(r'/.*\.png',buf) 
print listpic
print listpic2

#保存文件
i=0
for url in listpic:
	pass
	f=open(r'C:\\Users\\djj\\Desktop\\test\\'+str(i)+r'.jpg','wb')  
	''' 'wb'读取文件使用二进制读取方式，不然的话抓取的图片是花的'''
	req=urllib2.urlopen(url)
	buf=req.read()
	f.write(buf)
	i+=1
```

