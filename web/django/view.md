# view.py

## import
from.django.shortcuts import render
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.template.context import RequestContext
import json

## function
def index(request):
    return

def Index(request, attra, attrb):
    return


## HttpResponse
- return HttpResponse('<h1>hello world!</h1>')
- return HttpResponse('welcome user %s login in' % user)
- return HttpResponse(json.dumps(region_dict))
- return render_to_response('index.html')

## render_to_response
- return render_to_response('index.html', {'data': now})

## render
- return render(request, 'index.html', {'model': logindata})



