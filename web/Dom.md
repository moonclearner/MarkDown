# DOM tree
document tree
把 dom 作为一个对象

## basic application
### onclick
onclick = 'alert("dd");'

### Event
动态注册事件
```javascript
function register(){
	document.ondblclick=fun1(){

	}
}
```
### window
window.alert()
window.Array

#### window.comfirm
var result = window.confirm("")
//this function has return
if(result):

window.location.href = "" //move to other web

### nacigate
仅 IE
onclick = "navigate("http://")"

### timer
```javascript
var s = setInterval("consolo.log("dd"),2000)
function stop(){
clearInterval(s);
}
```

#### setTimeout
仅执行一次

### document.title
var content = document.title;
consolo.log(content)
document.title = var

### title
<title>djj  </title>
该空格看不到
<title>djj&nbsp</title>
&nbsp 为空格

### onload and onbeforeunload
body img not div
onload 刚刚加载完全页面 运行
onbeforeunload 退出页面时运行
```html
<body onload = "consolo.log("djj)
onbeforeubload = "window.event.returnValue = '是否要退出'">
</body>
```
当标签一加载之后就会执行

document.ready 文档书建立玩之后进行运行

### window.location.href
不赋值去当前地址
window.location.href = '跳转地址'

### window.event
altKey; shiftKey
returnValue false 禁止提交表单
srcElment 获取引发事件的控件
using: window.event.altKey 如果按过 alt 键则返回 true
clientX; clientY
screenX; screenY
getElementById

<body onKeydown></body>
onclick
ondblclick
onKeydown
onkeypress
onkeyup
onmousedown
onmousemove
onmouseout
onmouseover
onmouseup
onfocus 获取焦点的时候 并不是鼠标的焦点，而是输入焦点
onblur  失去焦点的时候

### window.screen
window.screen.width
window.screen.height

### window.history
页面的前进后退
window.history.back()
window.history.forward()
window.history.go()

### window.clipboardData
clearData
getDate() 获取粘贴板的值
setData("") 在粘贴板中掺入数据
（oncopy 和 onpaste 事件，当赋值或者粘贴的时候触发，return false 禁止复制）

### window.document
window.document.write("data")
会冲掉以前的内容

### dom create label
dom 动态创建标签
```javascript
var divMain = document.getElementById('ddd') // 容器
var btn = document.createElement('input')
btn.type = 'button'
btn.value = '从数据库中获取的数据'
divMain.appendChild(btn)

document.getElementById('inner').innerText   我是红色
divMain.innerHTML   所有的 html
<a id="inner">我是<font color="red">红</font>色
</a>
```
### 事件冒泡
多个 div 互相包含中，都有 onclick 依次执行

### 修改元素样式
```javascript
var btn = document.getElementById('btn')
if(document.body.className == 'night')
{

}
else
{

}


<body class="night">
<input type="button" id = "btn" value = "开灯" onclick = "" />
```
### 修改样式属性
```javascript
document.getElementById("id").style. 属性 = xxx
```
background-color style.background
font-size style.fontsize
margin-top style.margintop

### 提交表单和验证
document.getElementById("form").submit

获取属性 document.getElementById('form').getattribute()

