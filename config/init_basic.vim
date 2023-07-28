set nocompatible  " no vi compatible

set modelines=0
set nomodeline

set viminfo='20,<1000,s1000

set bs=indent,eol,start  " backspace behavior

set autoindent
set smartindent
set cindent  " for c, c++

set nowrap
set linebreak
set textwidth=0

set fo-=t
set fo-=c
set fo-=r
set fo-=o
set fo+=q
set fo+=m
set fo+=M
set fo+=1
set fo+=j

set ttimeout
set ttimeoutlen=50
set timeout
set timeoutlen=500

set mouse=nvi

set signcolumn=auto

set diffopt=vertical,filler,context:3,foldcolumn:1,internal,algorithm:histogram,indent-heuristic

if &diff
  syntax off
  setlocal nospell
endif

" for search
set ignorecase
set smartcase
set hlsearch
set incsearch


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

filetype plugin indent on
syntax on

set fdm=indent
set foldlevel=99


" for completion
set completeopt=menuone,noselect
" for more detail ":h ins-completion", ":h 'complete'"
set dictionary=/usr/share/dict/words
set complete=.,w

" quicklist
set switchbuf=useopen

" set clipboard=unnamedplus

set showmatch
set matchtime=2

set hidden
set confirm

set virtualedit=block

" when using `:find file_name`, it provides tab-completion for all
" file-related tasks
set path+=**
set wildmenu
set wildmode=full
set wildoptions=pum
set pumheight=15

set lazyredraw

" for <C-a> and <C-x>
set nrformats=

" 文件换行符，默认使用 unix 换行符
set fileformats=unix,dos,mac

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

command! -nargs=0 CheckHlGroupUnderCursor call utils#Jsj_CheckHlGroup()
command! -nargs=0 SF call utils#showFilePath()
command! -nargs=0 Write2clipboard call utils#write2clipboard()
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
