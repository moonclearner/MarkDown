# CSRF 攻击
跨站点伪造请求
以受害者的名义伪造请求发送给受攻击站点
盗用受害者的身份，到达发送邮件、发送消息、盗用你的账号、添加系统管理员、购买商品、虚拟货币转账

## principle
登录一个站点，就会产生一个会话，这个会话可能是 SESSION, Cookie 控制，浏览器与服务器之间是在会话之中，这个会话没有结束时候，攻击者可以利用你的权限对网站进行操作，如进行发送文章、发邮件、删除文章

用户浏览登录网站 A
验证成功，产生 cookie
访问 A，并执行 B 的恶意代码

访问恶意网站 B
B 要求访问 A

关键：
- CSRF 的攻击建立在浏览器与 web 服务器的会话之中
- 欺骗用户访问 URL

## classification
### 站外
外部提交数据问题，站外的恶意留言或者评论
编写脚本伪造文件请求，或者 get，post 请求

### 站内
由程序员滥用 $_REQUEST 类变量造成的

## CSRF leaks spy
抓取一个正常的请求的数据包，去掉 referer 字段后，重新提交，如果提交还是有效，那基本上存在 CSRF 漏洞
tool：CSRFTester


##　快速拖库
1. 使用普通用户发帖：

管理员有事找你：
111111[img]http://192.168.1.1:8080/dzcsrt/uc_server/admin.php?m=db&a=operate&t=export&appid=0&backupdir=xxxx%26backupfilename%3Daaaa [/img]

2. 发帖之后 后面的 img 是显示不出来的

3. 管理员进入该页面之后， 管理员登录后台会运行那一行 get 请求之后，使他的数据库进行了备份

4. 然后我们使用网页进行请求该文件地址 http:192.168.1.1:8080/dzcsrt/uc_server/data/backup/xxxx/aaaa-1.sql


## 本地网络设备 CSRF 攻击
本地网络设备一般都不会让外围访问的

使 WEB 管理端口设为 80  远程 WEB 管理 IP 255.255.255.255


## CSRF 无需浏览器
将 csrf 放到压缩文件中
自解压格式：高级自解压选项：自解压文件窗口中显示的文本

## CSRF POST
让管理员跳转到你的网址上面，然后偷偷的运行

## CSRF 蠕虫模型
同域内 CSRF 攻击获取数据几乎没有任何限制

跨域 CSRF 攻击获取数据的方法
- XSS
- 服务器代理技术
- JSON hijacing
- Flash AsctionScript

获取数据的关键数据是唯一标识：
用户 id、用户昵称、用户 email、用户个人页面地址

## XSS 与 CRSF 结合


## CSRF 防御

###　服务器的防御
http Referer token

### 验证 HTTP Referer 字段
研究请求来源地址

### 在请求地址添加 token 并验证
CSRF 攻击之所以能够成功，是因为攻击者可以伪装用户的请求，该请求中所有的用户验证信息都在 cookie 中
在请求中加入攻击者无法伪装的信息，而且这个信息不存在 cookie 中，即可防御


### 在 HTTP 有自定义属性并验证
使用 token 验证，试讲 token 以参数的形式放入 http 头中

### 在服务端严格区分 POST 和 GET
不要用 get 请求执行持久性操作

### 使用验证码或者密码方式进行操作

### 用户端的防御
不要轻易点击链接或者图片
而且要及时退出长时间链接
