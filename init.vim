"
"  __  __     __     _____ __  __ ____   ____
" |  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | \ \ / / | || |\/| | |_) | |
" | |  | | |_| |\ V /  | || |  | |  _ <| |___
" |_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"         |___/

"----------------------------------------------------------------------
" mkdir ~/.config/nvim/autoload
" git clone https://github.com/junegunn/vim-plug --depth=1
"----------------------------------------------------------------------

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
  " 将 ~/.vim 目录加入 runtimepath
  set rtp+=~/.vim
endif

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
runtime! config/init-basic.vim

" 加载扩展配置
runtime! config/init-config.vim

" 设定 tabsize
runtime! config/init-tabsize.vim

if has('nvim')
  " 插件加载
  runtime! config/init-plugins.vim
  runtime! config/init-whichkey.vim
endif

" 界面样式
runtime! config/init-style.vim

" 自定义按键
runtime! config/init-keymaps.vim

" 代码片段
runtime! config/init-snippets.vim
