# url.py

from app01 import views
from heart import views
from bbs import views as bbs_views

url(r'^admin/', admin.site.urls),

url(r'^index', views.Index),
url(r'^login/', views.Login),
url(r'^auth/$', views.Auth),
url(r'^getRegion/$', views.Menu),
url(r'^htem/', views.htem),
url(r'^human/', views.Heart),
url(r'', bbs_views.Bbs),


url(r'content/')
url(r'^articles/(?P<year>[0-9]{0,4})/(?P<month>[0-9]{1,2})/$', views.month_archive),

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
