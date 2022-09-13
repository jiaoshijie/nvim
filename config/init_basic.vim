"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用vi兼容模式
set nocompatible

set modelines=0
set nomodeline

" 设置 Backspace 键模式
set bs=indent,eol,start

" 自动缩进
set autoindent
set smartindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 设置自动折行
set nowrap
set linebreak
set textwidth=0
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
" 取消自动折行的缩进
set formatoptions-=tc


" 显示光标位置
set ruler

" 打开功能键超时检测(终端下功能键为一串 ESC 开头的字符串)
set ttimeout
set ttimeoutlen=50

" 等待命令键
set timeout
set timeoutlen=500

" 鼠标支持
set mouse=nvi
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" 总是显示左边的一列, 用于显示一些错误, 标签
set signcolumn=auto

set diffopt=vertical,filler,context:3,foldcolumn:1,internal,algorithm:histogram,indent-heuristic

if &diff
  syntax off
  setlocal nospell
endif

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
" 内部工作编码
set encoding=utf-8

" 文件默认编码
set fileencoding=utf-8

" 打开文件时自动尝试下面顺序的编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
filetype plugin indent on


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
syntax on


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
"  zA za zM zR
" 允许代码折叠
set foldenable

" 代码折叠默认使用缩进
set fdm=indent

" 默认打开所有缩进
set foldlevel=99


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 补全选项, "menuone"只有一个时也展示一个菜单
" set completeopt=menuone,noselect,preview
set completeopt=menuone,noselect
" for more detail ":h ins-completion", ":h 'complete'"
set dictionary=/usr/share/dict/words
set complete=.,w

" quicklist 配置, 跳到第一个搜索到的位置在当前窗口
set switchbuf=useopen

" 设置使用系统剪切板
set clipboard=unnamedplus

" 显示匹配的括号
set showmatch
" 显示括号匹配的时间
set matchtime=2

" 切换buffer时可以不保存当前buffer
set hidden

" 退出vim时显示友好的提示
set confirm

" 文件修改之后自动载入
set autoread

" 显示最后一行
set display=lastline

" 在visual-mode下, 允许光标移动到最后一个字符后面
set virtualedit=block

" when using `:find file_name`, it provides tab-completion for all
" file-related tasks
set path+=**

" 允许下方显示目录
set wildmenu

" 设置wildmenu的补全方式
set wildmode=full
set wildoptions=pum
set pumheight=15

" 延迟绘制(提升性能)
set lazyredraw

" 定义 <C-a> 和 <C-x> 加减数字的格式
set nrformats=

" 文件换行符，默认使用 unix 换行符
set fileformats=unix,dos,mac

" 取消自动改变文件夹
set noautochdir

" 缩短一些message 如 将[NEW FILE]代替为[NEW]
set shortmess+=c
set shortmess-=S

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

let g:loaded_python_provider=0
let g:loaded_perl_provider=0
let g:python3_host_prog='/usr/bin/python3'

" for netrw
let g:netrw_banner       = 0  " disable annoying banner
let g:netrw_browse_split = 0  " open in prior window
let g:netrw_altv         = 1  " open splits to the right
let g:netrw_alto         = 0
let g:netrw_liststyle    = 0  " tree view
let g:netrw_winsize      = 25
let g:netrw_preview      = 1
let g:netrw_localrmdir   = 'rm -r'
let g:netrw_localcopycmd = 'cp -r'
let g:netrw_keepdir      = 1
let g:netrw_hide         = 1
let g:netrw_list_hide    = '\(^\|\s\s\)\zs\.\S\+'

augroup jsj_HLYnakedText
  au!
  au TextYankPost * call hlyankedtext#HLYankedText()
augroup END

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*obj,*~,*.exe,*.a,*.dll,*.swp,*.jar,*.class,*.pyc,*.pyo,*.bin
set wildignore+=*/.Trash/**,*.dmg,*/.rbenv/**,*DS_Store*

"----------------------------------------------------------------------
" 备份配置
"----------------------------------------------------------------------

set nobackup
set noswapfile

" set undofile
silent! call mkdir(expand('/tmp/jsj_vim_u/undodir'), 'p', 0700)
set undodir=/tmp/jsj_vim_u/undodir//
set undofile

"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
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

"----------------------------------------------------------------------
" 终端下功能键设置, 及功能键终端码矫正
"----------------------------------------------------------------------
function! s:key_escape(name, code)
  exec "set ".a:name."=\e".a:code
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
  autocmd BufReadPost * if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
augroup END

command! -nargs=0 CheckHlGroup call utils#Jsj_CheckHlGroup()
command! -nargs=0 SF call utils#showFilePath()
command! -nargs=? -complete=dir GF call utils#fzfGit(<q-args>)

" 提权保存
command! SudoWrite execute 'write !sudo tee % >/dev/null' <bar> edit!

set grepprg=rg\ --no-heading\ --column\ -S\ $*
set grepformat=%f:%l:%c:%m

"----------------------------------------------------------------------
" 自动切换fcitx
"----------------------------------------------------------------------

if has('unix')
  augroup jsj_Fcitx_toggle
    autocmd!
    autocmd InsertLeave * call utils#Fcitx2en()
  augroup END
endif
