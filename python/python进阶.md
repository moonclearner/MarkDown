### 函数式编程

functional 函数式编程是一种编程范式

c语言使用的是函数
python就可以使用函数式编程
更加抽象

纯函数式编程：不需要变量，测试简单 支持高阶函数，代码简洁

python不是纯函数式编程 ：
允许有变量  
支持高阶函数：函数可以作为变量传入
支持闭包，有了闭包可以返回函数
有限度的支持匿名函数

### 高阶函数

变量可以指向函数

    f=abs
    f(-20)
    >>>20

类似abs(-20)

函数名仅仅是指向函数

abs=len
abs(-20)
就会报错
但是

    abs([1,2,3])
    >>>3

这个代表abs已经指向len这个函数了

高阶函数：能接受函数做参数的函数
变量可以指向函数
函数的参数可以接收变量
一个函数可以接收另一个函数作为参数
能接收函数作为参数的函数就是高阶函数

DEMO：

    >>>def add(x,y,f):
       return f(x)+f(y)
    >>>add(-5,9,abs)
    14


### map()函数

map()是 Python 内置的高阶函数，它接收一个函数 f 和一个 list，并通过把函数 f 依次作用在 list 的每个元素上，得到一个新的 list 并返回。

    def f(x):
        return x*x
    print map(f, [1, 2, 3, 4, 5, 6, 7, 8, 9])

输出结果：

    [1, 4, 9, 10, 25, 36, 49, 64, 81]

**由于list包含的元素可以是任何类型，因此，map() 不仅仅可以处理只包含数值的 list，事实上它可以处理包含任意类型的 list，只要传入的函数f可以处理这种数据类型。**

### reduce()函数
reduce()函数也是Python内置的一个高阶函数。reduce()函数接收的参数和 map()类似，一个函数 f，一个list，但行为和 map()不同，reduce()传入的函数 f 必须接收两个参数，reduce()对list的每个元素反复调用函数f，并返回最终结果值。

    def f(x, y):
        return x + y

调用 reduce(f, [1, 3, 5, 7, 9])时，reduce函数将做如下计算：

    先计算头两个元素：f(1, 3)，结果为4；
    再把结果和第3个元素计算：f(4, 5)，结果为9；
    再把结果和第4个元素计算：f(9, 7)，结果为16；
    再把结果和第5个元素计算：f(16, 9)，结果为25；
    由于没有更多的元素了，计算结束，返回结果25。

reduce()还可以接收第3个可选参数，作为计算的初始值。如果把初始值设为100，计算：

    reduce(f, [1, 3, 5, 7, 9], 100)

    计算初始值和第一个元素：f(100, 1)，结果为101。

### filter()函数

filter()函数是 Python 内置的另一个有用的高阶函数，filter()函数接收一个函数 f 和一个list，这个函数 f 的作用是对每个元素进行判断，返回 True或 False，filter()根据判断结果自动过滤掉不符合条件的元素，返回由符合条件元素组成的新list。

例如，要从一个list [1, 4, 6, 7, 9, 12, 17]中删除偶数，保留奇数，首先，要编写一个判断奇数的函数：

    def is_odd(x):
        return x % 2 == 1

然后，利用filter()过滤掉偶数：

    filter(is_odd, [1, 4, 6, 7, 9, 12, 17])

    结果：[1, 7, 9, 17]

利用filter()，可以完成很多有用的功能，例如，删除 None 或者空字符串：

    def is_not_empty(s):
        return s and len(s.strip()) > 0
    filter(is_not_empty, ['test', None, '', 'str', '  ', 'END'])

    结果：['test', 'str', 'END']

注意: s.strip(rm) 删除 s 字符串中开头、结尾处的 rm 序列的字符。

    s.strip(rm)        删除s字符串中开头、结尾处，位于 rm删除序列的字符
    >>> s='abigab'
    >>> rm='a'
    >>> s.strip(rm)
    'bigab'     #s字符串开头处'a'被删除
    >>> rm='abc'
    >>> s.strip(rm)
    'ig'          #s字符串开头处'ab'和结尾处'ab'被删除
    rm只是一个变量名，比如使用de替换以上rm也能实现


当rm为空时，默认删除空白符（包括'\n', '\r', '\t', ' ')，如下：

    a = '     123'
    a.strip()

结果： '123'

    a='\t\t123\r\n'
    a.strip()

结果：'123'

DEMO：请利用filter()过滤出1~100中平方根是整数的数，即结果应该是：

[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

    filter() 接收的函数必须判断出一个数的平方根是否是整数，而 math.sqrt()返回结果是浮点数。

    参考代码:

    import math
    def is_sqr(x):
        r = int(math.sqrt(x))
        return r*r==x
    print filter(is_sqr, range(1, 101))

### sorted()
Python内置的 sorted()函数可对list进行排序：

    >>>sorted([36, 5, 12, 9, 21])
    [5, 9, 12, 21, 36]

但 sorted()也是一个高阶函数，它可以接收一个比较函数来实现自定义排序，比较函数的定义是，传入两个待比较的元素 x, y，如果 x 应该排在 y 的前面，返回 -1，如果 x 应该排在 y 的后面，返回 1。如果 x 和 y 相等，返回 0。

因此，如果我们要实现倒序排序，只需要编写一个reversed_cmp函数：

    def reversed_cmp(x, y):
        if x > y:
            return -1
        if x < y:
            return 1
        return 0

这样，调用 sorted() 并传入 reversed_cmp 就可以实现倒序排序：

    >>> sorted([36, 5, 12, 9, 21], reversed_cmp)
    [36, 21, 12, 9, 5]

sorted()也可以对字符串进行排序，字符串默认按照ASCII大小来比较：

    >>> sorted(['bob', 'about', 'Zoo', 'Credit'])
    ['Credit', 'Zoo', 'about', 'bob']

'Zoo'排在'about'之前是因为'Z'的ASCII码比'a'小。

*2016/10/6 星期四 18:47:17* 

### 返回函数

Python的函数不但可以返回int、str、list、dict等数据类型，还可以返回函数！
```python
def f():
    print 'call f()...'
    # 定义函数g:
    def g():
        print 'call g()...'
    # 返回函数g:
    return g
```
仔细观察上面的函数定义，我们在函数 f 内部又定义了一个函数 g。由于函数 g 也是一个对象，函数名 g 就是指向函数 g 的变量，所以，最外层函数 f 可以返回变量 g，也就是函数 g 本身。

调用函数 f，我们会得到 f 返回的一个函数：
```python
>>> x = f()   # 调用f()
call f()...
>>> x   # 变量x是f()返回的函数：
<function g at 0x1037bf320>
>>> x()   # x指向函数，因此可以调用
call g()...   # 调用x()就是执行g()函数定义的代码
```
区分返回值：

```python
def myabs():
    return abs   # 返回函数
def myabs2(x):
    return abs(x)   # 返回函数调用的结果，返回值是一个数值
```
返回函数可以延迟执行

```
def calc_sum(lst):
    return sum(lst)
```
调用calc_sum()函数时，将立刻计算并得到结果：
```
>>> calc_sum([1, 2, 3, 4])
10
```
但是，如果返回一个函数，就可以“延迟计算”：
```
def calc_sum(lst):
    def lazy_sum():
        return sum(lst)
    return lazy_sum
```
调用calc_sum()并没有计算出结果，而是返回函数:
```
>>> f = calc_sum([1, 2, 3, 4])
>>> f
<function lazy_sum at 0x1037bfaa0>
```
对返回的函数进行调用时，才计算出结果:
```
>>> f()
10
```
由于可以返回函数，我们在后续代码里就可以决定到底要不要调用该函数。
#### quetion：
请编写一个函数calc_prod(lst)，它接收一个list，返回一个函数，返回函数可以计算参数的乘积。
```python
def calc_prod(lst):
    def lazy_prod():
        def f(x, y):
            return x * y
        return reduce(f, lst, 1)
    return lazy_prod
f = calc_prod([1, 2, 3, 4])
print f()
```
or
```
def calc_prod(lst):
    def ma():
        return reduce(lambda x,y : x*y, lst)
    return ma

f = calc_prod([1, 2, 3, 4])
print f()
```
there are some error
```
def calc_prod(lst):
        return reduce(lambda x,y : x*y, lst)

f = calc_prod([1, 2, 3, 4])
print f()
```
**error:'int' object is not callable**
因为该calc_prod返回的是一个int，我们给他赋值为一个函数

### lambda
*通常是在需要一个函数，但是又不想费神去命名一个函数的场合下使用，也就是指匿名函数*

	lambda x,y:x*y
	>>> l = ['foo', 'bar', 'far'] 
	>>>>map(lambda x: x.upper(), l) 
	['FOO', 'BAR', 'FAR'] 
	>>> filter(lambda x: 'f' in x, l) 
	['foo', 'far'] 
	>>> map(lambda x: x.upper(), filter(lambda x: 'f' in x, l)) 
	['FOO', 'FAR'] 
	>>> reduce(lambda a, b: a * b, xrange(1, 5)) 24


### 闭包
在函数内部定义的函数和外部定义的函数是一样的，只是他们无法被外部访问：

	def g():
	    print 'g()...'
	
	def f():
	    print 'f()...'
	    return g

将 g 的定义移入函数 f 内部，防止其他代码调用 g：

	def f():
	    print 'f()...'
	    def g():
	        print 'g()...'
	    return g

但是，考察上一小节定义的 calc_sum 函数：

	def calc_sum(lst):
	    def lazy_sum():
	        return sum(lst)
	    return lazy_sum

注意: 发现没法把 lazy_sum 移到 calc_sum 的外部，因为它引用了 calc_sum 的参数 lst。

像这种内层函数引用了外层函数的变量（参数也算变量），然后返回内层函数的情况，称为闭包（Closure）。

闭包的特点是返回的函数还引用了外层函数的局部变量，所以，要正确使用闭包，就要确保引用的局部变量在函数返回后不能变。举例如下：

希望一次返回3个函数，分别计算1x1,2x2,3x3:

	def count():
	    fs = []
	    for i in range(1, 4):
	        def f():
	             return i*i
	        fs.append(f)
	    return fs
	
	f1, f2, f3 = count()

你可能认为调用f1()，f2()和f3()结果应该是1，4，9，但实际结果全部都是 9（请自己动手验证）。

原因就是当count()函数返回了3个函数时，这3个函数所引用的变量 i 的值已经变成了3。由于f1、f2、f3并没有被调用，所以，此时他们并未计算 i*i，当 f1 被调用时：

	>>> f1()
	9     # 因为f1现在才计算i*i，但现在i的值已经变为3

因此，返回函数不要引用任何循环变量，或者后续会发生变化的变量。