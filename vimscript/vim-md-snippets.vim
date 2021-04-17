"----------------------------------------------------------------------
" markdown代码片段
"----------------------------------------------------------------------

augroup jsj_Markdown
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <silent> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType markdown inoremap <buffer> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype markdown inoremap <buffer> <localleader>m ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$a
  autocmd Filetype markdown inoremap <buffer> <localleader>b ****<++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> <localleader>i **<++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> <localleader>e ***<CR><CR>
  autocmd Filetype markdown inoremap <buffer> <localleader>a $$<left>
  autocmd Filetype markdown inoremap <buffer> <localleader>A $$<CR><CR>$$<ESC>ki
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
  autocmd Filetype markdown inoremap <buffer> <localleader>t2 \|<++>\|<++>\|<cr>\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
  autocmd Filetype markdown inoremap <buffer> <localleader>t3 \|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
  autocmd Filetype markdown inoremap <buffer> <localleader>t4 \|<++>\|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
augroup end
