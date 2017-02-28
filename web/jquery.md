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
