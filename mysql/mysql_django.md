# django for mysql

## setting.py
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'auto_cmdb',
        'USER': 'djj',
        'PASSWORD': 'djj',
        'HOST': '',
        'PORT': '',
    }
}
```
## mysql
- mysql -u root -p
- create database auto_cmdb
- grant all privileges on auto_cmdb.* djj@localhost

## app.models.py
add class

## manage.py
- python manage.py makemigrations
- python manage.py migrate
- python manage.py createsuperuser

# Restful
- Representational state transfer
- resouce
- Represent
- condition swtch

## stateless
- server contain no client state
- Each request contains enough context to process the message
	- Self-desctiptive message
- Any session state is held on the client

## Cacheable
- Server reponses(representations) are Cacheable
	- Implicitly
	- Explicitly
	- Negotiated

## Layered System
- Client can't assume direct connection to server
- Software or hardware intermediaries between client and server
- Improves scalability

# django for Restful

## install
[django_restful_framework]()

## usage
