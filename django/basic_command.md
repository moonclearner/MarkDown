# django basic commands

## create project
django-admin.py startproject project_name

## create app
django-admin.py startapp appname

## synchro database
- python manange.py makemigrations
- python manange.py migrate

## run by test server
python manange.py runserver 127.0.0.1:8888

## clear database
python manange.py flush

## create super user
python manange.py createsuperuser

## change user password
python manange.py changepassword username

## dump database
python manange.py dumpdata appname > appname.json

## load database
python manange.py loaddata appname.json

## django shell
python manange.py shell

## database sql shell
python manange.py dbshell
