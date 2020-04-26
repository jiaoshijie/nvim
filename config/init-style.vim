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
    if exists("g:colors_name") && g:colors_name=="dracula"
      highlight Normal guibg=#282A36 ctermbg=236
    elseif exists("g:colors_name") && g:colors_name=="gruvbox"
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

" 设置终端vim支持gui的颜色
if has("termguicolors")
  set termguicolors
end

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

if has('nvim')
  " 设置颜色主题
  let g:onedark_terminal_italics=1
  " gruvbox onedark dracula
  colorscheme gruvbox
  if exists("g:colors_name") && (g:colors_name=="gruvbox" || g:colors_name=="onedark" || g:colors_name=="dracula")
    let g:airline_theme=g:colors_name
  else
    let g:ariline_theme=dark  " or random
  endif
endif

if has('gui_running')
  set guifont=Source\ Code\ Pro\ 14
  set guioptions-=T
  set guioptions-=r
  set guioptions-=m

  colorscheme elflord
  " 总是显示标签栏
  set showtabline=2
  " 状态栏设置
  set statusline=                                 " 清空状态
  set statusline+=\ %F                            " 文件名
  set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
  set statusline+=%=                              " 向右对齐
  set statusline+=\ %y                            " 文件类型
  set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)    " 最右边显示文件编码和行号等信息

  " 修正补全目录的色彩
  highlight! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
  highlight! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray
endif

"----------------------------------------------------------------------
" 设置TODO高亮组
"----------------------------------------------------------------------

augroup jsj_color_warning
  autocmd!
  highlight! Todo cterm=bold,italic ctermfg=223 ctermbg=235 gui=bold,italic guifg=fg guibg=bg
  autocmd FileType * call matchadd('Todo', 'NOTICE')
  autocmd FileType gas call matchadd('Todo', 'TODO')
augroup END
