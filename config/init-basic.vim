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
set mouse=a

" 总是显示左边的一列, 用于显示一些错误, 标签
set signcolumn=auto

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
set completeopt=menuone,noselect,preview

" 设置使用系统剪切板
" set clipboard+=unnamedplus
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
set wildoptions="df"

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

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
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
