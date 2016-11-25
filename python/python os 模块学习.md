# python 文件处理

## 文件概念

- python中的文件都是对象
- linux中一切设备都是文件
  - 磁盘文件、管道、网络socket等

在linux中

- 用户，用户组，其他用户
- rwx
  - chmod +x 文件名.py 添加执行权限

在linux和mac自带python环境

在代码的首行加入`#!usr/bin/python`	并且为该文件添加执行权限之后，就可以直接运行该python脚本

## 文件打开

syntax:	open(name[,mode[buf]])

- name: 文件名
- mode:打开文件方式
- buf:缓存大小

| mode       | 说明     | 注意                         |
| ---------- | ------ | -------------------------- |
| ‘r’        | 只读方式   | 文件必须存在                     |
| ‘w’        | 只写方式   | **文件不存在在创建文件，文件存在则清空文件内容** |
| ‘a’        | 追加方式   | 文件不存在创建文件，文件结尾增加新的内容       |
| ‘r+’/ ‘w+’ | 读写方式   |                            |
| ‘a+’       | 追加读写方式 |                            |

使用二进制打开文件：‘rb’ ,'wb' ,'ab','rb+'	

- 默认以文本方式
- 用于读取图片争取读取图片

### 文件读取方式

- read([size]) :读取文件(读取size字节，默认读取全部)

- readline([size]): 读取一行，如果size大于一行  读到‘/n’  ，如果size小于一行，则就读size字节

- readlines([size]): 读取文件io.DEFAULT_BUFFER_SIZE大小字节，返回每一行所组成的列表

  **readlines 的size为io.DEFAULT_BUFFER_SIZE 值的大小  8192  每次读取缓存相近的字节,而非输入的值**

### 文件写入方式

- write(str):将字符串写入文件中
- writelines(sequence_of_strings):写入多行到文件

```python
f = open("hello.py","")  #默认只读方式
type(f) #可以看返回的是什么类型的文件
c=f.read()
f.write("test input")
f.close()
```

## 文件处理

iter：使用迭代器来读取文件所有的数据

```python
f=open("test.txt")
iter_f=iter(f)  #将文件对象转化为迭代器   
'''并不是把文件的所有的文件传入迭代器中，每次读取下一行的时候才会存入下一行数据'''
lines=0
for line in iter_f
	lines+=1
```

