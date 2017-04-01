# multiTreading programming

## thread
import thread

def fun1(arg):
	pass

def main():
	thread.start_new_thread(fun1, arg1)
	thread.start_new_thread(fun1, arg2)
	time.sleep(2)

main()

###　example2
```python
import thread
import time
from subprocess import Popen, PIPE


def ping_check():
	check = Popen(['/bin/bash', '-c', 'ping -n 2'+'127.0.0.1'], stdin=PIPE, stdout=PIPE)
	data = check.stdout.read()
	print data

ping_check()
```

## threading

```python
import threading

def fun1(key):
	print 'hello world %s' % key

def main():
	threads = []
	keys = ['zhangsun', 'list', 'wangmai']
	threads_count = len(keys)
	for i in range(threads_count):
		t = threading.Thread(target=fun1, args=(key[i],))
	for i in range(threads_count):
		threads[i].start()
	for i in range(threads_count):
		threads[i].join()
main()
```

## worker and consume mode
- Queue(qsize(), empty(), full(), pull(), get())
- Queue + Thread

### example

```python
import Quene
q = Quene.Queue()

for i in range(10):
	q.put(i)

q.empty()  # false
q.size() # 10
q.get() # like generation
```

### mode using
```python
import threading
import Quene

class DoRun(threading.Thread):
	def __init__(self, quene):
		threading.Thread.__init__(self):
		self._queue = queue

	def run(self):
		while not self._queue.empty():
			key = self._queue.get()

def main():
	threads = []
	threads_count = 10
	queue = Quene.Queue()

	for i in range(1, 255):
		queue.put()

	for i in range(threads_count):
		threads.append(DoRun(queue))

	for i in threads:
		i.start()

	for i in threads:
		i.join()

