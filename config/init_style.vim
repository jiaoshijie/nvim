"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
" set relativenumber

" 高亮光标所在行
set cursorline

set colorcolumn=79

" 光标在向下或向上移动时不会到达文件的最下方
set scrolloff=6

" 总是显示状态栏
set laststatus=2

" 右下角显示命令
set showcmd

" 显示一些不可见字符
set list
set listchars=trail:␣,tab:•,extends:»,precedes:« " ,eol:↲

" 分屏后光标到右或下窗口
set splitright
set splitbelow

set background=dark

set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
set termguicolors
colorscheme onedark

let &t_SI.="\e[5 q" "SI(start insert)
let &t_SR.="\e[4 q" "SR(start replace)
let &t_EI.="\e[1 q" "EI(end insert/replace)