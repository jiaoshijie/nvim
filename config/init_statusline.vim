" ------------ statusline ---------- "
" https://gabri.me/blog/diy-vim-statusline
" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
set noshowmode
hi! StatusLine cterm=NONE gui=NONE guifg=#ffffff guibg=#2c323c
hi! StatusLineNC cterm=NONE gui=NONE guibg=#2c323c
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! Jsj_SH_1 cterm=NONE gui=NONE guifg=#282c34 guibg=#98c379
hi! Jsj_SH_2 cterm=NONE gui=NONE guifg=#e5c07b guibg=#2c323c
hi! Jsj_SH_3 cterm=NONE gui=NONE guifg=#e5c07b guibg=#e06c75
hi! Jsj_SH_4 cterm=NONE gui=NONE guifg=#d19a66 guibg=#2c323c

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
