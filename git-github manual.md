


#github manual

**linux下生成ssh需要使用超级权限sudo   -s  并且邮箱最好填写github账号邮箱地址**



<!-- MarkdownTOC autolink="true" bracket="round" -->

- [create local git repository](#create-local-git-repository)
- [push and pull](#push-and-pull)
- [Clone\(複製\)別人的 Repository](#clone複製別人的-repository)
- [Git的基本功\(status, add, commit, log, .gitignore\)](#git的基本功status-add-commit-log-gitignore)
- [Git branch](#git-branch)
- [Git rebase 整理現在的 branch](#git-rebase-整理現在的-branch)
- [Confict: 處理 Git 合併時的衝突：](#confict-處理-git-合併時的衝突：)
- [Git reset 取消上一次的操作](#git-reset-取消上一次的操作)
- [取消已暫存的檔案](#取消已暫存的檔案)
- [取消修改過的檔案](#取消修改過的檔案)
- [修改上一次的commit](#修改上一次的commit)
- [強制回復到上一次 commit 的版本](#強制回復到上一次-commit-的版本)
- [Question](#question)
  - [Git 提示fatal: remote origin already exists 错误解决办法](#git-提示fatal-remote-origin-already-exists-错误解决办法)
  - [被加入 gitignore 的檔案一樣出現在 status 中？](#被加入-gitignore-的檔案一樣出現在-status-中？)
  - [gitk -all](#gitk--all)

<!-- /MarkdownTOC -->



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


#Git rebase 整理現在的 branch
假設我們現在在 cat branch 的開發動作已經完畢，通常我們現在要做的事情會是將 cat branch 合併回 master branch，在開發流程上， master branch 就像是一個主要的 branch ，每個開發人員都是從 master branch checkout 出去一支新的 branch 做開發，在開發完畢後就再將開發完的 branch 合併回 master branch，因此 master branch 都會保有最新的開發好的狀態

`git rebase`
**不單單只是將兩個不同的 branch 合併起來，而是將某一支 branch 基於另一支 branch 的內容合併起來**

git rebase 會基於 master branch 目前最後一次的 commit 內容再往後把你在 cat branch 上commit 的內容加上去，我們現在在
**cat branch**
輸入 `git rebase master `來將 cat branch 基於 master branch 做 rebase。
  在master中可以看到新的版本

原先 cat branch 上的兩個 commit (Add Cat.rb 和 Add initializer) 已經合併到 master branch 最新的 commit (Another spec)，換句話說目前 cat branch 的內容就像是剛從 master branch 所 checkout 出來然後再加上自己的 commit，因此不同於 git merge 的線圖會把 cat branch 合併到 master branch ， 而是把原本的 cat branch 接到 master branch 因此只有一條線，當一個專案有很多的 branch 再做開發的時候會避免很多 branch 的線接來接去難以辨認。


若你想要看看目前的 branch 與其他 branch 有哪些差異，你可以使用`git diff cat master `的指令去觀察，例如我現在想要看 master 跟 cat 這兩個 branch 的差異，我只要下：

如果我們開發完畢時，我們會把開發好的東西合併回 master 很自然的我們通常都會使用 `git merge cat`這個指令來合併兩個branch


可以看到我剛剛在 master branch 下了 `git merge cat` 這個指令來告訴 git 要 merge cat 到現在所在的 branch ，因此在圖上就看到了 cat branch 拉一條線回來合併到了 master 這個 branch 了，解釋這張圖的意思就是， cat branch 從 master branch 的 Another spec 這一次的 commit 分支出來後，自己產生了三次的 commit (Add Cat.rb、Add initializer、Rever “Add initializer”) 然後合併到 master。


# Confict: 處理 Git 合併時的衝突：
很常發生的情況是再 merge 或是 rebase 的圖中產生了 convict (衝突)，這時候 Git 會停下來請你去處理，例如我們在 cat 和 master 的 branch 都對 lib/cat.rb 這支檔案做編輯，然後我們將他們 merge：

你會看到 Git 告訴你在你合併的過程中在 lib/cat.rb 這支檔案發生了衝突，Git 不知道該怎麼處理因此要你去處理它，這時候我們打開這支檔案會看到這樣的情況：

<<<<<<<<<< HEAD 到 ========== 的中間區域是目前你所在 branch 的 commit 內容，而從 =========== 到 >>>>>>>>>>> cat 則是你要合併的 cat branch 的內容，你必須做出決定看是要兩個都留下，或是選一個，或是改成你想要的內容，改好後記得要將 Git 自動產生的 <<< 、 =====、 <<< 的內容都刪除，修改完畢後存檔，將剛剛修改過的檔案再使用 git add 加入 stage ，將所有的衝突都修正完畢後就使用 git commit 提交一次 commit，由於這次的 commit 是在處理 merge 時的衝突，因此 Git 很聰明的已經幫我們加上了一些預設的訊息 “Merge branch ‘cat’”， commit 提交後就會看到合併成功的訊息了。

**發生 confict 時的處理步驟**

1. 將發生 confict 的檔案打開，處理內容( 別忘了刪除<<<、===、>>> )。
2. 使用 git add 將處理好的檔案加入 stage。
3. 反覆步驟 1~2 直到所有 confict 處理完畢。
4. git commit 提交合併訊息。
5. 完成

# Git reset 取消上一次的操作
取消 merge
版本控制最大的好處之一就是讓你永遠可以後悔，因此我們常會希望把已暫存的檔案、已提交的 commit 或是已合併的 branch 取消修改，這時候我們可以使用 git reset 這個指令來幫助我們，像現在我若是想要取消剛剛的 merge 動作

# 取消已暫存的檔案

有時候手殘不小心將還沒修改完的檔案使用 git add 加入了 stage ，這時候可以使用 git reset HEAD <file> 來將這支檔案取消 stage：

你可以看到我使用 git add 將檔案加入 stage 後，在我的 status 狀態顯示 lib/cat.rb 這支檔案現在已經準備好被 commit ，但這時我使用了 git reset HEAD 將這支檔案取消 stage，再使用 status 查看時它就變回一支還沒加入 stage 的檔案了。

# 取消修改過的檔案
連續剛剛的情況，若是我想完全放棄這次修改 (將檔案狀態回復到最新的一次 commit 時的狀態)，我可以使用 git checkout -- <file> 來回復這支檔案：

# 修改上一次的commit
手誤打太快， commit 訊息打錯時，我們可以使用 git commit --amend 來幫助我們重新修改

#強制回復到上一次 commit 的版本
有時候我們想要放棄所有修改回到 commit 時的狀態，這時候我們可以下 git reset --hard HEAD 來回復，HEAD 參數可以加上一些變化，
例如 HEAD是当前这个版本 
HEAD^ 表示目前版本的上一個版本 
HEAD~2 則是再上一個，因此你可以自由的跳回去之前的狀態。

你可能會在這邊感到疑惑，在使用 git reset 的時候都會看到一個 soft 或是 hard 的參數，這代表什麼樣的意義？基本上在使用 git reset 的時候，都會把目前狀態回復到你想回復的版本，但若是不加參數的情況，會把你做過的修改仍然保留，但是，若是加上 —soft 參數，則會把做過的修改加入 stage ，若是加上 hard 參數的話則是把做過的修改完全刪除，回到那個版本原本的樣子。



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