"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
set relativenumber

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
    highlight SignColumn guibg=NONE ctermbg=None
  else
    let g:jsj_change_theme_alpha = 0
    if exists("g:colors_name") && g:colors_name=="gruvbox"
      highlight Normal guibg=#282828 ctermbg=235
    elseif exists("g:colors_name") && g:colors_name=="onedark"
      highlight Normal guibg=#282C34 ctermbg=235
    else
      highlight Normal guibg=#2C323B ctermbg=235
    endif
    highlight SignColumn ctermbg=237 guibg=#3a3034
  endif
endfunction


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
  colorscheme gruvbox
  if exists("g:colors_name") && (g:colors_name=="gruvbox" || g:colors_name=="onedark")
    let g:airline_theme=g:colors_name
  endif
else
  colorscheme gruvbox
  set statusline=%F\ \[%M%n%R%H\]%=\ %0(\ %y\ %{&fileformat}\ %v:%l/%L%)
endif

if has('gui_running')
  set guifont=Source\ Code\ Pro\ 14
  set guioptions-=T
  set guioptions-=r
  set guioptions-=m
  set showtabline=2
endif

"----------------------------------------------------------------------
" 设置TODO高亮组
"----------------------------------------------------------------------

augroup jsj_color_warning
  autocmd!
  highlight! Todo cterm=bold,italic ctermfg=223 ctermbg=235 gui=bold,italic guifg=fg guibg=bg
  autocmd FileType * call matchadd('Todo', 'NOTICE')
  autocmd FileType * call matchadd('Todo', '???...')
  autocmd FileType gas call matchadd('Todo', 'TODO')
augroup END
