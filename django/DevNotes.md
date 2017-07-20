# 2017/6/26 星期一 15:10:12
## 'function' object has no attribute 'as_view'
当我在使用 listview 的时候，为了让 listview 用上 cache，就在函数前面加上了 cache_page 产生了错误
```python

#  @cache_page(60 * 15)
class PostListView(ListView):
    """docstring for PostListView"""
    queryset = Article.objects.filter(published_date__isnull=False).order_by('-published_date')
    context_object_name = 'posts'
    paginate_by = 3
    template_name = 'blog/blog.html'


url(r'^blog/$', cache_page(60 * 15)(views.PostListView.as_view()), name='blog'),
```

## 因为 cache 的原因导致数值未进行变化
```python
return render(request, 'blog/detail.html', {'post': post})
#  return redirect('detail', pk=post.pk, slug=post.slug)
```
render 会重新进行缓存
而 redirect 则在进行路由的时候会出现数值未改变

## 使用 ListView 需要注意分页的设置
