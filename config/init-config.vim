"----------------------------------------------------------------------
" 扩展基础配置
"----------------------------------------------------------------------

" set leader  = "Space"
let mapleader=' '
" set localleader = ","
let maplocalleader=','

"----------------------------------------------------------------------
" 备份配置
"----------------------------------------------------------------------

let g:backup_dir=$HMOE

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

" 删除最后的空格和行
function! RCStripWSBL()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction

augroup jsj_useful_settings
  autocmd!

  " 打开到上次编辑的位置
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
        \ | exe "normal! g'\"" | endif

  autocmd BufWritePre * call RCStripWSBL()

  " filetype
  autocmd BufRead,BufNewFile *.S,*.s setlocal filetype=gas
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex nolinebreak
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal nolinebreak

  " Runs a script that cleans out tex build files whenever I close out of a .tex file.
  autocmd VimLeave *.tex !texclear %
augroup END

" 查看高亮组
command! Wcolor echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
            \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
            \ "> fg:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")

"----------------------------------------------------------------------
" 自动切换fcitx
"----------------------------------------------------------------------

let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

if has('unix')
  augroup jsj_Fcitx_toggle
    autocmd!
    autocmd InsertLeave * call Fcitx2en()
    " autocmd InsertEnter * call Fcitx2zh()
  augroup END
endif

"----------------------------------------------------------------------
" ctags, cscope配置
"----------------------------------------------------------------------

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到.tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" cscope 配置
if has("cscope")
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
endif

" + 将结果附加到quicklinst后面, - 清除quicklist上一次的结果, 0 不使用quicklist
set cscopequickfix=t-,s-,d-,c-

" quicklist 配置, 跳到第一个搜索到的位置在当前窗口
set switchbuf=useopen
