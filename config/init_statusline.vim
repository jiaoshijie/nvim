" ------------ statusline ---------- "
" https://gabri.me/blog/diy-vim-statusline
" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
set noshowmode
let g:currentmode={
       \ 'v'      : 'VISUAL',
       \ 'V'      : 'V·Line',
       \ "\<C-V>" : 'V·Block',
       \ 'i'      : 'INSERT',
       \ 'R'      : 'REPLACE',
       \ 't'      : 'TERMINAL',
       \ 'c'      : 'COMMAND',
       \}

hi StatusLine guifg=#2C323C guibg=#5C6370
hi StatusLineNC guifg=#ABB2BF guibg=#2C323C
hi StatusLineTerm guibg=#5C6370
hi StatusLineTermNC guifg=#ABB2BF guibg=#2C323C
hi! User1 gui=bold guifg=#080808 guibg=#AFFF5F
hi! User2 gui=italic guifg=#FF8800 guibg=#2C323C
hi! User3 gui=bold guifg=yellow guibg=red
hi! User4 gui=bold guifg=#B0B585 guibg=#2C323C
hi! User5 gui=bold guifg=#AFAFAF guibg=#2C323C

set statusline=%(%<%f\ %*%3*%m%*%h%r%)\ %=\ %(%v:%l/%L%)
setlocal statusline=%(%1*\ %{utils#ChangeStatuslineColor()}
        \\ %*%2*\ %<%t\ %*%3*%m%h%r%*%)\ %=\ %(%4*%{&ft}%*%5*\ %{&fenc?&fenc:&enc}\[%{&ff}\]
        \\ %*%1*\ %p%%\ %v:%l/%L\ %*%)
augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%1*\ %{utils#ChangeStatuslineColor()}
        \\ %*%2*\ %<%t\ %*%3*%m%h%r%*%)\ %=\ %(%4*%{&ft}%*%5*\ %{&fenc?&fenc:&enc}\[%{&ff}\]
        \\ %*%1*\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%f\ %*%3*%m%*%h%r%)\ %=\ %(%v:%l/%L%)
augroup end
