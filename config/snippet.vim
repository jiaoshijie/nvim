" set localleader
let maplocalleader=','

" ---------------- "
" --* markdown *-- "
" ---------------- "
augroup jsj_markdown
  autocmd!
  autocmd FileType markdown inoremap <buffer> <silent> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType markdown nnoremap <buffer> <silent> <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
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
augroup end



" ---------------- "
" ----* HTML *---- "
" ---------------- "
augroup jsj_html
  autocmd!
  autocmd Filetype html iabbrev <buffer> hheadd <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html><ESC>ggi,f
  autocmd Filetype html nnoremap <buffer> <localleader>f 0f>
  autocmd FileType html inoremap <buffer> <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype html inoremap <buffer> <localleader>, <br>
  autocmd Filetype html inoremap <buffer> <localleader>l <li><++></li><Esc>0f>
augroup end

augroup jsj_ft_settings
  autocmd!
  autocmd FileType python setlocal foldmethod=indent textwidth=80
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex
  autocmd BufRead,BufNewFile *.S,*.s setlocal filetype=gas
  " Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
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


" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
