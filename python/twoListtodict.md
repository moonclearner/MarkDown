# 2017/3/20 星期一 14:24:48
```python
l1=[1,2,3]
l2=['baidu','google','bing']

# py3.x
dict(map(lambda x,y:[x,y], l1,l2))
{1:'baidu', 2:'google', 3:'bing'}

# py2.x
dict(zip(l1,l2))
```
