# python装饰器

- 函数作用域LEGB
- 闭包理解与使用
- 装饰器

## 作用域的优先级：LEGB:L>E>G>B

- L:local 函数内部作用域
- enclosing 函数内部域内嵌函数之间
- global 全局作用域
- build-in 内置作用域

栗子

```python
passline=60  #global
def func(val):
    ```当本地没有local时
    
    ，会去找global```
    passline=90  #local
    if val>=passline:
        print('pass')
    else:
        print('failed')
    def in_func():
        print(val)  #89  闭包
    in_func()
    
    
def Max(val1,val2):
    ```val1 就为buil-in
    
    ```
    return max(val1,val2)
func(89)
print(Max(90,100))
```

## 闭包概念

closure 内部函数中对内closing作用域的变量进行引用

函数实质域属性

1. 函数是一个对象
2. 函数执行完成后内部变量回收
3. 函数属性
4. 函数返回值