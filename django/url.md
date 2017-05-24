# url.py
```python
from django.conf.urls import url
from django.contrib import admin
from home import views
from django.contrib.auth import views as authviews
from django.contrib.staticfiles.urls import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    # attr name for url title name
    url(r'^admin/', admin.site.urls),
    url(r'^aboutme/$', views.about_me, name='about_me'),
    url(r'^accounts/login/$', authviews.login, {'template_name': 'blog/login.html'}, name='login'),
    url(r'^accounts/logout/$', authviews.logout, name='logout', kwargs={'next_page': '/'}),
    url(r'^$', views.index, name='home'),
    url(r'^blog/$', views.blog, name='blog'),
    url(r'^blog/detail/(?P<pk>[0-9]+)/$', views.detail, name='detail'),
    url(r'^writing/$', views.writing, name='writing'),
    url(r'^writing/(?P<pk>[0-9]+)/modification/$', views.modification, name='modification'),
    url(r'^writing/drafts/$', views.draft_list, name='drafts'),
    url(r'^writing/(?P<pk>[0-9]+)/publish/$', views.publish, name='publish'),
    url(r'^writing/(?P<pk>[0-9]+)/remove/$', views.remove, name='remove'),
    url(r'^condition/(?P<condition>\w+)/(?P<mode>\w+)/$', views.search_condition, name='search_condition'),
    url(r'uploadtomarkdown/$', views.uploadfiletomarkdown, name='uploadmarkdown'),
    url(r'^search/(?P<searchcontent>\w+)/$', views.blog_search, name='search'),
    url(r'^work/$', views.work, name='work'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
```
## set default
```python
urlpatterns = patterns('',
  (r'^blog/$', views.page),
  (r'^blog/page(?P<num>\d+)/$', views.page),
)

def page(request, num=1):
    return
```

```python
url(r'^content/$', content),
url(r'^content/(?P<category>[abcdefj]{0,3})/(?P<paperid>[0-9]{0,2})/$', content)

def content(request, category='one', paperid=1):
    return
```
## url name & reverse
```python
# 不带参数的：
{% url 'name' %}
# 带参数的：参数可以是变量名
{% url 'name' 参数 %}
<a href="{% url 'add2' 4 5 %}">link</a>
```
```python
from django.conf.urls import url
from calc import views as calc_views

urlpatterns = [
    url(r'^add/$', calc_views.add, name='add'),
    url(r'^add/(\d+)/(\d+)/$', calc_views.add2, name='add2'),
]

>>> from django.core.urlresolvers import reverse  # django 1.4.x - django 1.10.x
>>> from django.urls import reverse  # django 1.10.x 新的，更加规范了

>>> reverse('add2', args=(4,5))
u'/add/4/5/'
>>> reverse('add2', args=(444,555))
u'/add/444/555/'
```
## order url redirect new url
```python
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse  # django 1.4.x - django 1.10.x
#  from django.urls import reverse  # new in django 1.10.x

def old_add2_redirect(request, a, b):
    return HttpResponseRedirect(
        reverse('add2', args=(a, b))
    )

url(r'^add/(\d+)/(\d+)/$', calc_views.old_add2_redirect),
url(r'^new_add/(\d+)/(\d+)/$', calc_views.add2, name='add2'),
```
