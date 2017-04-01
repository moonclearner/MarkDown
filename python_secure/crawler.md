# BeautifulSoup
parse HTML

# hackhttp
四叶草


## 如何避开爬虫机制
requests.get 加入 headers 即可

# BeautifulSoup
## intall BeautifulSoup
pip install BeautifulSoup4
BeautifulSoup3 has been stopped

## example
import requests
from bs4 import BeautifulSoup

url = 'http://www.baidu.com'

r = requests.get(url)

soup = BeautifulSoup(r.content, 'lxml')

print soup.title
<!-- show html title -->
print soup.title.string
<!-- remove label -->

	<a class="ui_color" target="blank" > getme</a>

### how to
**soup.find_all(name='x', attrs={'xxx',})**

data = soup.find_all(name='a', attrs={'class:'ui_color'})

for news in data:
	print news
	print news.string

## how to get similar dir
using re to

\#thread-1.html
\#thread-2.html

data = soup.find_all(name='a', attrs={'href':re.compile('thread-/d.html')})

# hackhttp
利用漏洞

国家信息安全漏洞共享平台
www.cnvd.cn
可以查询当前的软件的漏洞

## example TOMCAT
```python
import hackhttp
from bs4 import BeautifulSoup
import re

url = 'http://www.cnvd.org.cn/'

headers = {
User
cookies
}

hh = hackhttp.hackhttp()
code, head, html, redirect_url, log = hh.http(url, headers=headers)
# code return code
# head reponse header
# html HTTP reponse content
# redirect_url jump dir
# log log information
print code
```
使用原始数据包
raw = "post 请求数据可以利用找到多个分页"
hh = hackhttp.hackhttp(url=url, raw=raw)

# Muti Thread crawler
