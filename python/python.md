

### 短路计算

1. 在计算 a and b 时，如果 a 是 False，则根据与运算法则，整个结果必定为 False，因此返回 a；如果 a 是 True，则整个计算结果必定取决与 b，因此返回 b。

2. 在计算 a or b 时，如果 a 是 True，则根据或运算法则，整个计算结果必定为 True，因此返回 a；如果 a 是 False，则整个计算结果必定取决于 b，因此返回 b。

所以Python解释器在做布尔运算时，只要能提前确定计算结果，它就不会往后算了，直接返回结果。


	list  
	a=[1,2,3,4]
	a[0]=1
	a[-1]=4  
	a[-2]=3
	a.append() add data following end
	a.insert(A,B)  A = addr   B=data
	a.pop()   delete end data
	a.pop(A)   A=addr
	alter data:  a[3]='changedata'


tuple是另一种有序的列表
但是，tuple一旦创建完毕，就不能修改了
创建tuple和创建list唯一不同之处是用( )替代了[ ]
tuple没有 append()方法，也没有insert()和pop()方法。所以，新同学没法直接往 tuple 中添加，老同学想退出 tuple 也不行。
**单元素tuple必须加上额外的逗号。**

##“可变”的tuple

前面我们看到了tuple一旦创建就不能修改。现在，我们来看一个“可变”的tuple：

	t = ('a', 'b', ['A', 'B'])

注意到 t 有 3 个元素：'a'，'b'和一个list：['A', 'B']。list作为一个整体是tuple的第3个元素。list对象可以通过 t[2] 拿到：

	L = t[2]

然后，我们把list的两个元素改一改：

	L[0] = 'X'
	L[1] = 'Y'

再看看tuple的内容：

	>>>print t
	('a', 'b', ['X', 'Y'])


在Python程序中，可以用if语句实现：

	age = 20
	if age >= 18:
	    print 'your age is', age
	    print 'adult'
	print 'END'

**注意: Python代码的缩进规则。具有相同缩进的代码被视为代码块，上面的3，4行 print 语句就构成一个代码块（但不包括第5行的print）。如果 if 语句判断为 True，就会执行这个代码块。**

**缩进请严格按照Python的习惯写法：4个空格，不要使用Tab，更不要混合Tab和空格，否则很容易造成因为缩进引起的语法错误。**

注意: if 语句后接表达式，然后用:表示代码块开始。

如果你在Python交互环境下敲代码，还要特别留意缩进，并且退出缩进需要多敲一行回车：

    >>> age = 20
    >>> if age >= 18:
    ...     print 'your age is', age
    ...     print 'adult'
    ...
    your age is 20
    adult

if...else

```python
if age >= 18:
	print 'adult'
else:
	print 'teenager'
```
if..elif..else
elif  = else if 

## for
        L = ['Adam', 'Lisa', 'Bart']
        for name in L:
            print name

注意:  name 这个变量是在 for 循环中定义的，意思是，依次取出list中的每一个元素，并把元素赋值给 name，然后执行for循环体（就是缩进的代码块）。

## while
        N = 10
        x = 0
        while x < N:
            print x
            x = x + 1

while循环每次先判断 x < N，如果为True，则执行循环体的代码块，否则，退出循环。

###break and continue
        sum = 0
        x = 1
        while True:
            sum = sum + x
            x = x + 1
            if x > 100:
                break
        print sum

在循环过程中，可以用break退出当前循环，还可以用continue跳过后续循环代码，继续下一次循环。

###多重循环
在循环内部，还可以嵌套循环，我们来看一个例子：

for x in ['A', 'B', 'C']:
    for y in ['1', '2', '3']:
        print x + y

## dict

d = {
    'Adam': 95,
    'Lisa': 85,
    'Bart': 59
}

我们把名字称为key，对应的成绩称为value，dict就是通过 key 来查找 value。

len(d)  count length  3

print a['Adam'] 95  
如果没有key 就会报错：keyError

//用于判断d中有没有paul key存在
if 'Paul' in d:
    print d['Paul']

dict的get方法
>>> print d.get('Bart')
59
>>> print d.get('Paul')
None

**dict特点**

dict的第一个特点是查找速度快，无论dict有10个元素还是10万个元素，查找速度都一样。而list的查找速度随着元素增加而逐渐下降。
不过dict的查找速度快不是没有代价的，dict的缺点是占用内存大，还会浪费很多内容，list正好相反，占用内存小，但是查找速度慢。
由于dict是按 key 查找，所以，在一个dict中，key不能重复。
dict的第二个特点就是存储的key-value序对是没有顺序的！这和list不一样：
dict的第三个特点是作为 key 的元素必须不可变，

Python的基本类型如字符串、整数、浮点数都是不可变的，都可以作为 key。但是list是可变的，就不能作为 key。tuple却可以因为是不可变的
不可变这个限制仅作用于key，value是否可变无所谓：

###dict添加数据

要把新同学'Paul'的成绩 72 加进去，用赋值语句：

	>>> d['Paul'] = 72
###dict的遍历

	>>> d = { 'Adam': 95, 'Lisa': 85, 'Bart': 59 }
	>>> for key in d:
	...     print key
	... 
	Lisa
	Adam
	Bart

由于通过 key 可以获取对应的 value，因此，在循环体内，可以获取到value的值。



##set

dict的作用是建立一组 key 和一组 value 的映射关系，dict的key是不能重复的。

有的时候，我们只想要 dict 的 key，不关心 key 对应的 value，目的就是保证这个集合的元素不会重复，这时，set就派上用场了。

set 持有一系列元素，这一点和 list 很像，但是set的元素没有重复，而且是  **无序**的，这点和 dict 的 key很像。

###创建set
 set() 并传入一个 list
	>>> s = set(['A', 'B', 'C'])

**因为set不能包含重复的元素，所以，当我们传入包含重复元素，自动去掉重复**


set与tuple

    s = set([('Adam', 95), ('Lisa', 85), ('Bart', 59)])
遍历：

    s = set([('Adam', 95), ('Lisa', 85), ('Bart', 59)])
    for x in s:
        print x[0] + ':', x[1]

###add与remove
	s.add()
如果添加的元素已经存在于set中，add()不会报错，但是不会加进去了：

	s.remove()
如果删除的元素不存在set中，remove()会报错：

**所以用add()可以直接添加，而remove()前需要判断。**


##函数

###自定义函数
在Python中，定义一个函数要使用 def 语句，依次写出函数名、括号、括号中的参数和冒号:，然后，在缩进块中编写函数体，函数的返回值用 return 语句返回。

我们以自定义一个求绝对值的 my_abs 函数为例：

    def my_abs(x):
        if x >= 0:
            return x
        else:
            return -x

如果没有return语句，函数执行完毕后也会返回结果，只是结果为 None。
return None可以简写为return。

####返回多值

math包提供了sin()和 cos()函数，我们先用import引用它：

        import math
        def move(x, y, step, angle):
            nx = x + step * math.cos(angle)
            ny = y - step * math.sin(angle)
            return nx, ny

    x, y = move(100, 100, 60, math.pi / 6)
    print x, y
    151.961524227 70.0

但其实这只是一种假象，Python函数返回的仍然是单一值：

	>>> r = move(100, 100, 60, math.pi / 6)
	>>> print r
	(151.96152422706632, 70.0)

用print打印返回结果，原来返回值是一个tuple！
在语法上，返回一个tuple可以省略括号，而多个变量可以同时接收一个tuple，按位置赋给对应的值，所以，Python的函数返回多值其实就是返回一个tuple，但写起来更方便。

##递归

    def fact(n):
        if n==1:
            return 1
        return n * fact(n - 1)

汉诺塔
我们对柱子编号为a, b, c，将所有圆盘从a移到c可以描述为：

如果a只有一个圆盘，可以直接移动到c；

如果a有N个圆盘，可以看成a有1个圆盘（底盘） + (N-1)个圆盘，首先需要把 (N-1) 个圆盘移动到 b，然后，将 a的最后一个圆盘移动到c，再将b的(N-1)个圆盘移动到c。

请编写一个函数，给定输入 n, a, b, c，打印出移动的步骤：

    def move(n, a, b, c):
        if n ==1:
            print a, '-->', c
            return
        move(n-1, a, c, b)
        print a, '-->', c
        move(n-1, b, a, c)
    move(4, 'A', 'B', 'C')

把 n 的默认值设定为 2：  计算平方就不需要传入两个参数了

        def power(x, n=2):
            s = 1
            while n > 0:
                n = n - 1
                s = s * x
            return s

**由于函数的参数按从左到右的顺序匹配，所以默认参数只能定义在必需参数的后面：**


###定义可变参数

    def fn(*args):
        print args
***可变参数 args 是一个tuple***

    >>> fn()
    ()
    >>> fn('a')
    ('a',)
    >>> fn('a', 'b')
    ('a', 'b')
    >>> fn('a', 'b', 'c')
    ('a', 'b', 'c')

Python解释器会把传入的一组参数组装成一个tuple传递给可变参数，因此，在函数内部，直接把变量 args 看成一个 tuple 就好了。

##切片
取一个list的部分元素
*(类似把list换成tuple，切片操作完全相同，只是切片的结果也变成了tuple。)*

Python提供了切片（Slice）操作符

        >>> L = ['Adam', 'Lisa', 'Bart', 'Paul']
        >>> L[0:3]
        ['Adam', 'Lisa', 'Bart']

L[0:3]表示，从索引0开始取，直到索引3为止，但不包括索引3。
如果第一个索引是0，还可以省略：

	>>> L[:3]

只用一个 : ，表示从头到尾：

	>>> L[:]

隔一个取一个
	>>> L[::2]
	['Adam', 'Bart']

第三个参数表示每N个取一个，上面的 L[::2] 会每两个元素取出一个来，也就是隔一个取一个。

	L = range(1, 101)
range()函数可以创建一个数列：

	>>> range(1, 101)
	[1, 2, 3, ..., 100]

###倒序切片
	>>> L = ['Adam', 'Lisa', 'Bart', 'Paul']
	
	>>> L[-2:]
	['Bart', 'Paul']
	
	>>> L[:-2]
	['Adam', 'Lisa']
	
	>>> L[-3:-1]
	['Lisa', 'Bart']
	
	>>> L[-4:-1:2]
	['Adam', 'Bart']


##对字符串切片

    >>> 'ABCDEFG'[:3]
    'ABC'
    >>> 'ABCDEFG'[-3:]
    'EFG'
    >>> 'ABCDEFG'[::2]
    'ACEG'

字符串有个方法 upper() 可以把字符变成大写字母：

	>>> 'abc'.upper()
	'ABC'

##迭代
遍历称为迭代

因为 Python 的for循环不仅可以用在list或tuple上，还可以作用在其他任何可迭代对象上。

因此，迭代操作就是对于一个集合，无论该集合是有序还是无序，我们用 for 循环总是可以依次取出集合的每一个元素。

注意: 集合是指包含一组元素的数据结构，我们已经介绍的包括：
1. 有序集合：list，tuple，str和unicode；
2. 无序集合：set
3. 无序集合并且具有 key-value 对：dict


	>>> zip([10, 20, 30], ['A', 'B', 'C'])
	[(10, 'A'), (20, 'B'), (30, 'C')]

###索引迭代

对于有序集合，元素确实是有索引的。有的时候，我们确实想在 for 循环中拿到索引，怎么办？

方法是使用 enumerate() 函数：

    >>> L = ['Adam', 'Lisa', 'Bart', 'Paul']
    >>> for index, name in enumerate(L):
    ...     print index, '-', name
    ... 
    0 - Adam
    1 - Lisa
    2 - Bart
    3 - Paul

使用 enumerate() 函数，我们可以在for循环中同时绑定索引index和元素name。但是，这不是 enumerate() 的特殊语法。实际上，enumerate() 函数把：

    ['Adam', 'Lisa', 'Bart', 'Paul']

变成了类似：

    [(0, 'Adam'), (1, 'Lisa'), (2, 'Bart'), (3, 'Paul')]

因此，迭代的每一个元素实际上是一个tuple：

    for t in enumerate(L):
        index = t[0]
        name = t[1]
        print index, '-', name

可见，索引迭代也不是真的按索引访问，而是由 enumerate() 函数自动把每个元素变成 (index, element) 这样的tuple，再迭代，就同时获得了索引和元素本身。

### 迭代dict的value

用 for 循环直接迭代 dict，可以每次拿到dict的一个key。
dict 对象有一个 values() 方法，这个方法把dict转换成一个包含所有value的list，这样，我们迭代的就是 dict的每一个 value：

    d = { 'Adam': 95, 'Lisa': 85, 'Bart': 59 }
    print d.values()
    # [85, 95, 59]
    for v in d.values():
        print v
    # 85
    # 95
    # 59

如果仔细阅读Python的文档，还可以发现，dict除了values()方法外，还有一个 itervalues() 方法，用 itervalues() 方法替代 values() 方法，迭代效果完全一样：

    d = { 'Adam': 95, 'Lisa': 85, 'Bart': 59 }
    print d.itervalues()
    # <dictionary-valueiterator object at 0x106adbb50>
    for v in d.itervalues():
        print v
    # 85
    # 95
    # 59

1. values() 方法实际上把一个 dict 转换成了包含 value 的list。

2. 但是 itervalues() 方法不会转换，它会在迭代过程中依次从 dict 中取出 value，所以 itervalues() 方法比 values() 方法节省了生成 list 所需的内存。

3. 打印 itervalues() 发现它返回一个 <dictionary-valueiterator> 对象，这说明在Python中，for 循环可作用的迭代对象远不止 list，tuple，str，unicode，dict等，任何可迭代对象都可以作用于for循环，而内部如何迭代我们通常并不用关心。

如果一个对象说自己可迭代，那我们就直接用 for 循环去迭代它，可见，迭代是一种抽象的数据操作，它不对迭代对象内部的数据有任何要求。

### 迭代dict的key和value

我们了解了如何迭代 dict 的key和value，那么，在一个 for 循环中，能否同时迭代 key和value？答案是肯定的。

    >>> d = { 'Adam': 95, 'Lisa': 85, 'Bart': 59 }
    >>> print d.items()
    [('Lisa', 85), ('Adam', 95), ('Bart', 59)]

    >>> for key, value in d.items():
    ...     print key, ':', value
    ... 
    Lisa : 85
    Adam : 95
    Bart : 59

和 values() 有一个 itervalues() 类似， items() 也有一个对应的 iteritems()，iteritems() 不把dict转换成list，而是在迭代过程中不断给出 tuple，所以， iteritems() 不占用额外的内存。

## 生成列表

    >>> range(1, 11)
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

但如果要生成[1x1, 2x2, 3x3, ..., 10x10]怎么做？方法一是循环：

    >>> L = []
    >>> for x in range(1, 11):
    ...    L.append(x * x)
    ... 
    >>> L
    [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]


    >>> [x * x for x in range(1, 11)]
    [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
这种写法就是Python特有的列表生成式

### 复杂表达式

    tds = ['<tr><td>%s</td><td>%s</td></tr>' % (name, score) for name, score in d.iteritems()]
    print '<table>'
    print '<tr><th>Name</th><th>Score</th><tr>'
    print '\n'.join(tds)
    print '</table>'
注：字符串可以通过 % 进行格式化，用指定的参数替代 %s。字符串的join()方法可以把一个 list 拼接成一个字符串。

    <table border="1">
    <tr><th>Name</th><th>Score</th><tr>
    <tr><td>Lisa</td><td>85</td></tr>
    <tr><td>Adam</td><td>95</td></tr>
    <tr><td>Bart</td><td>59</td></tr>
    </table>

### 条件过滤
列表生成式的 for 循环后面还可以加上 if 判断。例如：

    >>> [x * x for x in range(1, 11)]
    [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

    >>> [x * x for x in range(1, 11) if x % 2 == 0]
    [4, 16, 36, 64, 100]

请编写一个函数，它接受一个 list，然后把list中的所有字符串变成大写后返回，非字符串元素将被忽略。

    def toUppers(L):
        return [x.upper() for x in L if isinstance(x, str)]
    print toUppers(['Hello', 'world', 101])

1. isinstance(x, str) 可以判断变量 x 是否是字符串；

2. 字符串的 upper() 方法可以返回大写的字母。

### 多层表达式
for循环可以嵌套，因此，在列表生成式中，也可以用多层 for 循环来生成列表。

    >>> [m + n for m in 'ABC' for n in '123']
    ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']

    L = []
    for m in 'ABC':
        for n in '123':
            L.append(m + n)

### 设置默认编码utf8
在python的Lib\site-packages文件夹下新建一个sitecustomize.py，内容为：

Python代码   
 
    # encoding=utf8 
    import sys 
    reload(sys) 
    sys.setdefaultencoding('utf8')


## error

    IndentationError: expected an indented block
该行代码缺少空格

    IndentationError: unindent does not match any outer indentation level
有些地方应该用4个空格而不是一个tab，要么都是空格，要么都是tab

        def transfer(self, source_acctid, target_acctid, money)
                                                              ^
    SyntaxError: invalid syntax
定义的方法，缺少：冒号

### Exception：
1. 异常一

`Exception(" %s account add money error") % acctid`

    unsupported operand type(s) for %: 'exceptions.Exception' and 'str'
改正方法：

    Exception(" %s account add money error" % acctid )


2. 异常二

    Unknown column ‘xxx’ in ‘where clause’ 

`sql = "select * from testpy where account = %s" % acctid`
  answer:
`sql = "select * from testpy where account = '%s'" % acctid`