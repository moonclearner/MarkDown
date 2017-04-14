# session
cookie
	存放在浏览器和本地文件夹中，第一次访问服务器的时候，服务器会返回一个 cookie 给客户端
	下次请求的时候，客户端需要带着 cookie 进行请求
session
	存在服务器里面的文件，将 session 建立一个框架，用于进行 session 对话

# cookie 禁用之后
登录不了 jd taobao

# django session
session_key  session_data expired_date



# 大型 session 服务器

## session 跨域
- session 存在服务器内存里面
- 多台服务器时候，就不能直接放到内存里面，需要有一个数据库，多台服务器向一个数据库中取
- 更多台服务器的时候
