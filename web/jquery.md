# jquery
```javascript
<style type="text/css">
.red{
	background-color: red;
}
<script type="text/javascript" src="jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(document.ready(function()  // ���������֮�������д���
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

## ���ӱ��
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
onload ֻ��ע��һ�� �� ready ����ע����

$(document).ready(function(){})
$(function(){})
$(window.load())

onload ������ DOM Ԫ�ش�����ͼƬ������Ϻ�Ŵ����ġ�
ready ���� DOM Ԫ�ش�����Ϻ󴥷��ģ�����ͼƬ�������

## default function
$map(array, function)
map ���ܴ��� dict

$each(array, function)
���� for

## dom
$("#div_id").html()
��ͬ��
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
��������ǩʹ�õ�һ�� class ������Ҫ for ����

##
$('p, div, span.vvvv')
$('div li )  ��Ԫ��  ����Ԫ��
$('div>li)  ֱ����Ԫ��
$('.class + div') class ֮��ĵ�һ�� div
$('.class~div') class ֮������и� div

## ����

## Next

## Siblings
	��ȡ��������ͬ��Ԫ��
	$(this).addClass().siblings().removeclass()

# 2017/2/28 ���ڶ� 21:35:53

## ѡ����
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

## �� m ѡ����
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

## �¼�
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


## ģ̬�Ի���
z-index: ����
opacity��͸����
position:fixed

## ajax
```javascript
function AjaxRequest(){
	$.ajax({
		type:'POSR',
		url:'http://127.0.0.1:80// ���ص�ַ',
		cache:false,
		async:true,
		dataType:'json',   //application/json
		success:function(data){  // ����ɹ�֮�󷵻�һ��ֵΪ data

		}
	})
}

// ����
function AjaxRequestRemote(){
	$.ajax({
		type:'POST',
		url:'http:// ������վ����վ',
		cache:false,
		async:true,
		dataType:'jsonp',  // ����ĸ�ʽ // ������ application/x-javascript
		jsonpCallback:"djj",  // ��һ������Ķ�Ӧֵ
		success:function(data){

		}
	})
}

function djj(arg){
	return arg;
}
