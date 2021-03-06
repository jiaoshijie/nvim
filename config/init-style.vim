"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
" set relativenumber
set signcolumn=yes

" 高亮光标所在行
set cursorline

" 光标在向下或向上移动时不会到达文件的最下方
set scrolloff=6

" 总是显示状态栏
set laststatus=2

" 右下角显示命令
set showcmd

" 显示一些不可见字符
set list
set listchars=trail:▫,tab:,extends:≫,precedes:≪

" 分屏后光标到右或下窗口
set splitright
set splitbelow

"----------------------------------------------------------------------
" 透明背景和取消
"----------------------------------------------------------------------

function! Change_theme_alpha()
  if !exists("g:jsj_change_theme_alpha") || g:jsj_change_theme_alpha == 0
    let g:jsj_change_theme_alpha = 1
    highlight Normal guibg=NONE ctermbg=None
  else
    let g:jsj_change_theme_alpha = 0
    highlight Normal guibg=#282828 ctermbg=235
  endif
  hi! link SignColumn LineNr
endfunction

function! Hold_theme_alpha()
  if exists("g:jsj_change_theme_alpha") && g:jsj_change_theme_alpha == 1
    highlight Normal guibg=NONE ctermbg=None
    highlight SignColumn guibg=NONE ctermbg=None
  endif
endfunction

augroup jsj_hold_theme_alpha
  autocmd!
  autocmd ColorScheme * exec Hold_theme_alpha()
augroup end

"----------------------------------------------------------------------
" 设置颜色主题, 要在init-plugs.vim之后
"----------------------------------------------------------------------

" 允许 256 色
set t_Co=256

" 设置终端vim支持gui的颜色
set termguicolors

" 设置黑色背景
set background=dark

" 设置颜色主题
colorscheme gruvbox

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"----------------------------------------------------------------------
" 设置TODO高亮组
"----------------------------------------------------------------------

augroup jsj_color_warning
  autocmd!
  highlight Todo cterm=bold,italic ctermfg=223 ctermbg=160 gui=bold,italic guifg=#e5b07b guibg=#D70000
  highlight Debug cterm=bold,italic ctermfg=223 ctermbg=235 gui=bold,italic guifg=#e5b07b guibg=bg
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|???!!!\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END
