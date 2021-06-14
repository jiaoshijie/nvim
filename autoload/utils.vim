function! utils#Change_theme_alpha()
  if g:jsj_change_theme_alpha == 0
    let g:jsj_change_theme_alpha = 1
    highlight Normal guibg=NONE ctermbg=None
  else
    let g:jsj_change_theme_alpha = 0
    highlight Normal guibg=#282C34 ctermbg=235
  endif
  hi! link SignColumn LineNr
endfunction

function! utils#JsjClearSE()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction

let g:FoldMethod = 0
fun! utils#ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

function! utils#Jsj_ToggleList(listname, perfix)
  if empty(filter(getwininfo(), 'v:val.' . a:listname))
    try
      execute a:perfix . 'open'
    catch /E776/
        echohl ErrorMsg
        echo "Location List is Empty."
        echohl None
        return
    endtry
  else
    execute a:perfix . 'close'
  endif
endfunction

function! utils#Fcitx2en()
   if system("fcitx5-remote") == 2
      let l:a = system("fcitx5-remote -c")
   endif
endfunction
