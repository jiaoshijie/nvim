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
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=75
let g:netrw_preview=1

" nvim 实时展示 "substitute" 命令过程
set inccommand=split

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
set backupdir=$HOME/.config/nvim/tmp/backup//,.

" 禁止交换文件
set noswapfile
set directory=$HOME/.config/nvim/tmp/swp//,.

" 允许undofile
set undofile
set undodir=/tmp/neovim_u/undodir//,.

" 创建各自的目录
if ! isdirectory(expand('$HOME/.config/nvim/tmp/swp'))
  silent! call mkdir(expand('$HOME/.config/nvim/tmp/swp'), 'p', 0700)
endif
if ! isdirectory(expand('$HOME/.config/nvim/tmp/backup'))
  silent! call mkdir(expand('$HOME/.config/nvim/tmp/backup'), 'p', 0700)
endif
if ! isdirectory(expand('/tmp/neovim_u/undodir'))
  silent! call mkdir(expand('/tmp/neovim_u/undodir'), 'p', 0700)
endif

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

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到.tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags;./.rtags;,.rtags

" cscope 配置
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
