# API 接口验证

## md5
```python
import md5
import time


time_str = time.time()
password = "djj"
print md5.md5(password).hexdigest()

token_str = '%s|%s' % (password, time_str)
print md5.md5(token_str).hexdigest()
# 讲时间用 get 的传输给服务端
print time_str


# 服务端 需要添加一个时间戳和过期时间和检验的次数为一次（使用 session)
```

## md5 hmac signature
```python
import hmac
import hashlib


hashcode = hmac.new(token_str, password).hexdigest())
```

# user auth vaild
It need user table and table has auto columns

# decorator
将验证登录和研究权限设计成为一个装饰器
