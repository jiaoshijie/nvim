" 设置缩进宽度
set shiftwidth=2

" 设置 TAB 宽度
set tabstop=2

" 展开 tab 为空格
set expandtab

" expandtab 展开 tab 为多少字符
set softtabstop=2


augroup jsj_SpecialTab
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 foldmethod=indent textwidth=78
augroup END
