# 常用的查询方法
## get model to json
```python
obj = model.model.object.all().values()
jsons = json.dumps(list(obj))
```
## get model one col values
```python
obj = model.model.object.all().values("name")
```
## get tuple
obj = model.model.object.all().values_list()

## get list
obj = model.model.object.all().values_list(flat=False)


### filter
- exact
	fileter(name\_\_exact)
- i
	fileter(name\_\_iexact) 不区分大小写
- contains
	查找不区分大小写 SQL like
- in
	SQL: where 字段 in [1, 2, 3]
- gt gte lt lte
	大于， 大于等于， 小于， 小于等于
- startswith
	SQL: like "start%"
- endswith
	SQL: like "%end"
- range
- year mouth day hour
- isnull
- regex

## 多对多
Models： authors = models.ManyToManyField(Author)

查询：
user = models.Author.objects.get(first_name='zhang')

添加： models.Book.object.get(name="django").add(user)

删除单个：remove，但是各自的表内数据不会删除，仅仅删除的是关联关系
删除所有关联关系：clear



