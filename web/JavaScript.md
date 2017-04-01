# javascript basic

## 申明变量
<script type="text/javascript">
	alert('1')
	consolo.log('djj')
</script>

## variables
- val = "";
- ";" available add
- undefine

- dict:
var a = {
name:'djj', action:'go'
}

- list:
a = []

- Array
var a = Array()

## function
function fun(arg1, arg2){

}

### function autorun
(function(arg){})(arg);
directly run function

## google analytics
auto record your web 每日访问量
自动给你加了一个运维后台网址
只需要在你的网址上面加一段 JavaScript 代码

## javascript no class
使用函数模拟一个 class
没有返回值

function User(name, agr){
this.Name = name;
this.Age = age;
this.sayHi = function(){
	consolo.log("djj" + this.Name);
	}
}
### using
user1 = new User("alex",73)
user1.sayHi();
