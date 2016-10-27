# MinGW-w64 and msys 安装 on windows

因为使用installer安装需要联网，sourceforge的网速很慢不稳定，所以我使用的方法是下载压缩包安装

## 下载MinGW-w64

[MinGW-w64下载页面](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/6.2.0/threads-posix/seh/)

- 如果你需要安装最新版本可以根据以下的方式下载到最新的压缩版本

MinGW-w64 - for 32 and 64 bit Windows 下的 file -> Toolchains targetting Win64 -> Personal Builds -> mingw-builds -> (这里面可以选择最新版本我选择的是)6.2.0 -> (这里有为win32 和 posix  我选择) threads-posix -> seh -> x86_64-6.2.0-release-posix-seh-rt_v5-rev1  

- 下载完之后，解压文件，我配置的路径是e:\MinGW\mingw
- 配置e:\MinGW\mingw\bin 的环境变量
- cmd 测试  >gcc -v    如果可以看到gcc的版本信息就代表配置完成
- 将e:\MinGW\mingw\bin\mingw32-make.exe 复制一份并且命名为make.exe

## 下载msys

[msys下载页面](https://sourceforge.net/projects/mingwbuilds/files/external-binary-packages/)

msys+7za+wget+svn+git+mercurial+cvs-rev13

- 下载完毕之后，解压文件到任意的地方，我解压到e:\MInGW\msys

在msys文件夹内，会看到 msys.bat 文件，双击则启动MSYS，在MSYS中则可使用UNIX下的命令行，如make。

ps: 在MSYS中，可用 'where make' 来查看可供调用的 make.exe 位置。

- 在e:\MInGW\msys\etc\  复制fstab.sample 并更改为fstab，打开修改

```
c:/mingw		/mingw
```

为你的路径

```
E:/MinGWmingw64		/mingw
```

ps：记得为反斜杠

- 运行e:\MInGW\msys\msys.bat    运行msys的终端
- 测试  gcc -v  有gcc 的版本信息代表配置成功

ps：因为我们下载的msys压缩包自带了很多插件如：git svn 等很方便使用