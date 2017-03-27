# coding folding
vim has 6 methods for code folding:
- manual
- indent
- maker
- syntax
- expr
- diff

## manual
this mode is default
its as easy as doing visual line

zf  # create folding
- zf :Vjjjzf
- za :unfold
- zf5j : fold current line and after five line
- zf4k : fold current line and before four line
- zR : unfold all the folded by typing

### Some key to remenber
zf   => create fold
zf#j => fold down # line
zf#k => fold up # line
za   => open fold
zR   => unfold all


## indent
:set foldmethod=indent or on vimrc
Its automatically indented folding

### key
zM =>fold all
zR =>unfold all
za =>open fold

## marker
:set foldmethod=marker or on vimrc
default marker is {{{ and }}}

### key
za # fold and unfold all same zM and zR

### set own marker
:set foldmarker=start,end
for example
	:set foldmarker=/*,*/

only one marker
