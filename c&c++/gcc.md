# gcc

## uage
- gcc xxx.c | gcc xxx.o
	生成可执行文件，加 -o 表示起个别名：gcc XXX.c -o YYY 或 gcc -o YYY XXX.c 或 gcc XXX.o -o YYY 或 gcc -o YYY XXX.o
- gcc -c xxx.c
	只编译不连接，加 -o 表示起个别名：gcc -c XXX.c -o XXX.o 或 gcc -o XXX.o -c XXX.c 加 -I 用于增加不在同一路径下的头文件路径
- gcc -shared -fPIC xxx.c -o libxxx.so
	生成动态连接库 其实是：gcc -fPIC -c XXX.c + gcc -shared XXX.o -o libXXX.so
	fPIC：表示编译为位置独立的代码，不用此选项的话编译后的代码是位置相关的所以动态载入时是通过代码拷贝的方式来满足不同进程的需要，而不能达到真正代码段共享的目的。
	-shared 该选项指定生成动态连接库，不用该标志外部程序无法连接。
- gcc -cr libxxx.a xxx.o
	生成静态连接库
- gcc - o main main.o libxxx.a(libxxx.so)
	静态链接库或动态链接库的使用
	或者：gcc –o main main.o –L./ –lxxx
    使用 -l 选项时，默认情况下编译器会先搜索 libxxx.so 文件，如果没有找到，继续搜索 libxxx.a。
    加 -static 表示在程序中链接静态链接库：gcc -static –o main main.o –L./–lxxx
- gcc -o hello hello.c -I /home/hello/include -L /home/hello/lib -lworld
	-I /home/hello/include 表示将 /home/hello/include 目录作为第一个寻找头文件的目录，寻找的顺序是：/home/hello/include-->/usr/include-->/usr/local/include
	-L /home/hello/lib 表示将 /home/hello/lib 目录作为第一个寻找库文件的目录，寻找的顺序是：/home/hello/lib-->/lib-->/usr/lib-->/usr/local/lib
	-lworld 表示在上面的 lib 的路径中寻找 libworld.so 动态库文件（如果 gcc 编译选项中加入了“-static”表示寻找 libworld.a 静态库文件）


## gcc 如何添加静态连接库.a
- gcc –o main main.c libxxx.a

- gcc –o main main.c –L./ –lxxx
	-I dir     包含的头文件在 dir 里
	-L dir     用到的函数库文件在 dir 里
- gcc test.c -L 库文件目录 -l 库文件名 -o test
