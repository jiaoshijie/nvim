" let g:markdown_fenced_languages=['c', 'cpp']

setlocal conceallevel=1
setlocal concealcursor=

nnoremap <buffer> <silent> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
inoremap <buffer> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
inoremap <buffer> <localleader>m ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$a
inoremap <buffer> <localleader>b ****<++><Esc>F*hi
inoremap <buffer> <localleader>i **<++><Esc>F*i
inoremap <buffer> <localleader>e ***<CR><CR>
inoremap <buffer> <localleader>a $$<left>
inoremap <buffer> <localleader>A $$<CR><CR>$$<ESC>ki
inoremap <buffer> <localleader>p ![](<++>)<Esc>F]i
inoremap <buffer> <localleader>l [](<++>)<Esc>F]i
inoremap <buffer> <localleader>1 # <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>2 ## <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>3 ### <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>4 #### <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>5 ##### <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>6 ###### <CR><CR><++><Esc>2kA
inoremap <buffer> <localleader>, <br>
inoremap <buffer> <localleader>z <font color=><++></font><Esc>F>;i
inoremap <buffer> <localleader>t2 \|<++>\|<++>\|<cr>\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
inoremap <buffer> <localleader>t3 \|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
inoremap <buffer> <localleader>t4 \|<++>\|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>
