# django

## create django project
django-admin.py startproject mysite/DjangoProject

## run server
python manage.py runserver 127.0.0.1:8080

## create app
django-admin startapp appname

## router url
using regular expression
url(r'^userlist/(\d*)',views.list)
url(r'home/model$',views.list)
**if not $ url not go to modelloop**
url(r'home/modelloop',views.list)
**view.list function need add other paramter like: def list(request,id)**

another ways
url(r'^userlist/(?P<id>\d*)',views.list,{'id':1})
**{'id':1} //It is default paramter**

### router url
urlpatterns = patterns('app02.views',
url(r'^userlist/(\d*)',list),
)
urlpatterns += patterns('app01.views',
url(r'^userlist/(\d*)',list),
)

### include
every app3 create urls.py
using include
urlpatterns = patterns('',
url(r'^web',include('app3.urls')),
url(r'^admin',include('app2.urls')),
)

## Model

### ORM
```python
class FirstModel(models.Model):
	Nid = models.AutoField(primary_key=True)
	UserName = models.CharField(max_length = 30, default='djj')
	Gender = models.NullBooleanField()
```

### configure your model
setting.py
INSTALLED_APPS = (
'app01',
)
### generate db
python manage.py makemigrations
It will generate FirstModel table
but It will not instantly generate table for safe and have file for record this action

### excute db
python manage.py migrate

and It will autoadd ID on table for autoadd row ID

### create user
python manange.py createsuperuser

### foreign key
Name = models.ForeignKey(FirstModel)
link FirstModel Nid

### one to one
Name = models.OneToOneField()

### many to many
Name = models.ManyToManyField(FirstModel)


## ues model
### check your model
python manange.py check

## Model add delete search and change

## admin.py
all model can be control on admin

### urls on admin
utlpatterns = patterns('',
url(,include(admin.site.urls))
)

### register model on admin.py
from app2.models import FirstModel
admin.site.register(SecondModel)

## create admin user
python manage.py createsuperuser
last change time: 2017/3/13 星期一 22:32:34

## on model.py control database
p = tableclass(col1="", col2="")

### add on view.py
```python
from app1.models import *
def Model(request):
# add
	p = ColorDic(colorname='black')
	p.save()

# get value
model=ColorDic.object.get(id=1)
model1 = ColorDic.object.all()

# update
	p.colorname='white'
	p.save()
## alter
	model = ColorDic.object.filter(id=1).update(colorname="yellow")
	model = ColorDic.object.filter(colorname__contains="black").update(colorname="yellow")

## get index
	model = ColorDic.object.all()[1-4]
```
## templates
###syntax
- {{key1}}
render_to_response('home/model.html', {'key1':'alex','names':list})

- {% %}
	{%if key %}
		<h1>value</h1>
	{% else %}
		<h1>value</h1>
	{% endif %}
**not support ==**
{% ifequal key 'ok' %}
		<h1>value</h1>
{% endif %}
	- for
		{% for item in names %}
			<h3>{{item}}</h3>
			{% endfor %}

- {% block %} on layout.html
{% block titlename %} {% endblock %}
    - inherted block on son.html
	{% extends "Master/layout.html" %}
	{% block titlename %}
	<h1>ok</h1>
	{% endblock %}
	**but only use once**



## CSRF POST data
cookies must be permited

render_to_response('home/model.html', {'key1':'alex','names':list})
render_to_response('home/model.html', {'key1':'alex','names':list}, instance_requestcontext(request))

{% csrf token %}
<input type="hidden" name="crsf...token" value="generate key" >

**It is middelware classes
setting.py**

## Form
- label lost function
return false

- jquery validate
```javascript
$(function(){
	$.validate('#form');
	})
```
- jquery extend function
	(function(arg){
		arg.extend(
			extend function line
			)})

- jquery autorun
(function(arg))(jquery)
```python
class LoginFrom(forms.Form):
	username = forms.CharField()
	password = forms.CharField()

