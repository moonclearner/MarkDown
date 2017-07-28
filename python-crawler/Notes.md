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

- urllib2.request(url,data)
	如果 data 为空的时候，该请求为 post，否则是 get
	data 需要用 urllib.urlencode(data) 进行加密

### post

#### mechanize
模拟浏览器，进行表单输入，post 请求
只适用于静态网页的抓取，如果是异步的数据，则页面显示的结果与抓取的结果不一致


## 验证码 captcha
### 下载验证码图像
Pillow 推荐使用
PIL 2009 停止更新
### 光学字符识别 OCR
Tesseract 惠普
python 接口：pytesseract
将图片输入到 tesseract
- 转化为灰度图片
- 将像素小于 1 的保留，其他的返回 255，即仅仅保留全黑的像素保留

#### improvement
- 实验不同的阈值
- 腐蚀阈值文本，突出字符形状
- 调整图像大小
- 根据验证码字体训练 OCR 工具
- 限制结果为字典单词
### API 人工识别验证码
#### 9kw
- 发送 post 请求，包含验证码图片 url，apikey，等待处理的时间，返回验证码的 ID
- 发送 get 请求，包含了 apikey，验证码的 ID，等待返回数据

## scrapy
### install
pip install scrapy
scrapy 目前只支持 2.7 or pythn3.3+
scrapy 因为使用了 twist 所以 py3 的支持

### create project
scrapy startproject example

### create crawler spider
scrapy genspider spidername url --template=crawl

### 使用 shell 进行爬取
scrapy shell http://example.webscraping.com/view/Unite-Kingdom-239

### 测试
scrapy crawl spidername --output=countres.csv -s LOG_LEVEL=INFO

### LEVEL
- ERROR
	仅仅输出错误信息
- DEBUG
	输出所有的信息
- INFO
	过滤不重要的信息

### 爬虫的暂停与停止
scrapy crawl country -s LOG_LEVEL=DEBUG -s JOBDIR=crawls/country
当按下 ctrl + c 就会在执行一会然后停止，其结果会保存在 crawls/country
进入该目录之后，在使用 scrapy crawl country -s LOG_LEVEL=DEBUG -s JOBDIR=crawls/country
就会继续运行

## porita
基于 scrapy 的不需要自己写 lxml，通过点击创建爬虫的开源工具
### 安装
建议使用 virtualenv 因为 lxml 的版本比较老
### 使用
- 通过点击创建一个你需要的项目
- 开启 portiacrawl porita/slyd/data/project/new_project

## scrapely
使用训练数据建立从网页中抓取那些内容的模型
总结就是可以训练一个数据集，然后用于下载相识的网站进行爬虫
他是 porita 背后的算法


## 爬虫失败的几个原因
- 同一个域名下，发送一次请求
- 每次请求的需要延时，而且延时的时间要随机

