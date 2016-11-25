
**tools->sublimeREPL->python->Pdb current file**

** ctrl shift r python格式化


然后你就可以输出各种pdb命令进行调试了。比如：

(Pdb) b 31              #在31行建立断点

Breakpoint 1 at c:\work\code\workspace\test\sqlalchemy\docopt.py:31

(Pdb) r                    #运行到断点处
> c:\work\code\workspace\test\sqlalchemy\docopt.py(31)<module>()
-> m=MyClass()

(Pdb)                       #在这个命令行下就可以执行当前上下文的python


具体的pdb命令百度去.