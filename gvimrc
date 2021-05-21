unmap <leader>tt

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=d
set guifont=Hack\ 15

function! Jsj_ChangeGuiFontSize(fontsize)
  let l:lists = split(&guifont, ' ')
  let l:lists[-1] = l:lists[-1] + a:fontsize
  let &guifont = join(l:lists, ' ')
endfunction

nnoremap <silent> <c-s-+> :call Jsj_ChangeGuiFontSize(1)<cr>
nnoremap <silent> <c-s-_> :call Jsj_ChangeGuiFontSize(-1)<cr>
