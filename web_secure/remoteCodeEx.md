# 远程代码执行

## OS 命令执行
shell

## Web 命令行执行
asp,php,jsp
python, perl

## 数据库命令行执行


## 第三方软件命令执行
远程溢出漏洞
本地提权漏洞
读写操作

使用绿盟的扫描软件，就可以找到

# 命令执行模型

## php 命令注入攻击
具有一些具有命令执行功能的函数

system:
string system(string commandm, int &return_var)

exec:
string exec(string command, array&output, int &return_var)

Passthru:
void passthru(string command, int &return_var)

shell_exec()

\`\`运算符
$output = \`$cmd\`;

### eval 注入攻击利用
eval 将字符串作为 php 代码可以执行
Mixed eval(string code_str)

### 漏洞实例分析
@eval(file_get_content('php://input'))


### php webshell
system(),passthru(),shell_exec(),popen()


### php create_function() 注入执行漏洞
create_function() 创建匿名函数

### 防御
php.ini disable_functions=

删掉 system32 wshom.ocx


## example

windows
command1&&command2

linux:
command1;command2

# jboos
反序列化漏洞
tools: Jboss JMX/EJBInvokerServlet、HtmlAdaptor 漏洞利用工具
需要.war 木马

linux:netstate -Int   查看开启的端口
linux: find / -name index.jsp  在 / 查找 index.jsp


# strut2
K8 struts Exploit
