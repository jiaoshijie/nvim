function! utils#warn(message)
  echohl WarningMsg
  echom a:message
  echohl NONE
  return 0
endfunction

function! utils#error(message)
  echohl ErrorMsg
  echom a:message
  echohl NONE
  return 0
endfunction

function! utils#Keep_theme_alpha()
  " NOTICE: 51 is the Normal group synID
  let g:jsj_normalbg = synIDattr(51, "bg", "gui")
  if g:jsj_change_theme_alpha == 1
    highlight Normal guibg=NONE ctermbg=NONE
  endif
endfunction

function! utils#Change_theme_alpha()
  if g:jsj_change_theme_alpha == 0
    let g:jsj_change_theme_alpha = 1
    let g:jsj_normalbg = synIDattr(51, "bg", "gui")
    highlight Normal guibg=NONE ctermbg=NONE
  else
    let g:jsj_change_theme_alpha = 0
    execute "highlight Normal guibg=" g:jsj_normalbg
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
    exe 'hi! Jsj_SH_1 guibg=#c678dd'
    return s:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi! Jsj_SH_1 guibg=#61afef'
    return s:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi! Jsj_SH_1 guibg=#e06c75'
    return s:currentmode[mode()]
  elseif (mode() =~# '\v(c|t)')
    exe 'hi! Jsj_SH_1 guibg=#98c379'
    return s:currentmode[mode()]
  else
    exe 'hi! Jsj_SH_1 guibg=#98c379'
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
