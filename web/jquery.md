# jquery
```javascript
<style type="text/css">
.red{
	background-color: red;
}
<script type="text/javascript" src="jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(document.ready(function()  // 程序加载完之后在运行代码
	{
		$('#div_id').click(function()
		{
			$(this).toggleClass("red");
		})
	}))
	</script>
<body>
	<div id='div_id'>content</div>
```

## 链接编程
```javascript
$(function(){
	$('div_id).click(function(){
		$(this).toggleClass("blue");
	}).mouseover(function(){
		$(this).addClass('big');
	}).mouseout(function(){
		$(this).removeclass('big');
	})
})
```
## load
window.onload = function(){}
onload 只能注册一次 而 ready 可以注册多次

$(document).ready(function(){})
$(function(){})
$(window.load())

onload 是所有 DOM 元素创建、图片加载完毕后才触发的。
ready 则是 DOM 元素创建完毕后触发的，不等图片加载完毕

## default function
$map(array, function)
map 不能处理 dict

$each(array, function)
类似 for

## dom
$("#div_id").html()
等同于
document.getElementByld("#div_id").innerHTML

```javascript
function fun(arg){
$(arg).
}
<div id=""  onclick = fun(this)></div>
```
## jquery alter css
$().css('width', '100px')
alter: $().val(xxx) capture: $().val()
innerText $().text()
innerHtml $().html()

## jquery choose
$("#div")
$("div")
$(".class")
如果多个标签使用的一个 class 并不需要 for 进行

##
$('p, div, span.vvvv')
$('div li )  子元素  子子元素
$('div>li)  直接子元素
$('.class + div') class 之后的第一个 div
$('.class~div') class 之后的所有个 div

## 迭代

## Next

## Siblings
	获取所有其他同辈元素
	$(this).addClass().siblings().removeclass()

# 2017/2/28 星期二 21:35:53

## 选择器
```javascript
$(function(){
	$('#each').text("")  #id
	$("div").text("")    #label
	$(".class").text     #class
	$("*")               #regular
	$("selection, selection2")    #mult choose
	$("#each ul li")              #hierarchy choose
	$("#each>child")              #hierarchy choose

	$("li:first")
	$("li:even")        #index first number is zero

})
```

## 表 m 选择器
$("input[name='djj'])
$(":text")
<input type="text" name = "djj">

## attr And CSS
$().attr({
src:"",
alt:"",
})

$().removeAttr()

addClass()
removeClass
toggleClass()

html()
text()

$().css({
color:"",
background:""
})

## 事件
$(window).scroll(function{
var top = $(this).scrollTop()
})


## defined function
```javascript
(function(){
	jQuery.fn.extend({
		functionname:function(){
			$(this).dosomething
		}
	})
})
```
using: $("").functionname()

```javascript
(function(){
	jQuery.extend({
		functionname:function(arg){
			$(arg).dosomething()
		}
	})
})
```
using: $.functionname("#body")


## 模态对话框
z-index: 层数
opacity：透明度
position:fixed

## ajax
```javascript
function AjaxRequest(){
	$.ajax({
		type:'POSR',
		url:'http://127.0.0.1:80// 本地地址',
		cache:false,
		async:true,
		dataType:'json',   //application/json
		success:function(data){  // 请求成功之后返回一个值为 data

		}
	})
}

// 跨域
function AjaxRequestRemote(){
	$.ajax({
		type:'POST',
		url:'http:// 其他网站的网站',
		cache:false,
		async:true,
		dataType:'jsonp',  // 跨域的格式 // 服务器 application/x-javascript
		jsonpCallback:"djj",  // 有一个请求的对应值
		success:function(data){

		}
	})
}

function djj(arg){
	return arg;
}
