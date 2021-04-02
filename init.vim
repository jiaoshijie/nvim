"  ___ _   _ ___ _______     _____ __  __
" |_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
"  | ||  \| || |  | |  \ \ / / | || |\/| |
"  | || |\  || |  | |_  \ V /  | || |  | |
" |___|_| \_|___| |_(_)  \_/  |___|_|  |_|


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

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

runtime! config/init-basic.vim
runtime! config/init-config.vim
runtime! config/init-tabsize.vim  " configure tabsize
runtime! config/init-plugins.vim
runtime! config/init-style.vim
runtime! config/init-keymaps.vim
runtime! config/init-snippets.vim


"----------------------------------------------------------------------
" plug config
"----------------------------------------------------------------------
runtime! plug-config/init-vim-which-key.vim
runtime! plug-config/init-coc-list.vim
runtime! plug-config/init-coc-config.vim
" runtime! plug-config/init-bullets.vim
runtime! plug-config/init-clever-f.vim
runtime! plug-config/init-fzf.vim
runtime! plug-config/init-markdown-preview.vim
runtime! plug-config/init-nerdcommenter.vim
runtime! plug-config/init-rainbow.vim
" runtime! plug-config/init-rnvimr.vim
runtime! plug-config/init-undotree.vim
runtime! plug-config/init-vim-airline.vim
runtime! plug-config/init-vim-bookmarks.vim
runtime! plug-config/init-vim-closetag.vim
runtime! plug-config/init-vim-easymotion.vim
" runtime! plug-config/init-vim-indentLine.vim
runtime! plug-config/init-vim-interestingwords.vim
runtime! plug-config/init-vim-markdown-toc.vim
runtime! plug-config/init-vimtex.vim
runtime! plug-config/init-vimwiki.vim
runtime! plug-config/init-vista.vim
runtime! plug-config/init-wildfire.vim
" runtime! plug-config/init-vim-rooter.vim
runtime! plug-config/init-suda.vim
