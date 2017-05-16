# uwsgi
[document](http://uwsgi-docs.readthedocs.io/en/latest/WSGIquickstart.html)
## install
apt-get install build-essential python-dev
pip install uwsgi

## first WSGI application
```python
# web.py
def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World"]
```
### start
uwsgi --http :9090 --wsgi-file web.py
or
uwsgi --http :9090 --wsgi-file foobar.py --master --processes 4 --threads 2 --stats 127.0.0.1:9191

This will spawn 4 processes (each with 2 threads)
a master process (will respawn your processes when they die)
The stats subsystem allows you to export uWSGI’s internal statistics as JSON
Make some request to your app and then telnet to the port 9191, you’ll get lots of fun information. You may want to use “uwsgitop” (just pip install it), which is a top-like tool for monitoring instances.

### tips
**Do not use --http when you have a frontend webserver or you are doing some form of benchmark, use --http-socket. Continue reading the quickstart to understand why.**
