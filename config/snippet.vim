" set localleader
let maplocalleader=','

" ---------------- "
" --* markdown *-- "
" ---------------- "
augroup jsj_markdown
  autocmd!
  autocmd FileType markdown inoremap <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType markdown nnoremap <silent> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype markdown iabbrev <buffer> tabb \|<++>\|<++>\|<CR>----<Esc>bywbbpdwkyyjpp4k0
  autocmd Filetype markdown inoremap <buffer> <localleader>m ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$a
  autocmd Filetype markdown inoremap <buffer> <localleader>b **** <++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> <localleader>i ** <++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> <localleader>e ***<CR><CR>
  autocmd Filetype markdown inoremap <buffer> <localleader>p ![](<++>)<Esc>F]i
  autocmd Filetype markdown inoremap <buffer> <localleader>l [](<++>)<Esc>F]i
  autocmd FileType markdown inoremap <buffer> <localleader>1 # <CR><++><Esc>kA
  autocmd FileType markdown inoremap <buffer> <localleader>2 ## <CR><++><Esc>kA
  autocmd FileType markdown inoremap <buffer> <localleader>3 ### <CR><++><Esc>kA
  autocmd FileType markdown inoremap <buffer> <localleader>4 #### <CR><++><Esc>kA
  autocmd FileType markdown inoremap <buffer> <localleader>5 ##### <CR><++><Esc>kA
  autocmd FileType markdown inoremap <buffer> <localleader>6 ###### <CR><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <localleader><CR> <br>
augroup end



" ---------------- "
" ----* HTML *---- "
" ---------------- "
augroup jsj_html
  autocmd!
  autocmd Filetype html inoremap <buffer> <localleader>f <Esc>0f>a
  autocmd Filetype html inoremap <buffer> <localleader><CR> <br>
"   autocmd Filetype html iabbrev <buffer> hhead <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html><ESC>gg,f
"   autocmd Filetype html iabbrev <buffer> ulli <ul><CR><li><++></li><Esc>yypo</ul><CR><++><Esc>4kA
"   autocmd Filetype html iabbrev <buffer> olli <ol><CR><li><++></li><Esc>yypo</ol><CR><++><Esc>4kA
augroup end

augroup jsj_ft_settings
  autocmd!
  autocmd FileType python setlocal foldmethod=indent textwidth=80
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex
  autocmd BufRead,BufNewFile *.S,*.s setlocal filetype=gas
augroup END

" augroup! jsj_strip_wsbl 使用这个可以取消这个组
augroup jsj_strip_wsbl
    autocmd!
    autocmd BufWritePre * call RCStripWSBL()
augroup END

function! RCStripWSBL()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction

augroup jsj_color_warning
    autocmd!
    " autocmd ColorScheme * call matchadd('cTodo', 'TODO')
    autocmd FileType gas call matchadd('cTodo', 'TODO')
augroup END

" 查看高亮组
command! Seecolor echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
            \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
            \ "> fg:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")
