# filter
function in view
through midware to view before

# using decoractor
```python
@wrapper
def foo():
	print 'foo'

def wrapper(func):
	def result():
		print 'before'
		func()
		print 'after'
	return result


re = wrapper(foo)
re()
```
@login_requested
def Index():
	return HttpResponse("index.html",{"user":request.user})


url(r'^account/login/$','django.contrib.auth.views.login',{'template_name':'index.html'})

url(r'^$',views.index)   //127.0.0.1:8080

## html show username
```html
<li id="show_user">
	{% block show_user %}
	{% if user.is_authenticated %}
		<a href="/admin/auth/user/" >welcome:{{user.username}}</a>
	{% endif %}
	{% endblock %}

## admin user manange
​```python
@Filter(S_before, S_after):
def Index(request):
	pass

def S_before(request):
	pass

def S_after(request):
	pass
```
