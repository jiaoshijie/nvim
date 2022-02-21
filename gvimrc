unmap <leader>tt

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=d
set guifont=Cascadia\ Code\ 13
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~

colorscheme peachpuff

nnoremap <silent> <c-s-+> :call JsjGui#Jsj_ChangeGuiFontSize(1)<cr>
nnoremap <silent> <c-s-_> :call JsjGui#Jsj_ChangeGuiFontSize(-1)<cr>
