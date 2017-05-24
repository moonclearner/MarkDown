# Queryset

## create object
```python
>>> from blog.models import Blog
>>> b = Blog(name='Beatles Blog', tagline='All the latest Beatles news.')
>>> b.save()

# method 1
Author.objects.create(name="WeizhongTu", email="tuweizhong@163.com")

# method 2
twz = Author(name="WeizhongTu", email="tuweizhong@163.com")
twz.save()

# method 3
twz = Author()
twz.name="WeizhongTu"
twz.email="tuweizhong@163.com"
twz.save()

# method 4 首先尝试获取，不存在就创建，可以防止重复
Author.objects.get_or_create(name="WeizhongTu", email="tuweizhong@163.com")
# return (object, True/False) as tuple

# onetomany or manytoone create method
>>> from blog.models import Entry
>>> entry = Entry.objects.get(pk=1)
>>> cheese_blog = Blog.objects.get(name="Cheddar Talk")
>>> entry.blog = cheese_blog
>>> entry.save()
```

## Query
```python
Person.objects.all() # 查询所有
Person.objects.all()[:10] 切片操作，获取 10 个人，不支持负索引，切片可以节约内存，不支持负索引，后面有相应解决办法，第 7 条
Person.objects.get(name="WeizhongTu") # 名称为 WeizhongTu 的一条，多条会报错

get 是用来获取一个对象的，如果需要获取满足条件的一些人，就要用到 filter
Person.objects.filter(name="abc") # 等于 Person.objects.filter(name__exact="abc") 名称严格等于 "abc" 的人
Person.objects.filter(name__iexact="abc") # 名称为 abc 但是不区分大小写，可以找到 ABC, Abc, aBC，这些都符合条件

Person.objects.filter(name__contains="abc") # 名称中包含 "abc"的人
Person.objects.filter(name__icontains="abc") #名称中包含 "abc"，且 abc 不区分大小写

Person.objects.filter(name__regex="^abc") # 正则表达式查询
Person.objects.filter(name__iregex="^abc")# 正则表达式不区分大小写

# filter 是找出满足条件的，当然也有排除符合某条件的
Person.objects.exclude(name__contains="WZ") # 排除包含 WZ 的 Person 对象
Person.objects.filter(name__contains="abc").exclude(age=23) # 找出名称含有 abc, 但是排除年龄是 23 岁的
```
## object delete
```python
Person.objects.filter(name__contains="abc").delete() # 删除 名称中包含 "abc"的人

# 如果写成
people = Person.objects.filter(name__contains="abc")
people.delete()
# 效果也是一样的，Django 实际只执行一条 SQL 语句。
```

## update object
```python
# 批量更新，适用于 .all()  .filter()  .exclude() 等后面 （危险操作，正式场合操作务必谨慎）
Person.objects.filter(name__contains="abc").update('xxx') # 名称中包含 "abc"的人 都改成 xxx
Person.objects.all().delete() # 删除所有 Person 记录
```
```python
# 单个 object 更新，适合于 .get(), get_or_create(), update_or_create() 等得到的 obj，和新建很类似。
twz = Author.objects.get(name="WeizhongTu")
twz.name="WeizhongTu"
twz.email="tuweizhong@163.com"
twz.save()  # 最后不要忘了保存！！！
```

## QuerySet can iteration
```python
es = Entry.objects.all()
for e in es:
    print(e.headline)
Entry.objects.all() 或者 es 就是 QuerySet 是查询所有的 Entry 条目。
```

- 如果只是检查 Entry 中是否有对象，应该用 Entry.objects.all().exists()
- QuerySet 支持切片 Entry.objects.all()[:10] 取出 10 条，可以节省内存
- 用 len(es) 可以得到 Entry 的数量，但是推荐用 Entry.objects.count() 来查询数量，后者用的是 SQL：SELECT COUNT(*)
- list(es) 可以强行将 QuerySet 变成 列表

## Queryset can pickle
```python
>>> import pickle
>>> query = pickle.loads(s)     # Assuming 's' is the pickled string.
>>> qs = MyModel.objects.all()
>>> qs.query = query            # Restore the original 'query'.
```
## Queryset sort
```python
Author.objects.all().order_by('name')
Author.objects.all().order_by('-name') # 在 column name 前加一个负号，可以实现倒序
```

## Queryset duplicate removal
```python
qs1 = Pathway.objects.filter(label__name='x')
qs2 = Pathway.objects.filter(reaction__name='A + B >> C')
qs3 = Pathway.objects.filter(inputer__name='WeizhongTu')

# 合并到一起
qs = qs1 | qs2 | qs3
# 这个时候就有可能出现重复的

# 去重方法
qs = qs.distinct()
```
## Queryset cannot negative index
```python
Person.objects.all()[:10] 切片操作，前 10 条
Person.objects.all()[-10:] 会报错！！！

# 1. 使用 reverse() 解决
Person.objects.all().reverse()[:2] # 最后两条
Person.objects.all().reverse()[0] # 最后一条

# 2. 使用 order_by，在栏目名（column name）前加一个负号
Author.objects.order_by('-id')[:20] # id 最大的 20 条
```
## ForeignKey Query
```python
# Article.category ForeignKey to Category
# same effect
postsAll = Category.objects.get(pk=condition).article_set.all().filter(published_date__isnull=False).order_by('-published_date')
postsAll = Article.objects.filter(category__name__exact=condition).filter(published_date__isnull=False).order_by('-published_date')
```
## Queryset set operation
- first method
```
QuerySet = QuerySet1 | QuerySet
```
- second method
```python
from itertools import chain
QuerySet = chain(QuerySet1， QuerySet2)

```
- 联合 - QuerySet 的联合运算符是|，处理复制时管道“symbol.qs1 | qs2”返回所有来自 qs1 和 qs2 项目的 QuerySet（都在 QuerySet 的项目将只在结果中出现一次）。
- 交集 - 交集没有特殊的操作，因为你已经知道怎么去做。 像 filter 等链接函数在原始的 QuerySet 和新过滤器之前起了交集的作用。
- 差分 - 差分（数学上写为 qs1 \ qs2) 代表所有在 qs1 而不在 qs2 中的项目。请注意，此操作是不对称的（相对于以前的操作）。Python 中恐怕没有内置的方式，但你可以这样做：qs1.exclude(pk__in=qs2)
- 从空开始 - 开起来没有用处但实际并非如此，正如上面例子所展示的。很多时候，当我们动态建立一个 QuerySet 联合时，我们需要从一个空列表开始，这是获取它的方法：MyModel.objects.none().

## Appendix
```
filter 表示 =
exclude 表示 !=
querySet.distinct() 去重复
__exact 精确等于 like 'aaa'
__iexact 精确等于 忽略大小写 ilike 'aaa'
__contains 包含 like '%aaa%'
__icontains 包含 忽略大小写 ilike '%aaa%'，但是对于 sqlite 来说，contains 的作用效果等同于 icontains。
__gt 大于
__gte 大于等于
__lt 小于
__lte 小于等于
__in 存在于一个 list 范围内
__startswith 以... 开头
__istartswith 以... 开头 忽略大小写
__endswith 以... 结尾
__iendswith 以... 结尾，忽略大小写
__range 在... 范围内
__year 日期字段的年份
__month 日期字段的月份
__day 日期字段的日
__isnull=True/False
```
