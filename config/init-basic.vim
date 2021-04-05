"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用vi兼容模式
set nocompatible

" =======
" modeline针对每个文件进行文件级别的设置
" 设置是覆盖当前用户的vimrc中的设置
" 在使用modeline的文件开始添加 "# vim: set expandtab ts=4 sts=4 sw=4 :"
" 类似shell, python脚本, 很多人建议关掉
" =======
" 关闭modeline
set modelines=0
set nomodeline

set mouse=a

filetype plugin indent on
syntax on

set smartindent
set cindent

" 设置自动折行
set wrap
set linebreak
set textwidth=0
set formatoptions+=m
set formatoptions+=B
set formatoptions-=tc

set timeoutlen=500


"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

set ignorecase
set smartcase

"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
" for more ":h za zA zM zR zc zo zC zO"
set fdm=indent
set foldlevel=99


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 补全选项, "menuone"只有一个时也展示一个菜单
set completeopt=menuone,menu,preview,noinsert,noselect

" 设置使用系统剪切板
set clipboard=unnamedplus

" 显示匹配的括号
set showmatch
" 显示括号匹配的时间
set matchtime=3

" 切换buffer时可以不保存当前buffer
set hidden

" 退出vim时显示友好的提示
set confirm

" 在visual-mode下, 允许光标移动到最后一个字符后面
set virtualedit=block

set path+=**

" 允许下方显示目录
set wildmenu

" 设置pum的透明度 0为不透明 100全透明
set pumblend=20

" 延迟绘制(提升性能)
set lazyredraw

" 定义 <C-a> 和 <C-x> 加减数字的格式(10进制, 16进制, 8进制)
set nrformats=alpha,hex,octal

" 文件换行符，默认使用 unix 换行符
set fileformats=unix,dos,mac

" 取消自动改变文件夹
set noautochdir

" 缩短一些message 如 将[NEW FILE]代替为[NEW]
set shortmess+=cI

set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
