
<!-- MarkdownTOC autolink="true" bracket="round" -->

- [MarkDown manual](#markdown-manual)
    - [显示markdown在浏览器上](#显示markdown在浏览器上)
    - [markdown 插件安装](#markdown-插件安装)
    - [语法说明](#语法说明)
    - [Vim 模式](#vim-模式)

<!-- /MarkdownTOC -->


*[toc]引用目录*


# MarkDown manual

## 显示markdown在浏览器上

<p>command line -> mp Markdown Preview inBrowser </p>
<p>choose github or markdown</p>

## markdown 插件安装  

<p>MarkDown Editing</p>
*编辑markdown的插件*

<p>MarkdownPreview</p>
*对markdown文档的显示*

<p>OmniMarkupPreviwer</p>
**实时**在浏览器中预览
<p>快捷键</p>

* Ctrl+Alt+O: Preview Markup in Browser
* Ctrl+Alt+X: Export Markup as HTML.
* Ctrl+Alt+C: Copy Markup as HTML.

<p>markdown TOC</p>
[TOC使用说明](https://github.com/naokazuterada/MarkdownTOC#configuration)

[markdown插件](http://www.jianshu.com/p/aa30cc25c91b)

**在github上有各个插件的使用说明**

## 语法说明

### 跳转
点击菜单栏 Goto - Goto Symbol, 或者快捷键 ctrl+R 即可调出文档内导航面板，实现迅速在文章各标题间跳转的功能。感兴趣的读者还可以尝试 Goto Anything、书签等等高级功能。  
**仅仅能够跳转英文  不能跳转中文  无论是onmimarkupreviewer 还是markdown preview**




### 空格
　　Markdown语法会忽略首行开头的空格，如果要体现出首行开头空两个的效果，可以使用 全角符号下的空格 ，windows下使用 shift+空格 切换。

### 列表
表的显示只需要在文字前加上-、+、* 即可变为无序列表，有序列表则直接在文字前加 1. 2. 3. 符号要和文字之间加上一个字符的空格。

>列表之间要有一行隔开

#### 无序列表
* 1
* 2
* 3

#### 有序列表
1. 1
2. 2 
3. 3

#### 选择刘表
- 1
  + 2
- 2
- 3

#### 选择刘表
+ 1
    * 下一级列表
    - test
+ 2 
+ 3


### 引用
只需要在文本前加入 > 这种尖括号（大于号）即可
> 例如这样

### 图片与链接

### 链接
1. 行内链接
[Markdown中插入图片有什么技巧](https://www.zhihu.com/question/21065229)
2. 参考式连接
这就是我们常用的地址：[Baidu][1]
[1]:www.baidu.com "百度一下，你就知道" 

_参考式链接鼠标放在地址上可以显示内容，并且链接地址可以多次使用_

### 插入图片

![sublime](http://static.9iphp.com/wp-content/uploads/2015/01/sublime-text.jpg)

### 粗体与斜体
用两个 * 包含一段文本就是粗体的语法，__ 表示粗体
用一个 * 包含一段文本就是斜体的语法，_ 表示斜体

注意：
**前后的 * 或 _ 与要 加粗或倾斜 的字体之间不能有空格。**


**这里是粗体**
__这是粗体__
*这里是斜体*
_这是斜体_

### 表格

使用说明：
* ------: 为右对齐。
* :------ 为左对齐。
* :------ 为左对齐。
* ------- 为使用默认居中对齐。

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

**安装了table editor之后，制作表格只需要用<kbd>tab</kbd>来快速制作表格**

| djj |  mo |
|-----|-----|
| djj | djj |
| dm  | mo  |




### 代码框
在 Markdown 下实现也非常简单，只需要用两个顿号把中间的代码包裹起来，如 `code`

`import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' +'8bc59f460fa1548d1514676163dafc88'; pf = 'PackageControl.sublime-package';ipp = sublime.installed_packages_path(); urllib.request.install_opener(urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)`

在代码框之中换行，使用github模式，并且代码行前加有个tab，即可

` <IBM> 
        <DW> 
                <linux id="100" name="python" count="3000" /> 
        </DW> 
 </IBM>`
加入tab

        <IBM> 
                <DW> 
                        <linux id="100" name="python" count="3000" /> 
                </DW> 
         </IBM>


### 分割线
分割线的语法只需要另起一行，连续输入三个星号 *** 或者--- 即可

***

---

* * *
### 按键输入
<kbd> ctrl</kbd>


### 反斜杠
使用 \ 表示反斜杠。在你不想显示Markdown标记时可以使用反斜杠。

\*这里不会显示斜体\*

### 删除线
注意 ~~ 和 要添加删除线的文字之间不能有空格。

~~这是一条删除线~~


##Vim 模式

Sublime Text 内置 Vim 模式支持，你只需到用户设置文件将 "ignored_packages": ["vintage"] 中的 vintage 删除即可。Sublime Text 并没有试图将 Vim 的按键映射全盘照搬过来，而是较好的进行了提炼融合。这使得大部分操作都能同时在编辑模式和命令模式下完成，有效地减少了在两种模式间不停切换的次数。

关于 Vim 相关操作请直接参考其网络教程，Sublime Text 对于绝大多数命令均支持。

