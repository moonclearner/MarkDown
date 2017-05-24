# setting.py

## allow_host

ALLOWED_HOSTS = [
        '192.168.191.1',
        '127.0.0.1',
        ]
## static
STATICFILES_DIRS = [os.path.join(BASE_DIR, "statics")]

## templates
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]


## Time Zone
LANGUAGE_CODE = 'zh-Hans'
TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True
USE_L10N = True
USE_TZ = True

## database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'bbs',
        'USER': 'djj',
        'PASSWORD': 'djj',
        'HOST': '',
        'PORT': '',
    }
}
