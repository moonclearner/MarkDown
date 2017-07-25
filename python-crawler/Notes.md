# Learning Web Scraping with Python Notes

## chapter ONE

### Is It legal
- check robots.txt
	- http://www.example.org/robots.txt
- check sitemap
	- http://www.example.org/sitemap.html
#### explain
robots（爬虫协议） 网站通过 Robots 协议告诉搜索引擎哪些页面可以抓取，哪些页面不能抓取，而且包括通过什么代理，已经爬取延迟 sitemap 等
sitemap 可方便网站管理员通知搜索引擎他们网站上有哪些可供抓取的网页


### How to value web size
- via google or to search, input: site:www.taobao.com
- http://zhanzhang.baidu.com

### check web technology
- python package builtwith

### check web owner
- python package whois

### download web
- python package urllib2

### diff
- urllib2
- urllib
- request

### how to parse robots.txt
- package python robotparser

### support proxy
- urllib2
- requests

### support delay
记录同一个域名下，下载中需要有延时

### how to avoid crawpler trap
当遇到动态生成页面内容，如日历
方法是记录深度，获取 link 的深度进行计数

## chapter TWO
Data extract

### methods
- regex
- beautiful Soup
- lxml

#### performance VS
`regexr<lxml<beautifulsoup`

## chapter THREE
每次下载之前检测缓存
- 检测缓存是否定义
- 检测缓存里面有没有缓存该 URL
- 检测该 URL 的 code，是否是服务器错误
- 如果都通过就返回该缓存

### cache TYPE
- RAM cache
- 文件 cache

#### disk cache(file cache)
注意不同的系统，其文件系统的非法符号
linux：`/ 和 \0`
Windows: `\, /, ?, :, *, ", >, <, |`
以及文件名长度为 255
文件系统文件数量限制

##### process
- url to pathname
- to get `__getitem__` pickle.load(result) 合理使用 raise 去抛出 keyError
- to save `__setitem__` pickle.dumps(result)

其中可以判断 os.path.exists(urlToPath)
folder = os.path.dirname(path)
以及 os.makedirs(folder)

##### to save disk
使用 zlib 去压缩内存
fp.write(zlib.compress(pickle.dumps(result))
pickle.loads(zlib.decompress(fp.read()))

##### clear expires data
add expires index

#### DATAbase cache
NOSQL not only SQL
易扩展、跨服务器无缝分片

HBase（列数据存储）
Redis（键值对存储）
MongoDB（面向文档的数据库）
Neo4j（图形数据库）

##### MongoDB
- 安装 pip install MongoDB
- mongod -dbpath
```python
# use MongoDB
from pymongo import MongoClient
client = MongoClient('client', 27017)
# url is web url
# html is web url content
db = client.cache
# create a database
db.webpage.insert({'url':url, 'html':html})
db.webpage.find_one(url=url)
# if insert same url will insert muti message
db.webpage.insert({'url':url, 'html':html})
db.webpage.find(url=url).count()

db.webpage.upsert({'_id':url}, {'$set':{'html':html}}, upsert=True)
db.webpage.find_one({'_id':url})
```
- MongoDB 关于过期时间，是每一分钟扫描一次，然后进行判断
```python
db.webpage.create_index('timestamp', expireAfterSeconds=timedelta(days=30))
# insert data
record = {'result':result, 'timestamp':datatime.utcnow()}
db.webpage.update({'_id':url}, {'$set':record}, upsert=True)
```

##### performance
数据库缓存的时间是磁盘缓存的两倍

## chapter four
并发
- 统计各个大型网站的链接
	http:/www.alexa.com/topsites
http://s3.amazonaws.com/alexa-static/top-1m.csv.zip

### 多线程
- thread.join()
- thread.setDaemon()
- thread.is_alive() 判断线程是否存活

### 消息传输
- Celery

### 使用 MongoDB 作为消息队列
- 将传入的 url 设置为三种状态：刚刚传入队列，处理中，以及处理完毕
- 设置 timestamp
- 设计的函数包括了：存入 url，取出 url，改变 url 完成的标志位，

## 动态内容
### 对动态网页进行逆向工程
如何下载利用 ajax 下载到的 json, 使用 json 进行解析

### GWT(Google Web Toolkit)
压缩的 js 可以被 jsbeautifier 进行还原

### WebKit 渲染引擎
就是模仿浏览器对 html、css、js 进行渲染
QT 可以获得 webkit 的接口

### Selenium
浏览器自动化的 API，支持大多数浏览器
比如输入值，选取值，点击等自动化处理

## 表单处理
### 登录表单
输入登录表单
- urllib.urlencode({'email':dd, 'password':123})
- 登录表单中有些值是隐藏的，可以用 lxml 解析出来，比如_formkey, 为了避免 form 多次提交，每次加载网页的时候，会产生一个不同的 ID
- cookie，当用户加载登录表单的时候，_formkey 会保存到 cookie 中，然后在提交的时候，该值与提交的登录表单数据中的_formkey 对比
	- 需要开启 cookie urllib.HTTPCookieProcessor 支持 cookie
#### 使用浏览器加载 cookie
不同的浏览器存储 cookie 的方式不一样
Firefox 在 sqllite 数据库中存储 cookie，在 json 文件中存储 session
登录的时候 只需要 session，使用 json 读取该文件

- os.path.expanduser(file) 替换~
- glob.glob 替换*
- browsercookie 快速的进行浏览器加载 cookie

