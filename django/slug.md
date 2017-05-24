# what is slug in django
It's a way of generating a valid URL, generally using data already obtained. For instance, using the title of an article to generate a URL. I'd advise to generate the slug, using a function, given a title (or other piece of data), rather than setting it manually.

## An example:

```
<title> The 46 Year Old Virgin </title>
<content> A silly comedy movie </content>
<slug> the-46-year-old-virgin </slug>
```
Now let's pretend that we have a Django model such as:

```
class Article(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField(max_length=1000)
    slug = models.SlugField(max_length=40)
```
How would you reference this object with a URL, with a meaningful name? You could use Article.id so the URL would look like this:

```
www.example.com/article/23
Or, you could reference the title like so:

www.example.com/article/The 46 Year Old Virgin
Problem is, spaces aren't valid in URLs, they need to be replaced by %20 which is ugly, making it the following:

www.example.com/article/The%2046%20Year%20Old%20Virgin
That's not solving our meaningful URL. Wouldn't this be better:

www.example.com/article/the-46-year-old-virgin
That's a slug. the-46-year-old-virgin. All letters are downcased and spaces are replaced by hyphens -. See the URL of this very webpage for an example!
```
## Use example
```python
from django.template.defaultfilters import slugify
from django.utils.text import slugify
class Article():
    title = models.CharField(max_length=100)
    content = models.TextField(max_length=1000)
    slug = models.SlugField(max_length=40)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Article, self).save(*args, **kwargs)

>>> from django.template.defaultfilters import slugify
>>> tt = slugify("b b b b")
u'b-b-b-b'
>>> models.Articel(title='', contents='', slug=tt).save()
```
## slugify cannot parse unicode
pip install django-uuslug

### Use slugify
```python
from uuslug import slugify

 txt = "This is a test ---"
 r = slugify(txt)
 self.assertEqual(r, "this-is-a-test")

 txt = "___This is a test ---"
 r = slugify(txt)
 self.assertEqual(r, "this-is-a-test")

 txt = "___This is a test___"
 r = slugify(txt)
 self.assertEqual(r, "this-is-a-test")

 txt = "This -- is a ## test ---"
 r = slugify(txt)
 self.assertEqual(r, "this-is-a-test")

 txt = '影師嗎'
 r = slugify(txt)
 self.assertEqual(r, "ying-shi-ma")
```
