# python web
urllib urllib2 request
## urllib
urllib.urlopen()

urllib.urlretrieve()

## urllib2
urllib2.urlopen()
urllib2.request()

## request

### install
pip install request

### using

#### request to server
request.get()
request.post()
request.put()
request.delete()
request.head()
request.option()

#### transport para to url
payload = {'key1:"value"}

r = request.get(url, params=payload)
print r.url

#### response

r = request.get()
r.text
r.encoding 'utf-8'
r.encoding = 'ISO-8859-1'

#### biney response
r = request.get()
r.content

#### define request header
headers = {'content-type': 'application/json'}
r = request.get(url, headers=headers)
**headers can add cookies**

#### POST request
r = request.post(url, data=payload)

#### response status code
r = request.get(url)
r.status_code  200

#### request headers
r.headers

#### cookies
r.cookies

#### runtime setting
r = request.get(url, timeout=0.01)

## Pratice
import urllib

url = "http://www.baidu.com"
r = urllib.urlopen(url)
print r.read()

impot urllib2

## Pratice download file
impot urllib
urllib.urlretrieve('http://img.win7china.com/NewsUploadFiles/2011/12/20111225_110523_281_u.jpg', filename='/imc/cmd.png')

## web crawler

## Pratice

import requests
import re

headers = {
'Host': 'www.ichunqiu.com',
}

r = requests.get(url=url, headers=headers)
print r.text


## web crawler game
http://www.heibanke.com/lesson/crawler_ex00/
