"----------------------------------------------------------------------
" 扩展基础配置
"----------------------------------------------------------------------

" set leader  = "Space"
let mapleader=' '
" set localleader = ","
let maplocalleader=','

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" for netrw
let g:netrw_banner=0  " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1  " open splits to the right
let g:netrw_alto=0
let g:netrw_liststyle=3  " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=75
let g:netrw_preview=1

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
    set diffopt=vertical,algorithm:histogram,indent-heuristic
endif

"----------------------------------------------------------------------
" 备份配置
"----------------------------------------------------------------------

" 禁止备份
set nobackup
" 如果允许, 保存时备份
set writebackup
" 如果允许, 备份文件扩展名
set backupext=.bak
set backupdir=$HOME/.vim/tmp/backup//,.

" 禁止交换文件
set noswapfile
set directory=$HOME/.vim/tmp/swp//,.

" 允许undofile
set undofile
set undodir=/tmp/unpvim_u/undodir//,.

" 创建各自的目录
if ! isdirectory(expand('$HOME/.vim/tmp/swp'))
  silent! call mkdir(expand('$HOME/.vim/tmp/swp'), 'p', 0700)
endif
if ! isdirectory(expand('$HOME/.vim/tmp/backup'))
  silent! call mkdir(expand('$HOME/.vim/tmp/backup'), 'p', 0700)
endif
if ! isdirectory(expand('/tmp/unpvim_u/undodir'))
  silent! call mkdir(expand('/tmp/unpvim_u/undodir'), 'p', 0700)
endif

"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if !has('nvim')
  function! s:metacode(key)
    exec "set <M-".a:key.">=\e".a:key
  endfunc
  for i in range(10)
    call s:metacode(nr2char(char2nr('0') + i))
  endfor
  for i in range(26)
    call s:metacode(nr2char(char2nr('a') + i))
    call s:metacode(nr2char(char2nr('A') + i))
  endfor
  for c in [',', '.', '/', ';', '{', '}']
    call s:metacode(c)
  endfor
  for c in ['?', ':', '-', '_', '+', '=', "'"]
    call s:metacode(c)
  endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置, 及功能键终端码矫正
"----------------------------------------------------------------------
function! s:key_escape(name, code)
  if !has('nvim')
    exec "set ".a:name."=\e".a:code
  endif
endfunc

call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')

"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

augroup jsj_useful_settings
  autocmd!

  " 打开到上次编辑的位置
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd VimLeave *.tex !texclear %
  autocmd BufRead,BufNewFile *.S,*.s setlocal filetype=gas
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex nolinebreak
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal nolinebreak
augroup END

command! Wcolor echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
            \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
            \ "> fg:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")

" 提权保存
command! SudoWrite execute 'write !sudo tee % >/dev/null' <bar> edit!

set grepprg=rg\ --no-heading\ --column\ -S\ $*
set grepformat=%f:%l:%c:%m

"----------------------------------------------------------------------
" 自动切换fcitx
"----------------------------------------------------------------------

function! Fcitx2en()
   if system("fcitx5-remote") == 2
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

if has('unix')
  augroup jsj_Fcitx_toggle
    autocmd!
    autocmd InsertLeave * call Fcitx2en()
  augroup END
endif

"----------------------------------------------------------------------
" ctags, cscope配置
"----------------------------------------------------------------------

" vim complete
" for more detail ":h ins-completion", ":h 'complete'"
set complete-=i
set complete-=b
set complete-=u

set tags=./tags,tags

" 指定cscope命令的路径
set csprg=/usr/bin/cscope

" 为1会先搜索tags文件如果没有找到再搜索cscope.out数据库, 为0则相反
set csto=1

" 使用cstag代替vim的默认行为
set cst

" add any database in current directory
if filereadable("cscope.out")
  set noautochdir
  " 将数据库文件连接到vim, if don't have "silent", add database pointed to by environment
  silent cs add cscope.out
elseif $CSCOPE_DB != ""
  silent cs add $CSCOPE_DB
endif

" + 将结果附加到quicklinst后面, - 清除quicklist上一次的结果, 0 不使用quicklist
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

" quicklist 配置, 跳到第一个搜索到的位置在当前窗口
set switchbuf=useopen