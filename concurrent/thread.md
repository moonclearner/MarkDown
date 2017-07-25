# thread
## thread
```python
import thread
def worker():
    """thread worker function"""
    print 'Worker'
thread.start_new_thread(worker)
```

```python
import thread
import time

# 一个用于在线程中执行的函数
def func():
    for i in range(5):
        print 'func'
        time.sleep(1)

    # 结束当前线程
    # 这个方法与 thread.exit_thread() 等价
    thread.exit() # 当 func 返回时，线程同样会结束

# 启动一个线程，线程立即开始运行
# 这个方法与 thread.start_new_thread() 等价
# 第一个参数是方法，第二个参数是方法的参数
thread.start_new(func, ()) # 方法没有参数时需要传入空 tuple

# 创建一个锁（LockType，不能直接实例化）
# 这个方法与 thread.allocate_lock() 等价
lock = thread.allocate()

# 判断锁是锁定状态还是释放状态
print lock.locked()

# 锁通常用于控制对共享资源的访问
count = 0

# 获得锁，成功获得锁定后返回 True
# 可选的 timeout 参数不填时将一直阻塞直到获得锁定
# 否则超时后将返回 False
if lock.acquire():
    count += 1

    # 释放锁
    lock.release()

# thread 模块提供的线程都将在主线程结束后同时结束
time.sleep(6)
```
### thread 模块提供的其他方法
thread.interrupt_main(): 在其他线程中终止主线程。
thread.get_ident(): 获得一个代表当前线程的魔法数字，常用于从一个字典中获得线程相关的数据。这个数字本身没有任何含义，并且当线程结束后会被新线程复用。
thread 还提供了一个 ThreadLocal 类用于管理线程相关的数据，名为 thread._local，threading 中引用了这个类。
由于 thread 提供的线程功能不多，无法在主线程结束后继续运行，不提供条件变量等等原因，一般不使用 thread 模块，这里就不多介绍了。

## threading
```
import threading
def worker():
    """thread worker function"""
    print 'Worker'
t = threading.Thread(target=worker)
t.start()

import threading
class worker(threading.Thread):
    def __init__(self):
        pass
    def run():
        """thread worker function"""
        print 'Worker'

t = worker()
t.start()

```
