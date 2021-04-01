unmap <leader>cT

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=d
set guifont=Cascadia\ Mono\ 13

set background=dark
colorscheme solarized

" ------------ statusline ---------- "
hi User1 gui=bold guifg=#AFFF5F guibg=#080808
hi User2 gui=bold,reverse guifg=red guibg=yellow
hi User3 gui=bold,reverse guifg=#AFAFAF guibg=#080808
hi User4 gui=bold,reverse guifg=#87FFFF guibg=#080808
hi User5 gui=bold,italic,reverse guifg=#5F8787 guibg=#B0B585

set statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %p%%\ %v:%l/%L%)
augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%4*\ %{ChangeStatuslineColor()}\ %*%1*\ %<%F\ %*%2*%m%h%r%*%)\ %=\ %(%5*%y%*%3*\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %*%4*\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%F\ %*%2*%m%*%h%r%)\ %=\ %(%y\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %p%%\ %v:%l/%L%)
augroup end
" ------------ statusline ---------- "

augroup jsj_color_warning
  autocmd!
  highlight Todo gui=bold,italic guifg=#e5b07b guibg=#D70000
  highlight Debug gui=bold,italic guifg=#e5b07b guibg=#262626
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|???!!!\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END
