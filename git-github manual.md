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

#Git branch
branch (分支)應該是 Git 最重要的技能了，在一個多人專案的開發過程中我們有時候要開發新功能，有時候是要修正某個Bug，有時候想要測試某個特異功能能不能 work ，這時候我們通常都會從主 branch 再開出一條新的 branch 來做，這支新開的 branch 會帶著你的主 branch 目前的最新狀態，當你完成你所要開發的新功能/ Bug 修正後確認沒問題就再把它 merge(合併)回主 Branch ，如此便完成了新功能的開發或是 Bug 的修正，因此每個人都可以從主 branch 拉一條新的 branch 來做自己想做的事，再來我們好好了解一下 branch 的使用。

gitk --all  调用图形界面

點擊左上方區塊的 commit 節點你可以看到當次 commit 的詳細資料，例如作者以及他的更新記錄，但你會發現這時候終端機是無法輸入的，因此請你先關掉 gitk ，
**改打指令 gitk --all & 來讓 gitk 在背景執行。**

git branch 這個指令可以列出所有的 branch 並告訴你目前正在哪個 branch：

`$ git br`

`* master`

` develop`

`feature/test`

  上面的訊息告訴我們在這個 Git repository裡有3支 branch ，而你目前正在 master branch 上。假設我們現在要開一支新的 branch 叫做 cat ，使用 git branch 來幫助你開一支新的 branch

  `$ git branch cat`
  上面我們開了一支新的 branch 叫做 cat ，使用 git branch 再查看一次發現已經多了這支新的 branch了，這時候你去查看你的 gitk 的圖像狀態會發現像下圖一樣，新的 branch cat 與 master 在同一條水平線上，表示目前他們的狀態是一模一樣的。

雖然我們建立了一個 cat 的 branch ，但其實我們所在的 branch 還是在 master branch，因此我們現在還需要切換過去，因此我們使用` git checkout cat` 來切換

接下來假設我正在 cat 這支 branch 做開發，因此新增一個檔案，加上一些內容，將它 add 到 stage 後再 commit 它。

再切換到原本的 master branch ，這時候你會發現剛剛在 cat branch 新增的 cat.rb 檔案已經不見了。

 我們現在切換到 master branch 並增加一個檔案及內容，照慣例 add 後 commit。
我們發現現在 master branch 與 cat branch 已經產生分歧了，因為兩支 branch 都有了各自往後開發的 commit ，而且由於 master branch 最後一次的 commit 時間較新因此排列在最前面。










---
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

## gitk -all
中文乱码

在Bash提示符下输入：

git config --global gui.encoding utf-8