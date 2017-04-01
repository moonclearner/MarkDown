# show html in views.py
from django.utils.safestring import mark_safe
html = '''
<a>1</a>
'''
return mark_safe("html")


# url default num
url(r'^index/(?P<page>\d*)$', views.index, {'page':1})
