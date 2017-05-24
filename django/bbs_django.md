# BBS

## table construction
### news
- title
- category
- content
- view
- comment
- id
- author
- ranking
- publish_date
- modity_date
### review
- id
- content
- user_id
- bbs_id
- date
### pattern

### user

## use django review system


## add single app url to django url.py
create app url.py
```python
from django.conf.urls import patterns
from django.conf.urls import include
from django.conf.urls import url
import views
urlpatterns = patterns('',
    url(r'^$', views.index),
)
```
on django.url.py
```python
import app.url
urlpatterns = patterns('',
    url(r'', include(app.url)),
    )
```
