" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|

if isdirectory('/usr/share/vim/vimfiles')
  set rtp+=/usr/share/vim/vimfiles
endif

runtime! config/init_basic.vim
runtime! config/init_config.vim
runtime! config/init_tabsize.vim
runtime! config/init_style.vim
runtime! config/init_keymaps.vim
runtime! config/init_markdown.vim
runtime! config/init_vim9script.vim
