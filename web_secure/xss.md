# XSS
跨站脚本攻击
javascript
客户端攻击
但是网站管理人员也属于用户之一


## 类型
- 反射型 xss 或者叫 不持久型
- 存储型 xss
- Dom 型 xss

## principle
```php
<?php
$name = $_GET['name'];
echo "welcome $name<br>";
?>
```

在网页上访问 name=djj
返回的是 welcom djj

但是如何输入 192.168.1.1:8080/xss.php?name='"><script>alert("djj")</script>
访问就会运行就会 alert

但是如何输入 192.168.1.1:8080/xss.php?name='"><script>location()</script>
访问就会运行就会跳转

所以需要过滤这个特殊符号

## test web
https://public-firing-range.appspot.com

## 存储型 xss 或者持久型 xss
代码存储在数据库中了



