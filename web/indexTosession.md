# index

## set
```python
session['logininfo'] = li

class mydict(object):
	def __setitem__(self, name, value):
		"""docstring for __setitem__"""
		print "set"
								 ```

## get
val = session['logininfo']

```python
def __getitem__(self, name):
	"""docstring for __getitem__"""
	print "get"
```

## delete
```python
def __delitem__(self):
	"""docstring for __delitem__"""
```

## using

d = mydict[]
d[1] = 'djj'  # set
print d[1]    # get
