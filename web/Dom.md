# DOM tree
document tree
�� dom ��Ϊһ������

## basic application
### onclick
onclick = 'alert("dd");'

### Event
��̬ע���¼�
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
�� IE
onclick = "navigate("http://")"

### timer
```javascript
var s = setInterval("consolo.log("dd"),2000)
function stop(){
clearInterval(s);
}
```

#### setTimeout
��ִ��һ��

### document.title
var content = document.title;
consolo.log(content)
document.title = var

### title
<title>djj  </title>
�ÿո񿴲���
<title>djj&nbsp</title>
&nbsp Ϊ�ո�

### onload and onbeforeunload
body img not div
onload �ոռ�����ȫҳ�� ����
onbeforeunload �˳�ҳ��ʱ����
```html
<body onload = "consolo.log("djj)
onbeforeubload = "window.event.returnValue = '�Ƿ�Ҫ�˳�'">
</body>
```
����ǩһ����֮��ͻ�ִ��

document.ready �ĵ��齨����֮���������

### window.location.href
����ֵȥ��ǰ��ַ
window.location.href = '��ת��ַ'

### window.event
altKey; shiftKey
returnValue false ��ֹ�ύ��
srcElment ��ȡ�����¼��Ŀؼ�
using: window.event.altKey ������� alt ���򷵻� true
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
onfocus ��ȡ�����ʱ�� ���������Ľ��㣬�������뽹��
onblur  ʧȥ�����ʱ��

### window.screen
window.screen.width
window.screen.height

### window.history
ҳ���ǰ������
window.history.back()
window.history.forward()
window.history.go()

### window.clipboardData
clearData
getDate() ��ȡճ�����ֵ
setData("") ��ճ�����в�������
��oncopy �� onpaste �¼�������ֵ����ճ����ʱ�򴥷���return false ��ֹ���ƣ�

### window.document
window.document.write("data")
������ǰ������

### dom create label
dom ��̬������ǩ
```javascript
var divMain = document.getElementById('ddd') // ����
var btn = document.createElement('input')
btn.type = 'button'
btn.value = '�����ݿ��л�ȡ������'
divMain.appendChild(btn)

document.getElementById('inner').innerText   ���Ǻ�ɫ
divMain.innerHTML   ���е� html
<a id="inner">����<font color="red">��</font>ɫ
</a>
```
### �¼�ð��
��� div ��������У����� onclick ����ִ��

### �޸�Ԫ����ʽ
```javascript
var btn = document.getElementById('btn')
if(document.body.className == 'night')
{

}
else
{

}


<body class="night">
<input type="button" id = "btn" value = "����" onclick = "" />
```
### �޸���ʽ����
```javascript
document.getElementById("id").style. ���� = xxx
```
background-color style.background
font-size style.fontsize
margin-top style.margintop

### �ύ������֤
document.getElementById("form").submit

��ȡ���� document.getElementById('form').getattribute()

