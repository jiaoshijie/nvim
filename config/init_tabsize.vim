" 设置缩进宽度
set shiftwidth=2

" 设置 TAB 宽度
set tabstop=2

" 展开 tab 为空格
set expandtab

" expandtab 展开 tab 为多少字符
set softtabstop=2

set smarttab

" 缩进时取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

augroup jsj_SpecialTab
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END
