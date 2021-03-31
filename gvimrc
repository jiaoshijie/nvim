set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Cascadia\ Mono\ 13

let g:jsj_change_theme_alpha = 0
set background=dark
colorscheme solarized

hi User1 gui=bold,reverse guifg=#AFFF5F guibg=#080808
hi User2 gui=bold,reverse guifg=red guibg=yellow
hi User3 gui=bold,reverse guifg=#D75FFF guibg=#080808
hi User4 gui=bold,reverse guifg=#87FFFF guibg=#080808
hi User5 gui=italic,reverse guifg=#5F8787 guibg=#B0B585
set statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&ff}\ %p%%\ %v:%l/%L%)

augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%5*\[%n\]%*%1*\ %<%F\ %*%2*%m%h%r%*%)\ %=\ %(%5*%y%*%3*\ %{&ff}\ %*%4*\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&ff}\ %p%%\ %v:%l/%L%)
augroup end
