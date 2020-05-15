"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
set relativenumber

" 高亮光标所在行
set cursorline
augroup jsj_cursorline
  autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup end

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
    highlight SignColumn guibg=NONE ctermbg=None
  else
    let g:jsj_change_theme_alpha = 0
    if exists("g:colors_name") && g:colors_name=="gruvbox"
      highlight Normal guibg=#282828 ctermbg=235
      highlight SignColumn ctermbg=237 guibg=#3c3836
    else
      highlight Normal guibg=#282C34 ctermbg=235
      highlight SignColumn ctermbg=235 guibg=#282C34
    endif
  endif
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

" 设置终端vim支持gui的颜色
if has('termguicolors') && has('nvim')
  set termguicolors
endif

" 设置黑色背景
set background=dark

if has('nvim')
  " 设置颜色主题
  let g:onedark_terminal_italics=1
  " gruvbox onedark
  colorscheme onedark
  if exists("g:colors_name") && (g:colors_name=="gruvbox" || g:colors_name=="onedark")
    let g:airline_theme=g:colors_name
  endif
else
  highlight! SignColumn guibg=NONE ctermbg=NONE
  highlight! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
  highlight! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray
  highlight! StatusLine ctermbg=darkgray cterm=NONE guibg=darkgray gui=NONE
  set statusline=%F\ \[%M%n%R%H\]%=\ %0(\ %y\ %{&fileformat}\ %v:%l/%L%)

  let &t_SI.="\e[5 q" "SI = INSERT mode
  let &t_SR.="\e[4 q" "SR = REPLACE mode
  let &t_EI.="\e[1 q" "EI = NORMAL mode(end insert or replace)

  " if empty($TMUX)
  "   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  "   let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  " else
  "   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  "   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  "   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  " endif
endif

"----------------------------------------------------------------------
" 设置TODO高亮组
"----------------------------------------------------------------------

augroup jsj_color_warning
  autocmd!
  highlight! Todo cterm=bold,italic ctermfg=223 ctermbg=235 gui=bold,italic guifg=fg guibg=bg
  autocmd FileType * call matchadd('Todo', 'NOTICE')
  autocmd FileType * call matchadd('Todo', '???!!!')
  autocmd FileType gas call matchadd('Todo', 'TODO')
augroup END
