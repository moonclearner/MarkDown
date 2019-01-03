## env
- requests
- virtualenv
- virtualenvwrapper
- gunicorn
- httpbin
	\>\>gunicorn httpbin:app

## http
超文本传输协议

### request
- GET / HTTP/1.1
- Host: www.imooc.com
- User-Agent:cuml/7.43.0
- Accept: \*/\*

## urllib urllib2 urllib3
connection:close
- urllib.urlencode({'k':'v',})


## requests
connection:keep-alive
### get
- resp = requests.get(IP)
- resp.headers
- resp.text

### get with params
- params = {'k':'v',}
- resp = requests.get(IP, params=params)
- resp.status_code
- resp.reason
- resp.json()

## github API

### 自定义 requests
urllib3 的连接池的功能，减少资源

- session
	- proxy
	- timeout
	- verify
- PreparedRequest
	- body
	- headers
	- auth
- Response
	- text
	- json

```
def hard_requests():
	from requests import Request, Session
	s = Session()
	headers = {'User-Agent': 'fake1.3.4'}
	req = Request('GET', build_url('user/email'), auth=('user', 'passwd'), headers=headers)
	prepped = req.prepare()
	print prepped.body
	print prepped.headers


	resp = s.send(prepped, timeout=5)
	print resp.status_code
	print resp.request.headers
	print resp.text
```
### 下载文件
##### 流方法
流需要进行关闭
from contextlib import closing
with closing(request.get(url, headers=headers, stream=True)) as resp:
	with open('demo.jpg', 'wb') as fd:
		for chunk in resp.iter_content(128):
			fd.write(chunk)


from contextlib import nested
with nested(closing(request.get(url, headers=headers, stream=True)), open('demo.jpg', 'wb')) as (resp, fd):
	for chunk in resp.iter_content(128):
		fd.write(chunk)

### 事件钩子
自动使用事件钩子函数
```
def get_key_info(response, *args, **kwargs):
	# 回调函数
	print response.headers['Content-Type']


def main():
	request.get(url, hooks=dict(response=get_key_info))

main()
```

### HTTP 基本认证

request.get(url, auth=('user', 'passwd'))

response.request.headers:

{'Authorization': 'Basic awdafafwfafwfwfafwfawf=='}
awdafafwfafwfwfafwfawf is base64code

import base64
base64.b64decode('awdafafwfafwfwfafwfawf==')


### OAYTH 认证
```
headers = {'Authorization': 'token dadafafafafaf'}
request.gey(url, headers=headers)

# 等同于
from request.auth import AuthBase
class GITHUB(AuthBase):
	def __init__(self, token):
		self.token = token

	def __call__(self, r):
		# request + headers
		r.headers['Authorization'] = ' '.join(['token', self.token])
		return r

def oauth_advanced():
	auth = GITHUB('dadafafafafaf')
	response = request.get(url, auth=auth)
	print response.text
```

## 代理 proxy
socks5
socks.set_default_proxy(socks.SOCKS5,"127.0.0.1",1080)
socket.socket=socks.socksocket

proxies = {'http': 'socks5://127.0.0.1:1080', 'https': 'socks5://127.0.0.1:1080'}

request.get(url, proxies=proxies, timeout=5)

## Session and Cookie
- 第一次请求
r = request.get(url)
r.cookie[]
- 下次请求
cookies = dict[c='uid']
requests.get(url, cookies=cookies)
