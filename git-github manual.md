# create local git repository
cd 进入你要创建的local repository
$ git init
执行此操作后，git将该目录下创建一个隐藏目录（.git），这个目录就是git用来管理软件版本的仓库。

# push and pull

1. 在guthub上创建repository之后
2. $ git remote add origin git@github.com:用户名/repository名.git
3. $ git pull git@github.com:bxxfighting/NowToDo.git  由于我建立仓库的时候创建README.md之时，已经算一次提交了，我需要先在本地同步一下仓库的内容
4. $ git add .  
    add后面加了一个点，是想要提交所有文件，如果想提交指定的文件，可以写文件名，执行完增加命令后，要执行提交命令，add与点之间需要空格
5. $ git commit –m “这个版本提交的说明”
    -m后面跟提示信息，这个提示信息是一定要写的，不仅是规则，同时也方便我们记录我们提交的过程，写清晰为什么提交或修改了什么是非常有用的，提交完成后
6. $ git push -u origin master //把本地 master 分支 推送到 服务器的master分支上，如果服务器没有此分支，就新建此分支。这也是 在服务器上新建分支的一种方法



# Clone(複製)別人的 Repository
例如我們在 Github 上面看到人家的程式碼想要抓下來自己修改，或是團隊中別人的程式碼，這時候他們通常會有一個 Git 的檔案位置像是在 Github 的話你就會看到像下面的地方可以讓你複製 git 的 clone 位置：

clone with https  复制其地址

$ git clone https://github.com/sencloudx/mobile-monitor.git
如此便會將這個 Git Repository下載到我們的資料夾， git clone 預設會將下載的 git 存成一樣檔名的資料夾，

$ git clone https://github.com/sencloudx/mobile-monitor.git monkey
這樣子下載下來的 Repository 的名稱就會從原本的 Animal 變成 monkey 了。

# Git的基本功(status, add, commit, log, .gitignore)

在一個 Git 的 Repository 中你可以輸入git status來檢查目前 Git 的狀態
可以看到你这个仓库更改了哪些文件，哪些是未同步的文件需要add

add   有一种 git add -i 是互动式加入文件

add之后，通常我們稱這個狀態叫做 stage 下一个阶段就要commit

git commit -m

git log可以查看git commit的历史信息，前面的亂碼代表的是當次 commit 的版號，後面的是 commit 的訊息、時間以及 commit的作者，你可以使用 git log --stat 參數看到更詳盡的訊息，如果你想看到檔案更詳細的變更內容，你可以加上 git log -p 的參數：


有些檔案我們不希望加入版本控制的追蹤，例如說Database的schema或是一些log檔，這時候你可以將他們加入 .gitignore 中來讓 Git 忽略他們，使用編輯器來打開你的 .gitignore 檔案。vim .gitignore


#Question

##Git 提示fatal: remote origin already exists 错误解决办法
1. 先删除远程 Git 仓库

$ git remote rm origin

2. 再添加远程 Git 仓库

$ git remote add origin git@github.com:FBing/java-code-generator

3. 如果执行 git remote rm origin 报错的话，我们可以手动修改gitconfig文件的内容
  
   $ vi .git/config
把 [remote “origin”] 那一行删掉就好了。


## 被加入 gitignore 的檔案一樣出現在 status 中？

有時候你會發現即時你將檔案加入了 .gitignore 卻一樣會出現在 Git 的追蹤狀態中，這是由於你想要忽略的檔案之前已經被 Git 追蹤了，因此你現在想要讓 Git 忽略他的話只能先將他刪除然後再 commit 一次，再來這支檔案再出現就不會再追蹤這支檔案了。