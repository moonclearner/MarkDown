# midware

## pattern on myDefineMid.py
```python
class middleware(object):
    def process_request(self, request):
        i = 13
        pass
```

## reference on setting.py
MIDDLEWARE_CLASSES = (
    'app01.myDefineMid.middleware'
)


## using middleware on views.py
```python
def Index(request):
    return HttpResponse("ok")
```
## add url path

# how to process
using before views.py

# four middleware pattern
- process_request(self, request)
    before views
- process_view(self, request, callback, callback)
    before views
- process_exception(self, request, exception)
    raise exception
- process_response(self, request, response)
    after views

# mult midware how to process
process_request and process_view order by from above down

process_response order by form down above

# using string to run function call:reflection
getattr(classname, 'functionstring')()
hasattr()
