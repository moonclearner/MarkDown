# pyhton基础知识 four

## 特殊的方法

| \_\_init\_\_(self,...)    | 这个方法在新建对象恰好要被返回使用之前被调用。                  |
| :------------------------ | :--------------------------------------- |
| \_\_del\_\_(self)         | 恰好在对象要被删除之前调用。                           |
| \_\_str\_\_(self)         | 在我们对对象使用print语句或是使用str()的时候调用。           |
| \_\_lt\_\_(self,other)    | 当使用 小于 运算符（<）的时候调用。类似地，对于所有的运算符（+，>等等）都有特殊的方法。 |
| \_\_getitem\_\_(self,key) | 使用x[key]索引操作符的时候调用。列表和元组                 |
| \_\_len\_\_(self)         | 对序列对象使用内建的len()函数的时候调用。                  |

### 列表综合

```python
listone = [2, 3, 4]
listtwo = [2*i for i in listone if i > 2]
print listtwo   #  [6, 8]
```

### 在函数中接收元组和列表

当要使函数接收元组或字典形式的参数的时候，有一种特殊的方法，它分别使用\*和\*\*前缀。这种方法在函数需要获取**可变数量的参数**的时候特别有用。

```python
>>> def powersum(power, *args):
... '''Return the sum of each argument raised to specified power.'''
... total = 0
... for i in args:
... total += pow(i, power)  #power^i
... return total
...
>>> powersum(2, 3, 4)
25
>>> powersum(2, 10)
100
```

由于在args变量前有*前缀，所有多余的函数参数都会作为一个元组存储在args中。如果使用的是**前缀，多余的参数则会被认为是一个字典的键/值对。

### lambda形式(匿名函数)

lambda语句被用来创建新的函数对象，并且在运行时返回它们。

```python
def make_repeater(n):
	return lambda s: s*n
twice = make_repeater(2)

print twice('word')  #wordword
print twice(5)       #10
```

print语句也不能用在lambda形式中，只能使用表达式。

### exec和eval语句

exec语句用来执行储存在字符串或文件中的Python语句。例如，我们可以在运行时生成一个包含Python代码的字符串，然后使用exec语句执行这些语句。

```python
>>> exec 'print "Hello World"'
Hello World
```

eval语句用来计算存储在字符串中的有效Python表达式

```python
>>> eval('2*3')
6
```

### assert语句

assert语句用来声明某个条件是真的。例如，如果你非常确信某个你使用的列表中至少有一个元素，而你想要检验这一点，并且在它非真的时候引发一个错误，那么assert语句是应用在这种情形下的理想语句。当assert语句失败的时候，会引发一个AssertionError。

```python
>>> mylist = ['item']
>>> assert len(mylist) >= 1
>>> mylist.pop()
'item'
>>> assert len(mylist) >= 1
Traceback (most recent call last):
File "<stdin>", line 1, in ?
AssertionError
```

### repr函数

repr函数用来取得对象的规范字符串表示。反引号（也称转换符）可以完成相同的功能。注意，在大多数时候有eval(repr(object)) == object。

```python
>>> i = []
>>> i.append('item')
>>> `i`
"['item']"
>>> repr(i)
"['item']"
```

你可以通过定义类的\_\_repr\_\_方法来控制你的对象在被repr函数调用的时候返回的内容。

## 图形软件

使用Python的GUI库——你需要使用这些库来用Python语言创建你自己的图形程序。使用GUI库和它们的Python绑定

你可以创建你自己的IrfanView、Kuickshow软件或者任何别的类似的东西。绑定让你能够使用Python语言编写程序，而使用的库本身是用C、C++或者别的语言编写的。



