function! JsjGui#Jsj_ChangeGuiFontSize(fontsize)
  let l:lists = split(&guifont, ' ')
  let l:lists[-1] = l:lists[-1] + a:fontsize
  let &guifont = join(l:lists, ' ')
endfunction

