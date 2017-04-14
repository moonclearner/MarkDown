# tornado

## how to read code
三个部分
```python
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")
	def post(self):
		self.write("hello, post")

# 首先执行 Application 构造函数 编译正则表达式
def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

# 监听 socket 客户端
if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()

# 可以定义多个域名
tornado.web.Application.add_handlers('buy.autohome.com.cn', [
	(r"/y/", MainHandler),
])
tornado.web.Application.add_handlers('admin.autohome.com.cn', [
	(r"/y/", MainHandler),
])
tornado.web.Application.add_handlers('delare.autohome.com.cn', [
	(r"/y/", MainHandler),
])

```

# readOrder
- Application
- tornado.web.RequestHandler
	- init
		- initialize()
	- execute
