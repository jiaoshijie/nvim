" ------------ statusline ---------- "
" https://gabri.me/blog/diy-vim-statusline
" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
set noshowmode
" hi! link StatusLine NONE
" hi! link StatusLineNC NONE
hi! StatusLine cterm=NONE gui=NONE guifg=#FFFFFF guibg=#2C323C
hi! StatusLineNC cterm=NONE gui=NONE guifg=#ABB2BF guibg=#2C323C
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! Jsj_SH_1 cterm=NONE gui=bold guifg=#080808 guibg=#AFFF5F
hi! Jsj_SH_2 cterm=NONE gui=italic guifg=#FF8800 guibg=#2C323C
hi! Jsj_SH_3 cterm=NONE gui=bold guifg=yellow guibg=red
hi! Jsj_SH_4 cterm=NONE gui=bold guifg=#B0B585 guibg=#2C323C

set statusline=%(%<%f\ %*%#Jsj_SH_3#%m%*%h%r%)\ %=\ %(%v:%l/%L%)
setlocal statusline=%(%#Jsj_SH_1#\ %{utils#ChangeStatuslineColor()}
        \\ %*%#Jsj_SH_2#\ %<%t\ %*%#Jsj_SH_3#%m%h%r%*%)\ %=
        \\ %(%{&ft}%#Jsj_SH_4#\ %{&fenc?&fenc:&enc}\[%{&ff}\]
        \\ %*%#Jsj_SH_1#\ %p%%\ %v:%l/%L\ %*%)
augroup jsj_Statusline
  autocmd!
  autocmd BufEnter,WinEnter * :setlocal statusline=%(%#Jsj_SH_1#\ %{utils#ChangeStatuslineColor()}
        \\ %*%#Jsj_SH_2#\ %<%t\ %*%#Jsj_SH_3#%m%h%r%*%)\ %=
        \\ %(%{&ft}%#Jsj_SH_4#\ %{&fenc?&fenc:&enc}\[%{&ff}\]
        \\ %*%#Jsj_SH_1#\ %p%%\ %v:%l/%L\ %*%)
  autocmd WinLeave * :setlocal statusline=%(%<%f\ %*%#Jsj_SH_3#%m%*%h%r%)\ %=\ %(%v:%l/%L%)
augroup end
