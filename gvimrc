set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=d
set guifont=JetBrains\ Mono\ 13
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~

nnoremap <silent> <c-s-+> :call JsjGui#Jsj_ChangeGuiFontSize(1)<cr>
nnoremap <silent> <c-s-_> :call JsjGui#Jsj_ChangeGuiFontSize(-1)<cr>
