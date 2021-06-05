"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示行号(相对行号)
set number
" set relativenumber

" 高亮光标所在行
set cursorline

set colorcolumn=81

" 光标在向下或向上移动时不会到达文件的最下方
set scrolloff=6

" 总是显示状态栏
set laststatus=2

" 右下角显示命令
set showcmd

" 显示一些不可见字符
set list
set listchars=trail:␣,tab:•,extends:»,precedes:«,eol:↲

" 分屏后光标到右或下窗口
set splitright
set splitbelow

"----------------------------------------------------------------------
" 透明背景和取消
"----------------------------------------------------------------------

function! Change_theme_alpha()
  if g:jsj_change_theme_alpha == 0
    let g:jsj_change_theme_alpha = 1
    highlight Normal guibg=NONE ctermbg=None
  else
    let g:jsj_change_theme_alpha = 0
    highlight Normal guibg=#282C34 ctermbg=235
  endif
  hi! link SignColumn LineNr
endfunction

"----------------------------------------------------------------------
" 设置颜色主题, 要在init-plugs.vim之后
"----------------------------------------------------------------------

" 允许 256 色
set background=dark
let g:jsj_change_theme_alpha = 0
let &t_ut='' " 修复vim背景显示异常在kitty下

set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
colorscheme onedark
set termguicolors

let &t_SI.="\e[5 q" "SI(start insert)
let &t_SR.="\e[4 q" "SR(start replace)
let &t_EI.="\e[1 q" "EI(end insert/replace)

" ------------ statusline ---------- "
" https://gabri.me/blog/diy-vim-statusline
" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
let g:currentmode={
       \ 'v'      : 'VISUAL',
       \ 'V'      : 'V·Line',
       \ "\<C-V>" : 'V·Block',
       \ 'i'      : 'INSERT',
       \ 'R'      : 'REPLACE',
       \ 't'      : 'TERMINAL',
       \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(v|V|)')
    exe 'hi! User1 ctermbg=171 guibg=#D75FFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi! User1 ctermbg=75 guibg=#5FAFFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi! User1 ctermbg=160 guibg=#D70000'
    return g:currentmode[mode()]
  elseif (mode() =~# 't')
    exe 'hi! User1 ctermbg=155  guibg=#AFFF5F'
    return g:currentmode[mode()]
  else
    exe 'hi! User1 ctermbg=155  guibg=#AFFF5F'
  endif
  return "NORMAL"
endfunction

hi! User1 cterm=bold ctermfg=232 ctermbg=155 gui=bold guifg=#080808 guibg=#AFFF5F
hi! User2 cterm=italic ctermfg=208 ctermbg=236 gui=italic guifg=#FF8800 guibg=#2C323C
hi! User3 cterm=bold ctermfg=yellow ctermbg=red gui=bold guifg=yellow guibg=red
hi! User4 cterm=bold ctermfg=195 ctermbg=236 gui=bold guifg=#B0B585 guibg=#2C323C
hi! User5 cterm=bold ctermfg=145 ctermbg=236 gui=bold guifg=#AFAFAF guibg=#2C323C

set statusline=%(%<%f\ %*%3*%m%*%h%r%)\ %=\ %(%v:%l/%L%)
augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%1*\ %{ChangeStatuslineColor()}
        \\ %*%2*\ %<%t\ %*%3*%m%h%r%*%)\ %=\ %(%4*%Y%*%5*\ %{&fenc?&fenc:&enc}\[%{&ff}\]
        \\ %*%1*\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%f\ %*%3*%m%*%h%r%)\ %=\ %(%v:%l/%L%)
augroup end
