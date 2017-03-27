#

## setting.py
TEMPLEATE_DIR = (
	os.path.join(BASE_DIR, 'templates')
)
STATICFILES_DIR = (
os.path.join(BASE_DIR)
)

DATABASEs = {
}

INSTALLED_APPS = (

)

### windows \\  unix /
os.sep
os.linesep

## views.py

from django.shortcuts import render

def login(request):
	pass

def logout(request):
	pass

def index(request):
	pass

def room(request, id):
	pass


## templates file

### layout.html
**using bootstrap**
```html

<head>

<title>{{title}}</title>
{% block css %}

{% endblock %}
</head>

<body>

{% block page-content %}

{% endblock %}

<form action="/login/" method="POST">
	<input type="submit" onclick="return false;" />
	<!-- return false: break submit work -->
</form>

{% block js %}

{% endblock %}

</body>

```

#### inhert layout.html
{% extends 'master/layout.html' %}

{% block page-content %}

{% endblock %}

## log in and log out
{% if user.is_authenticated %}
	{% user.username %}
{% else %}

in views.py
from django.contrib.auth.decorators import login_required

def login(request):
	username, password = request.POST.get('username'), request.POST.get('password')
	re = auth.authenticate(username=username, password=password)
	if re is not None:
		auth.login(request, re)
		return redirect('/index/', {'username': re})
	else:
		return render_to_response('login.html', {'login_error':'accunt or password is error'})
	return render_to_response('login.html')


@login_required
<!-- enter room need hava log in -->
def room(request):
	user = request.user
	return render_to_response('room.html',{'roomobj':roomobject, 'menberlist':menberlist, 'user':request.user})

urls.py

url(r'^accounts/login/', django/contrib.auth.views.login, 'template_name':'login.html')
# if not pass :need log in or enter login.html

### dict to json
dict = {"k1":"kkk"}
**must be use double quote "**

dict = [[],[]]

deal with json
json.dumps(dict)

js:
function json(arg){
var arg = $.parseJSON(arg)
$.each(function(arg, function(k, v){

}))

})
}

## key event
$("#").keyup(function(event){
	if(event.keyCode == 13){
	13 is enter
	<!-- 13 is enter key -->

	}
	})
