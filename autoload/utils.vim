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
  let g:jsj_normalbg = synIDattr(hlID('Normal'), "bg", "gui")
  if g:jsj_change_theme_alpha == 1 && !has('gui_running')
    highlight Normal guibg=NONE ctermbg=NONE
  endif
endfunction

function! utils#Change_theme_alpha()
  if has('gui_running')
    call utils#warn("Gvim is not supported")
    return
  endif
  if g:jsj_change_theme_alpha == 0
    let g:jsj_change_theme_alpha = 1
    let g:jsj_normalbg = synIDattr(hlID('Normal'), "bg", "gui")
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
    exe 'hi Statusline_mode guibg=#c678dd'
    return s:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi Statusline_mode guibg=#61afef'
    return s:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi Statusline_mode guibg=#e06c75'
    return s:currentmode[mode()]
  elseif (mode() =~# '\v(c|t)')
    exe 'hi Statusline_mode guibg=#98c379'
    return s:currentmode[mode()]
  else
    exe 'hi Statusline_mode guibg=#98c379'
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

" https://www.oasys.net/posts/writing-a-vim-syntax-plugin/
function! utils#Jsj_CheckHlGroup()
  let l:synid = synID(line('.'), col('.'), 1)
  let l:synname = [ synIDattr(l:synid, 'name') ]
  while 1
    let l:synid = synIDtrans(l:synid)
    let l:temp = synIDattr(l:synid, 'name')
    if synname[-1] ==# l:temp
      break
    endif
    let l:synname = add(l:synname, l:temp)
  endwhile
  echo l:synname
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

" copy register 0 content to system clipboard for X11 if doesn't have clipboard support
function! utils#write2clipboard()
  if executable('xsel')
    let l:command = "xsel -ib"
  elseif executable('xclip')
    let l:command = "xclip"
  else
    call utils#error("no X11 clipboard program(xsel or xclip) available!!!")
    return
  endif
  call system(l:command, @0)
endfunction
