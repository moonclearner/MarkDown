- ���� Esc ���ǰ� ^������ ^c���ٶȿ�ܶ�
- ѧ�Ἰ����λ��������0, $, {, }, g, G, w, e, b...
- Shift+V ѡ�����У�Ȼ���� һ���ƶ�
- Ctrl+V ѡ�����׻���β���ַ���Ȼ���� shift+i �����룬���� shift+x ��ɾ��
- ѧ���� y,d �� p, P ��ճ������
- ѧ���� ^W �Ĵ��ڲ��������ļ��� sp ���� vs
- ѧ���¼�������� q ���������ʼ¼�ƣ��ٰ� q ���档Ȼ����� @�����������طţ��� @ǰ�����ֿɶ���طŴ���
- "."�ظ���һ�����"u"ȡ����һ�����"^r"��ȡ��
- ^n, ^p �� buf ��Ĺؼ��ʲ�ȫ��
- ѧ�������滻":%s/ Ҫ�ѵĶ��� / Ҫ���ɵĶ��� /g"
- �κ�ʱ���Ƶ�һ�������ϰ�#�Ļ����Ը�������ĵ�������һ���ĵ���
- �á�/������������ n �� N ��һ�� / ��һ��
- ":! ���� &"��ֱ��������������":! ���� %&"����������������Ե�ǰ���༭�ļ���������
- �κ�ʱ�����":cd %:p:h"���л�Ŀ¼����ǰ�༭�ļ�����Ŀ¼��
- ��.�� ��� mark �������һ���޸ĵĵط������� "'." �����������һ���޸ĵĵط���'. �����������һ���޸ĵ���һ�С�
- g; �� g, ����������� changelist ����������ת���� :help changelist ���Կ�˵����
- <win> + <pg up> or <pg down> or <pg left> //change windows size
- <win> + left or right //rapidly change windows to watch two files diffience
- <ctrl + w> + <+> or <->  //change windows size
- vim -on file1 file2 ... // n split windows numbers o horizontal split O vertical split
- :sp filename //horizontal split windows

## ^M how to delete ^M

`:%s/^M//g`
^M "<ctrl -V> +<ctrl -M>"

## run markdown
<reader>rmk
open by typora

## show all result when search
/searchString<cr><leader>lv

## move windows center to cursor
zz
z+
z-
H M L move cursor to windows
:set scrolloff=10  //let cursor on windows center alwaysly

## move on buffers
- :ls, :buffers
	show all buffers
- :bn[ext]
    next buffer
- :bp[revious]
    last buffer
- :b2
    move to number 2 buffer
- :b exa
    move to match exa file  such as example.txt
- :sb 3
    split windows open buffer number 3 file by horizontal spl
- :vertical sb 3
    by vertical split

## reg pasteclipboard
:reg
show all reg
"+ system reg
- yyn
   n is name of reg
   paste reg content to current lin

## on txt file move to title
ctrl + ]

# 2017/2/26 ������ 21:05:31

## switch tabel
gt

## create tabel
<leader>nt

## insert current time
<leader>tt

## switch windows
Ctrl + f : next windows
Ctrl + b : last windows

ctrl + d : next half windows
ctrl + u : last half windows

## delete trick
dw
de
db
d$  delete to row end
di
dtc delete between c all charcters

## read and save
:r filename  read filename to current cursor
1,20 w filename  create new filename to 1,20 line content
1,$ w filename whole content write new filename
1,20 w >> filename write 1,20 content to filename last line

## autoindent
==

## jump to last cursor
ctrl + i
ctrl + o

## jedi
K document
<leader>g  go to
not for javascript

## setting pwd
<leader>.

## nerdtree
rename file
- `m` ->`m`
- alter filename

delete file
use key "m"

## emmet key
,, == `<ctrl y>,`

## go to mark
mark place: m {a-zA-Z}
go to mark: '{a-zA-Z}
delete mark: :delmarks {a-zA-Z}
show all mark: :marks

## line choose by visual mode
line visual mode: V
Vjj

�� visual mode: ctrl + v but on windows ctrl + q

gv  => choose last visual chosed text

o   => cursor move to selected text end
O   => cursor move to selected text start

## run python code on your vim
s = 'djj'
print s

**Run code by select 2 line Vkk, then press: !python and hit enter**

and output:
djj

anothor example:
def func(x, y):
	return x + y

print func(3, 4)

**output:7**

for i in 'moonclearner':
	print i

**output:**
m
o
o
n
c
l
e
a
r
n
e
r


## vim-surround
"hello world"
- press cs"' inside " switch to '
'hello world'
- press cs'<q> inside ' switch to <q></q>
<q>hello world</q>
- cst"
"hello world"
- ds" delete "
hello world
- cursor on hello ysiw]
[hello] world
- cs]{
{ hello } world
- yssb or yss) wrap entire line
({ hello } world)
- ds{ds) revert to original text
hello world
- ysiw<em> cursor on hello
<em>hello</em> world
- VS<p class="important"> wrap <p></p>
	<p class="important">
	<em>hello</em> world
	</p>

## close label tag
<p>>
output: <p></p>


## block visual
`ctrl+v`  on unix
`ctrl+q`  on windows

jjj or % muti line select

i,I,a,A to input

## ^ and 0
     this a sentence!
cursor on t
^ the cursor will jump to c
0 the cursor will jump to space, first column

## $ and g_
$ go to the end of line
g_ go to the last non-blank character of line

## buffer
:bn
:bp
:buffers -> show all buffers

## saveas
:saveas   -> save as

## \# and \*
\# look previous same character
\* jump next same character

## yank muti times character
this my test and test
*the cursor on i*

- y2/test ->will copy `is my test and `
	yank up to the second occurence of test
- y/test   -> will yank `is my `
	yank up to the first test before
- ye
- y$

## f and t
fa -> go to next occurence of the letter `a` on the line
	, and ; respresent next and previous, reverse use F
ta -> go to just before the character `a`, reverse use T

## dt and yt
t represent to
delete everything util the character before
yank everything util the character before

## Zone select
adb(map(+)("foo"))nnn
**cursor on `o`**

vi" -> will select foo
va" -> will select "foo"
- vi) -> will select "foo"
- va) -> will select ("foo")
- v2i) -> willl select `map(+)("foo")`
- v2a) -> will select `(map(+)("foo"))`

## completion
- ctrl+n next completion
- ctrl+p previous completion

## Macros
qa record actions in the reg a
q  stop record actions
@a replay the macro saved into the reg a
@@ to replay the last executed macro
number@@

## visual using
- J ->join all the lines together
- < or >  ->indent to left or right
- =  ->auto indent

## split
:split
:vsplit

open nerdtree
:Vexplore
:Sexplore

## common command
add ; three line at the line
ctrl+q ->$ ->jjj ->A ->; ->Esc
