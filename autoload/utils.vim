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

function! utils#ChangeStatuslineColor()
  if (mode() =~# '\v(v|V|)')
    exe 'hi! User1 ctermbg=171 guibg=#D75FFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi! User1 ctermbg=75 guibg=#5FAFFF'
    return g:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi! User1 ctermbg=160 guibg=#D70000'
    return g:currentmode[mode()]
  elseif (mode() =~# '\v(c|t)')
    exe 'hi! User1 ctermbg=155 guibg=#AFFF5F'
    return g:currentmode[mode()]
  else
    exe 'hi! User1 ctermbg=155 guibg=#AFFF5F'
  endif
  return "NORMAL"
endfunction

function! utils#Jsj_openFile(dir, targetFile)
  if exists('g:loaded_fzf')
    execute 'FZF ' . a:dir
  else
    execute 'edit ' . a:dir . '/' . a:targetFile
  endif
endfunction

function! utils#Jsj_CheckHlGroup()
  let l:synName = synIDattr(synID(line('.'), col('.'), 0), 'name')
  let l:synHlName = synIDattr(synID(line('.'), col('.'), 1), 'name')
  let l:synTransHlName = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  let l:fg = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'fg')
  let l:bg = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'bg')
  let l:info = printf("synName=`%s`", l:synName)
  if !empty(l:synHlName) || !empty(l:synTransHlName)
    if empty(l:synHlName) || empty(l:synTransHlName) || l:synHlName == l:synTransHlName
      let l:info = printf("%s\nsynHlName=`%s`", l:info, empty(l:synHlName) ? l:synHlName : l:synTransHlName)
    else
      let l:info = printf("%s\nsynHlName=`%s->%s`", l:info, l:synHlName, l:synTransHlName)
    endif
  endif
  if !empty(l:fg)
    let l:info = printf("%s\nfg=`%s`", l:info, l:fg)
  endif
  if !empty(l:bg)
    let l:info = printf("%s\nbg=`%s`", l:info, l:bg)
  endif
  if l:info == "synName=``"
    echohl ErrorMsg
    echo "There is no syntex item."
    echohl None
  else
    echo l:info
  endif
endfunction

function! utils#showFilePath()
  echo expand('%:p')
endfunction
