# Nginx and python

## test your web
- cd your project
- python manage.py runserver

### using text web test your web
- sudo apt-get install w3m
- w3m http://127.0.0.1:8000

## install nginx
- sudo apt-get install python-dev nginx

## using uwsgi run server
sudo pip install uwsgi --upgrade

### run web server by uwsgi
- uwsgi --http :8080 --chdir /path/to/project --home=/path/to/env --module project/wsgi.py

- --chdir /path/to/project  web project dir

- --home  python virtualenv dir

- -- module  wsgi.py dir

### question
- run server
- !!! no internal routing support, rebuild with pcre support !!!

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

### shut down uwsgi
sudo killall -9 uwsgi


## install Nginx

### nginx.conf
```
	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;

    server {
    listen 80;
    server_name moonclearner.cn; # domain name
    access_log /home/log/nginx/blog.moonclearner.com/access.log;
    error_log /home/log/nginx/blog.moonclearner.com/error.log;
    client_max_body_size 75M;
    charset utf-8;

    location / {
        include /etc/nginx/uwsgi_params;
        uwsgi_pass 127.0.0.1:8080;
        uwsgi_read_timeout 2;
     }
     location /static {
        alias /home/ubuntu/blog/statics/;
     }
     }

}
```
### Nginx restart
- sudo /etc/init.d/nginx restart
- nginx -c /etc/nginx/nginx.conf

## question
### allow host

alter setting.py
ALLOWED_HOSTS = ["moonclearner.cn"]

### no application
uwsgi.ini not find wsgi.py
add absolute path to wsgi-file
