# vim 安装

1. 安装vim >7.3
2. 安装curl on windows

- 如下内容复制到一个新建的curl.cmd文件中，并将其保存到 msysGit的安装路径的cmd目录下（比如C:\Program Files\Git\cmd\curl.cmd）

```cmd
@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
@set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@curl.exe %*
```

- 运行curl.cmd

- 查看版本  curl --version

  ```cmd
  > curl --version
  curl 7.21.1 (i686-pc-mingw32) libcurl/7.21.1 OpenSSL/0.9.8k zlib/1.2.3
  Protocols: dict file ftp ftps http https imap imaps ldap ldaps pop3 pop3s rtsp smtp smtps telnet tftp
  Features: Largefile NTLM SSL SSPI libz
  ```

3. 安装pathogen

   1. Win7命令行cmd切换到 autoload 目录下，然后执行下面的curl命令：

   ```
   C:\Users\Admin\Vim\vimfiles\autoload>curl -LSso pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
   ```

   PS：

   - 这里最好使用翻墙软件lantern  
   - 使用`curl -LSso pathogen.vim https://tpo.pe/pathogen.vim  `
     - 会出现curl：（7）超时
   - 使用`https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim`
     - 会出现curl：（6）couldnt resolve host 'raw.github.com'

   2. 安装完成后，使用下面的命令查看是否能找到 pathogen.vim 文件。如果能找到，表明安装成功。

   ```
   D:\Program Files (x86)\Vim\vimfiles\autoload>dir | find /I "pathogen.vim"
   2014/12/08  23:03            12,139 pathogen.vim
   ```

via [python-mode](https://github.com/python-mode/python-mode#how-to-install) 安装python-mode 





## 安装youcompleteme

安装cmake





## vim UTF-8 乱码问题 在windows

```cmd
" 设置默认编码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决console输出乱码
language messages zh_CN.utf-8 

```





## 安装tarbar 或者tarlist之前需要安装ctags

[ctags](http://ctags.sourceforge.net/)安装解压，将路径设为环境变量即可



## 安装neocomplete需要lua支持 

[lua](http://lua-users.org/wiki/LuaBinaries)下载

仅仅需要下载lua-5.3.3_Win32_dllw4_lib  但是主要要对应32位和64位   看清楚vim的版本