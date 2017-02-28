# vim 插件安装使用手册

## theNERD v

Most of the following mappings are for normal/visual mode only. The |NERDComInsertComment| mapping is for insert mode only.

- [count]<leader>cc |NERDComComment|

  Comment out the current line or text selected in visual mode.

- [count]<leader>cn |NERDComNestedComment|

  Same as cc but forces nesting.

- [count]<leader>c<space> |NERDComToggleComment|

  Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

- [count]<leader>cm |NERDComMinimalComment|

  Comments the given lines using only one set of multipart delimiters.

- [count]<leader>ci |NERDComInvertComment|

  Toggles the comment state of the selected line(s) individually.

- [count]<leader>cs |NERDComSexyComment|

  Comments out the selected lines with a pretty block formatted layout.

- [count]<leader>cy |NERDComYankComment|

  Same as cc except that the commented line(s) are yanked first.

- <leader>c$ |NERDComEOLComment|

  Comments the current line from the cursor to the end of line.

- <leader>cA |NERDComAppendComment|

  Adds comment delimiters to the end of line and goes into insert mode between them.

- |NERDComInsertComment|

  Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

- <leader>ca |NERDComAltDelim|

  Switches to the alternative set of delimiters.


- [count]<leader>cl
  [count]<leader>cb |NERDComAlignedComment|

  Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

- [count]<leader>cu |NERDComUncommentLine|

  Uncomments the selected line(s).



## CtrlP

- Run `:CtrlP` or `:CtrlP [starting-directory]` to invoke CtrlP in find file mode.

- Run `:CtrlPBuffer` or `:CtrlPMRU` to invoke CtrlP in find buffer or find MRU file mode.

- Run `:CtrlPMixed` to search in Files, Buffers and MRU files at the same time.

  Check `:help ctrlp-commands` and `:help ctrlp-extensions` for other commands.

  ##### Once CtrlP is open:

- Press `f5` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.

- Press `c-f` and `c-b` to cycle between modes.

- Press `c-d` to switch to filename only search instead of full path.

- Press `c-r` to switch to regexp mode.

- Use `c-j`, `c-k` or the arrow keys to navigate the result list.

- Use `c-t` or `c-v`, `c-x` to open the selected entry in a new tab or in a new split.

- Use `c-n`, `c-p` to select the next/previous string in the prompt's history.

- Use `c-y` to create a new file and its parent directories.

- Use `c-z` to mark/unmark multiple files and `<c-o>` to open them.

  ​

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

- Submit two or more dots `..` to go up the directory tree by one or multiple levels

- End the input string with a colon `:` followed by a command to execute it on the opening file(s):
  Use `:25` to jump to line 25.

  ​

Use `:diffthis` when opening multiple files to run `:diffthis` on the first 4 files.



## neocomplete and neosnippet

tab  切换选择自动补全 space选择

snippet tab切换   `c-k` 选择与切换下一个输入单元

## tagbar

显示函数、类、变量等
`<F8>` 开启tagsidebar

