" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|

" 防止重复加载
if get(s:, 'loaded', 0) != 0
  finish
else
  let s:loaded = 1
endif

if !has('nvim')
  " 取得本文件所在的目录
  let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
  exec 'set rtp+='.s:home
else
  " 将~/.vim 目录加入runtimepath
  set rtp+=~/.vim
endif

runtime! config/init-basic.vim
runtime! config/init-config.vim
runtime! config/init-tabsize.vim
runtime! config/init-style.vim
runtime! config/init-keymaps.vim
runtime! config/init-snippets.vim
