# debug tool for django

## django debug tools
前端代码调试


## django debug toolbar
calculate run time



# Question
## one
AssertionError at /cmdb/test/
Cannot apply DjangoModelPermissions on a view that does not set `.queryset` or have a `.get_queryset()` method.

### solution
```python

REST_FRAMEWORK = {
'DEFAULT_PERMISSION_CLASSES':[
		# 'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly',
		'rest_framework.permissions.AllowAny',
	]
}
```
