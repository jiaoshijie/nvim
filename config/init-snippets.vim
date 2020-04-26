"----------------------------------------------------------------------
" markdown代码片段
"----------------------------------------------------------------------

augroup jsj_Markdown
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <silent> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType markdown inoremap <buffer> <silent> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype markdown iabbrev <buffer> tabb \|<++>\|<++>\|<CR>----<Esc>bywbbpdwkyyjpp4k0
  autocmd Filetype markdown inoremap <buffer> <localleader>m ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$a
  autocmd Filetype markdown inoremap <buffer> <localleader>b ****<++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> <localleader>i **<++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> <localleader>e ***<CR><CR>
  autocmd Filetype markdown inoremap <buffer> <localleader>p ![](<++>)<Esc>F]i
  autocmd Filetype markdown inoremap <buffer> <localleader>l [](<++>)<Esc>F]i
  autocmd FileType markdown inoremap <buffer> <localleader>1 # <CR><CR><++><Esc>2kA
  autocmd FileType markdown inoremap <buffer> <localleader>2 ## <CR><CR><++><Esc>2kA
  autocmd FileType markdown inoremap <buffer> <localleader>3 ### <CR><CR><++><Esc>2kA
  autocmd FileType markdown inoremap <buffer> <localleader>4 #### <CR><CR><++><Esc>2kA
  autocmd FileType markdown inoremap <buffer> <localleader>5 ##### <CR><CR><++><Esc>2kA
  autocmd FileType markdown inoremap <buffer> <localleader>6 ###### <CR><CR><++><Esc>2kA
  autocmd Filetype markdown inoremap <buffer> <localleader>, <br>
  autocmd Filetype markdown inoremap <buffer> <localleader>z <font color=><++></font><Esc>F>;i
augroup end

"----------------------------------------------------------------------
" HTML代码片段
"----------------------------------------------------------------------

augroup jsj_HTML
  autocmd!
  autocmd Filetype html iabbrev <buffer> hheadd <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html><ESC>ggi,f
  autocmd FileType html inoremap <buffer> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType html inoremap <buffer> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype html inoremap <buffer> <localleader>, <br>
  autocmd Filetype html inoremap <buffer> <localleader>l <li><++></li><Esc>0f>
augroup end
