# Nginx and python

## test your web
- cd your project
- python manage.py runserver

### using text web test your web
- sudo apt-get install w3m
- w3m http://127.0.0.1:8000

## install nginx
- sudo apt-get install python-dev nginx

## install supervisor
sudo pip install supervisor

## using uwsgi run server
sudo pip install uwsgi --upgrade

### run web server by uwsgi
uwsgi --http :8080 --chdir /path/to/project --home=/path/to/env --module project/wsgi.py

--chdir /path/to/project  web project dir

--home  python virtualenv dir

-- module  wsgi.py dir

### question
run server
!!! no internal routing support, rebuild with pcre support !!!

solution:
- sudp pip uninstall uwsgi
- sudo apt-get install libpcre3 libpcre3-dev
- sudo pip install uwsgi


#### port cat
lsof -i :8080

#### if port had been used
sudo kill -9 PID PID

#### look up by program name
ps aux |grep uwsgi

#### ps content using gunicorn instead of uwsgi
```
sudo pip install gunicorn
run:
gunicorn -w4 -b0.0.0.0:8001 projectname.wsgi
```
-w start the number of worker -b ip and port 0.0.0.0 watch all computer all  ip

## using supervisor to manage process
- pip install supervisor

generate supervisor default configure file
echo_supervisord_conf > /etc/supervisord.conf

open supervisord.conf and all following on the bottom

```
[program:projectname]
command=/path/to/uwsgi --http :8080 --chdir /path/to/projectname --module projectname/wsgi.py
directory=/path/to/projectname
startsecs=0
stopwaitsecs=0
autostart=true
autorestart=ture
```

### start supervisor
sudo supervisord -c /etc/supervisord.conf

### restart project
sudo supervisotctl -c /etc/supervisord.conf restart projectname

### initate stop and restart
sudo supervisotctl -c /etc/supervisord.conf [start|stop|restart] [program-name|all]

### example for uwsgi
- create new file uwsgi.ini
	path: /home/ubuntu/projectname/uwsgi.ini
content:

```bash
[uwsgi]
socket = 127.0.0.1:8080
chdir = /home/ubuntu/projectname/
# must have "/" at end
wsgi-file = /home/ubuntu/projectname/projectname/wsgi.py
master = true
process = 2
threads = 4
```

### run uwsgi in ini file
uwsgi --ini uwsgi.ini


## install Nginx

### Nginx restart
sudo /etc/init.d/nginx restart

## question
### allow host
alter setting.py
ALLOWED_HOSTS = ["moonclearner.cn"]

### no application
uwsgi.ini not find wsgi.py
add absolute path to wsgi-file
