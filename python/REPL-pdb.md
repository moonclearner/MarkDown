
**tools->sublimeREPL->python->Pdb current file**

** ctrl shift r python格式化

然后你就可以输出各种pdb命令进行调试了。比如：
(Pdb) b 31              #在31行建立断点
Breakpoint 1 at c:\work\code\workspace\test\sqlalchemy\docopt.py:31
(Pdb) r                    #运行到断点处
> c:\work\code\workspace\test\sqlalchemy\docopt.py(31)<module>()
-> m=MyClass()

(Pdb)                       #在这个命令行下就可以执行当前上下文的python

##断点设置 
(Pdb)b 10 #断点设置在本py的第10行
或(Pdb)b ots.py:20 #断点设置到 ots.py第20行
删除断点（Pdb）b #查看断点编号
(Pdb)cl 2 #删除第2个断点
##运行
(Pdb)n #单步运行
(Pdb)s #细点运行 也就是会下到，方法
(Pdb)c #跳到下个断点
##查看
(Pdb)p param #查看当前 变量值
(Pdb)l #查看运行到某处代码
(Pdb)a #查看全部栈内变量

##如果是在 命令行里的调试为：
import pdb
def tt():
    pdb.set_trace()
    for i in range(1, 5):
        print i

/>>> tt()
