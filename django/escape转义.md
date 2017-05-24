# Escape 转义
##
## mark_safe in django
### example
```python

from django.utils.safestring import mark_safe

class Category(models.Model):
    name = models.CharField(max_length=50)
    brief = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    image = models.ImageField(upload_to='photos/', default='statics/images/default.jpg')
    newarticle = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name

    def image_tag(self):
        return mark_safe('<img src="%s" width="200px"/>' % (self.image.url))
    image_tag.short_description = 'Image'
```
