# Meta in django
Django 模型类的 Meta 是一个内部类，它用于定义一些 Django 模型类的行为特性
https://docs.djangoproject.com/en/1.10/ref/models/options/

## ordering
ordering=['order_date'] # 按订单升序排列
ordering=['-order_date'] # 按订单降序排列，- 表示降序
ordering=['?order_date'] # 随机排序，？表示随机


