""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change time: 2017/3/3 星期五 22:30:18
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

""""""""""""""""""""Personal Settings""""""""""""""""""
"""""""""""""""""""more to be added soon""""""""""""""""
set nocompatible

" 系统粘贴的时候关闭自动缩进的功能，以免造成不必要的缩进
set pastetoggle=<f2>
set clipboard=unnamed

" change mapleader keymap <leader>
let mapleader = ","

" 导入python-mode插件
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

helptags e:/vim/vim80/doc/

filetype plugin indent on
syntax on

""""""""windows setting""""""""""""""""""""""""""""""""""""""""""""
"Set the status line options. Make it show more information.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"Set Color Scheme and Font Options
colorscheme molokai
set guifont=Consolas:h12
"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set nobackup
set cursorline

""""""""""""""""""""括号自动补全"""""""""""""""""""""
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
" inoremap { {<CR>}<ESC>O
inoremap {  {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i

" tab navigation mappings
nmap tn :tabn<CR>
nmap tp :tabp<CR>
nmap tm :tabm 
nmap tt :tabnew 
nmap ts :tab split<CR>

"""""""""""""""""""""get time label"""""""""""""""""""""""
" inoremap <C-T> <C-R>=strftime("%F")<CR>

""""""remove highlight of your last search""""""
noremap <F5> :noh<CR>
vnoremap <F5> :noh<CR>
inoremap <F5> :noh<CR>

""""""""" insert current time """"""""""""""""""""
noremap <leader>tt "=strftime("%c")<CR>P
inoremap <leader>tt <C-R>=strftime("%c")<CR>

function! ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
       return "\<Right>"
   else
       return a:char
   endif
endfunction

""""""""""""""""""""""new tab move keymap  gt gT""""""""""""""""
" create new tab: :tabnew
map <leader>nt :tabe<CR>

""""""""""""设置不同的文件格式""""""""""""""""
" =number closely no spaces
au BufNewFile,BufRead  *.py set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

autocmd BufNewFile *.py exec ":call Setutf8()"

func Setutf8()
	call append(line("."), "# Author : mooncleaner")
endfunc
autocmd BufNewFile * normal G


"  显示多余空格
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"""""""""""""""""""" set tab = 4
au BufNewFile,BufRead *.txt,*.md
   \ set tabstop =4 |
   \ set softtabstop =4 |
    \ set shiftwidth=4 |

" 安装 Vundle""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
" Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
" Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" change vim tpyesetting
Plugin 'hotoo/pangu.vim'

" xml comlete
Plugin 'sukima/xmledit'

" web complete
Plugin 'mattn/emmet-vim'

" web label highlight
Plugin 'gregsexton/matchtag'

" Html auto close label >>
Plugin 'alvan/vim-closetag'

" delete and surround brackets, quotes, parentheses, XML
Plugin 'tpope/vim-surround'
" help surround

" javascript syntax highlight and improve indentation
Plugin 'pangloss/vim-javascript'

" smarter change filetype html has javascript code
Plugin 'shougo/context_filetype.vim'

" tern for vim for javascript
Plugin 'marijnh/tern_for_vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
    

" All of your Plugins must be added before the following line
call vundle#end()            " required

"""""""""""""""""""""""""" javascript-vim """""""""""""""""
" Enable syntax highlight
let g:javascript_plugin_jsdoc = 1

" Enable some additional syntax highlight for NGDocs
let g:javascript_plugin_ngdoc = 1

" Enable syntax highlight for flow
let g:javascript_plugin_flow = 1

"""""""""""""""""""""""" seting vim-closetag""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
"""""""""""""""""""""快捷点设置"""""""""""""""""""""""'''
" 快速进入普通模式
inoremap kj <Esc>

" split navigations用于切换窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 触发tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'E:\ctags58\ctags'  
let g:tagbar_width = 60 

" 触发NERDTree
map <C-w> :NERDTreeToggle<CR>
map <silent><C-n> :exec("NERDTree ".expand('%:h'))<CR>

" cd 切换当前工作路径
nnoremap <silent> <leader>. :cd %:p:h<CR>

" row switch
nnoremap j gj
nnoremap k gk


" close Syntastic check syntax
nnoremap <leader>oc :Errors<CR>
nnoremap <leader>lc :lclose<CR>

" rapidly run python program
" nmap :rr :!python %<CR>

" search string show all result
" /needsearchstring <leader>lv to show list
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 

" quickly run program"

nmap <leader>rr :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!python %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'markdown'
		exec "!typora %"
	endif
    endfunc

""""""""""""""""""""""""""vim-emmet""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

""""""""""""""""""""""redefine trigger key """""""""""""""
let g:user_emmet_leader_key = '<leader>'

"""""""""""""""""""""""""""""snippets variables"""""""""""""""""""""""""""""
let g:snips_author='moonclearner'
let g:author='moonclearner'
let g:snips_email='moonclearner@hotmail.com'
let g:email='mooncleaner@hotamail'
let g:snips_github='https://github.com/moonclearner'
let g:github='https://github.com/moonclearner'

" if strridx(getcwd(), "sococo") > 0
   " let g:snips_company='Sococo'
   " let g:company='Sococo'
" else
   " let g:snips_company=g:snips_author
   " let g:company=g:snips_author
" endif

"""""""""""""""""""""""""nerdtree git symbols setting""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "Modified",
    \ "Staged"    : "Staged",
    \ "Untracked" : "Untracked",
    \ "Renamed"   : "Renamed",
    \ "Unmerged"  : "Unmerged",
    \ "Deleted"   : "Deleted",
    \ "Dirty"     : "Dirty",
    \ "Clean"     : "Clean",
    \ "Unknown"   : "Unknown"
    \ }

"""""""""""""""""""""""""""""""nerdtree setting"""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""pangu solve chinese TYPE """"""""""""""""""""""
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()


""""""""""""""""'UTF-8 解决乱码问题"""""""""""""""""""""

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

""""""""""""""""""""开启Neocomplete""""""""""""""""""""""""""""
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

let g:neocomplete#enable_camel_case = 1
let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#data_directory = "~/.vim/.cache/neocomplete"
let g:neocomplete#enable_insert_char_pre = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


"""""""""""" jedi-vim""""""""""""""""""""""""""""
filetype plugin indent on

syntax enable

let g:neocomplete#enable_at_startup = 1

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0:w
let g:jedi#auto_vim_configuration = 0

let g:jedi#smart_auto_mapping = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


""""""""""""""""""""""""""" neosnippet 设置

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = { "_":1,}


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"""""""""""""""""" molokai设置""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
let g:rehash256 = 1

""""""""""""""""""NERDComment 设置""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""markdown 设置"""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
"====markdown设置====
let g:table_mode_corner="|"

" "会自动使用typora启动markdown
nnoremap <Leader>rmd :update<Bar>silent ! start %:p<CR>

"====open file in chrome browser====
" 使用chrome的markdown preview plus 进行显示markdown
" nnoremap <Leader>ch :update<Bar>silent !start "C:\Users\djj\AppData\Local\Google\Chrome\Application\chrome.exe" "%:p"<CR>

"""""""""""""""""""Syntastic 设置 """""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

