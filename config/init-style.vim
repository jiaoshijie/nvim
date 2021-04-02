"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
" set relativenumber

" 高亮光标所在行
set cursorline

" make the 81st column stand out
" set colorcolumn=+1

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
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


"----------------------------------------------------------------------
" 设置颜色主题, 要在init-plugs.vim之后
"----------------------------------------------------------------------

" 允许 256 色
set t_Co=256

set background=light
colorscheme Jsjsimple

" let g:jsj_change_theme_alpha = 0

let &t_SI.="\e[5 q" "SI(start insert)
let &t_SR.="\e[4 q" "SR(start replace)
let &t_EI.="\e[1 q" "EI(end insert/replace)

" ------------ statusline ---------- "
" https://blog.csdn.net/strategycn/article/details/7620261
" https://gabri.me/blog/diy-vim-statusline
" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
hi User1 cterm=bold ctermfg=155 ctermbg=232
hi User2 cterm=bold,reverse ctermfg=red ctermbg=11
hi User3 cterm=bold,reverse ctermfg=145 ctermbg=232
hi User4 cterm=bold,reverse ctermfg=155 ctermbg=232
hi User5 cterm=italic,reverse ctermfg=66 ctermbg=195

let g:currentmode={
       \ 'v'      : 'VISUAL',
       \ 'V'      : 'V·Line',
       \ "\<C-V>" : 'V·Block',
       \ 'i'      : 'INSERT',
       \ 'R'      : 'REPLACE',
       \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(v|V|)')
    exe 'hi! User4 ctermfg=171 guifg=#D75FFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi! User4 ctermfg=75 guifg=#5FAFFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi! User4 ctermfg=160 guifg=#D70000'
    return g:currentmode[mode()]
  else
    exe 'hi! User4 ctermfg=155  guifg=#AFFF5F'
  endif
  return "NORMAL"
endfunction

set statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %p%%\ %v:%l/%L%)
augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%4*\ %{ChangeStatuslineColor()}\ %*%1*\ %<%F\ %*%2*%m%h%r%*%)\ %=\ %(%5*%y%*%3*\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %*%4*\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %p%%\ %v:%l/%L%)
augroup end
" ------------ statusline ---------- "


"----------------------------------------------------------------------
" 设置TODO高亮组
"----------------------------------------------------------------------

augroup jsj_color_warning
  autocmd!
  highlight Todo cterm=bold,italic ctermfg=223 ctermbg=160
  highlight Debug cterm=bold,italic ctermfg=223 ctermbg=235
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|???!!!\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END
