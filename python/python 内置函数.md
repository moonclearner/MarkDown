# python 内置函数

## `__str__`函数

```python
#在python中，如果我们定义一个class：
class Friend():
	def __init__(self, name):
		self.name = name

if __name__ == '__main__':
	friend = Friend('Liang')
	print friend
#那么在申明一个实例对象friend并打印其信息时，python返回的是它的存储地址
<__main__ .Friend instance at 0x7ff3596c>
```

到底应该怎么做才能打印出一个对象的我们自定义的内容呢？可以通过`__str__`函数

```python
class Friend():
	def __init__(self, name):
		self.name = name

	def __str__(self):
		return "Friend : %s" % self.name

if __name__ == '__main__':
	friend = Friend('Liang')
	print friend
##此时，打印出的内容为：
Friend name : Liang
```

