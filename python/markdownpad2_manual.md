# markdownpad2 shortkeying


- **粗体** (`Ctrl+B`) and *斜体* (`Ctrl+I`)
- 引用 (`Ctrl+Q`)
- 代码块 (`Ctrl+K`)
- 标题 1, 2, 3 (`Ctrl+1`, `Ctrl+2`, `Ctrl+3`)
- 列表 (`Ctrl+U` and `Ctrl+Shift+O`)

## 代码高亮设置

工具-》选项-》Markdown-》Markdown处理器-》选择GitHub，必须是在线版才可以
需要登录GitHub账号
连续三个反引号`，就是按键1前面的那个符号再加代码类型：如下图 

![](http://i.imgur.com/FrqJfpk.png)
效果：
```java
public class Test{
    public static void main(String args[]){
        System.out.println("我是java代码");
    } 
}
```

1. `ctrl+1` 一级标题
2. `ctrl+2` 二级标题
3. ····
4. `ctrl+shift+o` 有序列表
5. `ctrl+u` 无序列表
6. `ctrl+g` 插入图片
7. `ctrl+l` 插入超链接


*斜体*
**粗体**
_斜体_
__粗体__

## 数学公式使用：

![](http://latex.codecogs.com/gif.latex?\prod(n_{i})+1)
![][1]

[1]:http://latex.codecogs.com/gif.latex?\prod(n_{i})+1

<img src="http://latex.codecogs.com/gif.latex?\prod(n_{i_1})+1">

## 自动链接
<http://www.baidu.com>