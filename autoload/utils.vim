function! utils#warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction

function! utils#error(message)
  echohl ErrorMsg
  echom a:message
  echohl None
  return 0
endfunction


let s:jsj_change_theme_alpha = 0
function! utils#Change_theme_alpha()
  if s:jsj_change_theme_alpha == 0
    let s:jsj_change_theme_alpha = 1
    highlight Normal guibg=NONE ctermbg=None
  else
    let s:jsj_change_theme_alpha = 0
    if g:colors_name == "gruvbox"
      if &background == "light"
        highlight Normal guibg=#FFFFFF
      else
        highlight Normal guibg=#1d2021
      endif
    else  " onedark bg color
      highlight Normal guibg=#282C34
    endif
  endif
  hi! link SignColumn LineNr
endfunction

function! utils#JsjClearSE(handle)
    let l = line(".")
    let c = col(".")
    if a:handle == 0
      %s/\s\+$//ge
      %s/\(\n\)\+\%$//ge
    else
      let l:sp = ''
      for i in range(1, &softtabstop, 1)
        let l:sp = l:sp . ' '
      endfor
      execute '%s/\t/' . l:sp . '/ge'
    endif
    call cursor(l, c)
endfunction

let s:currentmode={
      \ 'v'      : 'VISUAL',
      \ 'V'      : 'V·Line',
      \ "\<C-V>" : 'V·Block',
      \ 'i'      : 'INSERT',
      \ 'R'      : 'REPLACE',
      \ 't'      : 'TERMINAL',
      \ 'c'      : 'COMMAND',
      \}
function! utils#Jsj_ToggleList(listname, perfix)
  if empty(filter(getwininfo(), 'v:val.' . a:listname))
    try
      execute a:perfix . 'open'
    catch /E776/
      return utils#error("Location List is Empty.")
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
    exe 'hi! Jsj_SH_1 ctermbg=171 guibg=#D75FFF'
    return s:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi! Jsj_SH_1 ctermbg=75 guibg=#5FAFFF'
    return s:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi! Jsj_SH_1 ctermbg=160 guibg=#D70000'
    return s:currentmode[mode()]
  elseif (mode() =~# '\v(c|t)')
    exe 'hi! Jsj_SH_1 ctermbg=155 guibg=#AFFF5F'
    return s:currentmode[mode()]
  else
    exe 'hi! Jsj_SH_1 ctermbg=155 guibg=#AFFF5F'
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
    return utils#error("There is no syntex item.")
  else
    echo l:info
  endif
endfunction

function! utils#showFilePath()
  echo expand('%:p')
endfunction

function! utils#fzfGit(args)
  if exists('g:loaded_fzf')
    return fzfGit#gitfiles(a:args)
  endif
  return utils#error("`fzf` is not installed!!!")
endfunction
