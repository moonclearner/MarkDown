# ipython

## install

ipython是一个 python 的交互式 shell，比默认的python shell 好用得多，支持变量自动补全，自动缩进，支持 bash shell 命令，内置了许多很有用的功能和函数。



1. cd python\Scripts\
2. pip.exe install   ipython
3. waiting
4. c:\>ipython 
   1. 进入ipython交互命令行

## 安装notebook

- pip 安装pyreadline

- easy_install.exe pyzmq

- easy_install.exe jinja2

- easy_install.exe tornado

- ipython notebook

  - if no module named notebook.notebookapp 
  - it need pip install jupyter  or pip install --upgrade jupyter

  ​

## 使用

### tab键自动补齐

在shell中输入表达式时，只要按下Tab键，当前命令控件中任何与输入的字符串相匹配的变量（对象、函数等）就会被找出来。

ps.之前我发现我的ipython没有Tab键自动补全功能，tab键的功能是缩进。最后 pip install pyreadline即可解决。

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319153731428-1661086138.png)

### 内省

在变量的前面或后面加上一个问号(?)就可以将有关该对象的一些通用信息显示出来。这就叫做对象的内省。

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319154100443-507804512.png)

如果对象是一个函数或实例方法，则其docstring也会被现实出来。

使用??还将显示出该函数的源代码。

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319155043428-1230534589.png)

一些字符串配以通配符(*)即可显示出所有与该通配符表达式相匹配的名称。

例如，我们可以列出Numpy顶级命名空间中含有“load”的所有函数

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319155458084-301637789.png)

### %run命令

所有文件都可以通过`%run`命令当做Python程序来运行

syntax：%run 路径+python文件名

### 中断正在执行的代码

按下`Ctrl-C`就会引发一个KeyboardInterrupt

### 执行剪贴板中的代码

使用`ctrl+shift+v`将剪贴板的代码片段粘贴出来，则不需要右键粘贴

`%paste`可以承载剪贴板中的一切文本，并在shell中以整体形式执行。

`%cpaste`跟`%paste`差不多，只不过它多出了一个用于粘贴代码的特殊提示符而已。如果发现粘贴的代码有错，只需要按下`ctrl+c`即可终止`%cpaste`提示。

### 快捷键

- Ctrl-P    或上箭头键 后向搜索命令历史中以当前输入的文本开头的命令
- Ctrl-N   或下箭头键 前向搜索命令历史中以当前输入的文本开头的命令
- Ctrl-R   按行读取的反向历史搜索（部分匹配）
- Ctrl-A   将光标移动到行首
- Ctrl-E   将光标移动到行尾
- Ctrl-K   删除从光标开始至行尾的文本
- Ctrl-U   清除当前行的所有文本
- Ctrl-F   将光标向前移动一个字符
- Ctrl-b   将光标向后移动一个字符
- Ctrl-L   清屏

### 异常和跟踪

待补充

### 魔术命令

- `%quickref` 显示IPython的快速参考
- `%magic` 显示所有魔术命令的详细文档
- `%debug` 从最新的异常跟踪的底部进入交互式调试器
- `%hist` 打印命令的输入（可选输出）历史
- `%pdb` 在异常发生后自动进入调试器
- `%paste` 执行剪贴板中的Python代码
- `%cpaste` 打开一个特殊提示符以便手工粘贴待执行的Python代码
- `%reset` 删除interactive命名空间中的全部变量/名称
- `%page OBJECT` 通过分页器打印输出OBJECT
- `%run script.py` 在IPython中执行一个Python脚本文件
- `%prun statement` 通过cProfile执行statement，并打印分析器的输出结果
- `%time statement` 报告statement的执行时间
- `%timeit statement` 多次执行statement以计算系综平均执行时间。对那些执行时  间非常小的代码很有用
- `%who、%who_ls、%whos` 显示interactive命名空间中定义的变量，信息级别/冗余度可变
- `%xdel variable` 删除variable，并尝试清除其在IPython中的对象上的一切引用

### 基于Qt的富GUI控制台

Ipython团队开发了一个基于Qt框架（其目的是为终端应用程序提供诸如内嵌图片、多行编辑、语法高亮之类的富文本剪辑功能）的GUI控制台。

```
ipython qtconsole --pylab=inline
```

就会进入jupyter QtConsole图形界面

```python
Jupyter QtConsole 4.2.1
Python 2.7.12 (v2.7.12:d33e0cf91556, Jun 27 2016, 15:19:22) [MSC v.1500 32 bit (Intel)]
Type "copyright", "credits" or "license" for more information.

IPython 5.1.0 -- An enhanced Interactive Python.
?         -> Introduction and overview of IPython's features.
%quickref -> Quick reference.
help      -> Python's own help system.
object?   -> Details about 'object', use 'object??' for extra details.
In [1]:
```

如果不能启动的话，`pip install qtconsole`

### matplotlib集成与pylab模式

启动Ipython时加上--pylab标记来集成matplotlib

进入ipython时候，输入`ipython --pylab`

如果显示 `ImportError ：No module named matplotlib`

只需要安装matplotlib   `pip.exe install matplotlib`   

Matplotlib是一个Python的图形框架，类似于MATLAB和R语言。

可以图形化显示数据

[matplotlib使用](http://old.sebug.net/paper/books/scipydoc/matplotlib_intro.html)

### 搜索并重用历史命令

历史命令用上下箭头就好啦，ctrl+p和ctrl+n 太麻烦啦。

ctrl+r用于实现部分增量搜索，按下ctrl+r并输入你想搜索的行中的几个字符。按下ctrl+r将会循环搜索历史命令中每一条与输入相符的行。

### 输入和输出变量

ipython将最近的两个输出结果保存在_(一个下划线)和__(两个下划线)变量中

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319192246974-1319147098.png)

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319192257943-459695453.png)

输入的文本被保存在名为\_iX的变量中，其中X是输入行的行号。比如说，在输入完27行后，就会产生两个新变量\_27(输出变量)和\_i27(输入变量)

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319192456678-796798889.png)

### 记录输入和输出

执行%logstart既可开始记录日志

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319192627959-2141553893.png)

### 与操作系统交互

| 命令                    | 说明                       |
| --------------------- | ------------------------ |
| !cmd                  | 在系统shell中执行cmd           |
| output=!cmd args      | 执行cmd，并将stdout存放在output中 |
| %alias alias_name cmd | 为系统shell命令定义别名           |
| %bookmark             | 使用ipython的目录书签系统         |
| %cd directory         | 将系统的工作目录更改为directory     |
| %pwd                  | 返回系统的当前工作目录              |
| %pushd directory      | 将当前目录入栈，并转向目标目录          |
| %popd                 | 弹出栈顶目录，并转向目标             |
| %dirs                 | 返回一个含有当前目录栈的             |
| %dhist                | 打印目录访问历史                 |
| %env                  | 以dict形式返回系统环境变量          |

### 目录书签系统

ipython 保存你常用的目录的别名，以便是实现快速跳转到常用的目录

syntax：%bookmark  别名    /常用的目录

下次使用：cd 别名 

%bookmark -l  显示所有的目录书签

### 软件开发工具

#### 交互式调试器

调试代码的最佳时期之一就是错误刚刚发生那会儿。

`%debug`命令（在发生异常之后马上输入）将会调用哪个“事后调试器”，并直接跳转到引发异常的那个栈帧（stack frame）

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319233001099-1585453825.png)

在这个调试器中，可以执行任意python代码并查看各个栈帧中的一切对象和数据（也就是解释还“留了条生路”的那些）。

默认从最低级开始的（即错误发生的地方）。

输入u（up）和d（down）即可在栈跟踪的个级别之间的切换

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319233333771-296978243.png)

执行%Pdb命令可以让ipython在出现异常之后自动调用调试器。

此外，调试器还可以为代码开发工作提供帮助，尤其是当你想要设置断点或对函数、脚本进行单步调试以查看各条语句的执行情况时。实现这个目的的方式有几个。第一，使用带有-d选项的%run命令，这将会在执行脚本文件中发代码之前先打开调试器。必须立即输入s才能进入脚本：

```python
In[5]:run -d test.py
Breakpoint 1 at d:/test.py:1
NOTE:Enter 'c' at the ipdb>prompt to start your script.
><string>(1)<module>()

ipdb>s
>d:\test.py(1)<module>()
 1--->
```

在此之后，该文件接下来的执行方式就凭你一句话。比如说，在上面的异常中，我们可以调用work_fine方法的地方设置一个断点，然后输入c 使脚本一直运行下来直到断点为止：

```python
ipdb> b 12  #在脚本的第12行设置断点
ipdb> c  #使脚本一直运行下来直到断点为止
```

这时可以单步进入works_fine()或者执行work_fine()(输入n直接执行到下一行)

`ipdb>n`   #执行13行

`ipdb>!变量`  #可以看变量的信息

测试代码的执行时间：%time和%timeit





#### 调试器命令

| 命令                       | 功能                                       |
| ------------------------ | ---------------------------------------- |
| q                        | 退出调试器                                    |
| b number                 | 在number行设置断点   **%run -d -b2 test.py   自动在第二行设置一个断点** |
| b path/to/file.py:number | 在指定文件的number行设置断点                        |
| s                        | 单步进入函数调用                                 |
| n                        | 执行当前行，并且进到当前级别的下一行                       |
| u/d                      | 在函数调用栈中向上或向下移动                           |
| a                        | 显示当前函数                                   |
| debug statement          | 在新的（递归）调试器中调用语句statement                 |
| l                        | 显示当前行，以及当前栈级别上的上下文参考                     |
| w                        | 打印当前位点完全栈跟踪（包括上下文参考代码）                   |

#### 调试器的其他使用场景

```python
def set_trace():
    from IPython.core.debugger import Pdb
    Pdb(color_scheme='linux').set_trace(sys._getframe().f_back)
    
def debug(f,*args,**kwargs):
    from IPython.core.debugger import Pdb
    pdb=Pdb(color_scheme='linux')
    return pdb.runcall(f,*args,**kwargs)
```

**set_trace** 将其放在你的代码中的任何一行你希望停下来查看一番的地方（比如说异常）

按下c使代码恢复执行，不受影响。

**debug**是你能够在任何函数上使用调试器。

```python
def f(x,y,z=1):
    tmp=x+y
    return tmp/z
```

假设你写了一个f函数，相对其进行单步调试。f的正常使用是f（1，2，z=3）为了能够单步进入f。我们需要：

```python
In[2]:debug(f,1,2,z=3)

...

ipdb>
```

### 测试代码的执行时间：%time和%timeit

有时候你可能会希望了解某个复杂计算过程中到底是哪些函数占用的时间最多。

ipython专门提供了两个魔术函数（%time和%timeit）以便自动完成该过程。

%time一次执行一条语句，然后报告总体执行时间。

例子：下面是一个拥有60万字符串的数组，以及两个不同的“能够选出其中以foo开头的字符串”的方法：

```python
#一个非常大的字符串数组
strings = ['foo','foobar','baz','qux','python','Guido Van Rossum']*100000
method1 = [x for x in strings if x.startswith('foo')]
mathod2 = [x for x in strings if x[:3] == 'foo']
```

如果你对相同的语句多次执行%time的话，就会发现其结果是会变的

为了得到更为精确的结果，需要使用魔术函数%timeit，对于任意语句，它会自动多次执行以产生一个非常精确的平均执行时间。

![img](http://images2015.cnblogs.com/blog/911998/201603/911998-20160319235038599-468407437.png)

### 基本性能分析：%prun和%run -p

python性能分析工具是cprofile模块，一般在命令行上使用：

`python -m cprofile -s cumulative test.py`   #-s 标记指定以累积的方式排序规则

在ipython 可以使用`%run -p -s cumulative test.py`

即可显示各个函数所耗费的时间，如果一个函数调用了别的函数，计时器是不会停下来重新计时的

cprofile记录的是各个函数的起始和结束时间

在ipython中可以使用`%run -p` 或者`%prun` 

举例：`%prun -l  7 -s cumulative 函数()   #分析任意函数块的性能`

#### 逐步分析函数性能

IPython 中line_profiler小型库，用的时候需要启动该扩展，要进行配置

### IPython Notebook

运行在命令行上的轻量级服务器进程，即在web上使用ipython进行命令行操作



## quetion：



利用Python进行数据分析第三章

转载于：http://www.cnblogs.com/zzhzhao/p/5295476.html
