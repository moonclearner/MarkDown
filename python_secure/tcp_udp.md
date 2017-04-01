# python TCP/UDP programming

AF_UNIX
AF_NETLINK
AF_INEF

t = socket(socket.AF_INEF, socket.SOCK_STREAM)

## function direction
s.bind()
s.listen()
s.accept()

c.connect()
c.connect_ex()

- tcp
s.recv()
s.send()

- udp
s.recvfrom()
s.sendto()

s.getsockname() # current socket ip
s.getpeername() # link currnet socket ip

s.getsockopt()  # return socket paras
s.setsockopt()

s.close()

### example
```python
form socket import *


HOST = ''
PORT = 2333
BUFSIZE = 1024

ADDR = (HOST, PORT)

tcpServer = socket(AF_INEF, SOCK_STREAM)
tcpServer.bind(ADDR)
tcpServer.listen(5)

while true:
	tcpclient, addr = tcpServer.accept()

```

## simple  rebound hell
from subprocess import Popen, PIPE

cmd = Popen(['/bin/bash', '-c', 'tree .'], stdin=PIPE, stdout=PIPE)
data = cmd.stdout.read()
