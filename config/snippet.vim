" augroup filetype_c 自动组命令会导致语法高亮出错
" augroup END
" 使用if-endif 来解决重复导入的问题

" set localleader
let maplocalleader=','
" autocmd FileType c,cpp,markdown,html,css nnoremap <localleader>f /<++><cr>:nohlsearch<cr>"_c4l

" ---------------- "
" --* markdown *-- "
" ---------------- "
if !exists("jiaoshijie_markdown")
  let jiaoshijie_markdown = 1
  autocmd FileType markdown inoremap <localleader>f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
  autocmd FileType markdown nnoremap <localleader>f /<++><cr>:nohlsearch<cr>"_c4l
  autocmd Filetype markdown iabbrev <buffer> tabb \|<++>\|<++>\|<CR>----<Esc>byw0pdwkyyjpp4k0
  autocmd Filetype markdown inoremap <buffer> <localleader>m ```{}<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$i
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
endif



" ---------------- "
" ----* HTML *---- "
" ---------------- "
if !exists("jiaoshijie_html")
  let jiaoshijie_html = 1
  autocmd Filetype html inoremap <buffer> <localleader>f <Esc>0f>a
  autocmd Filetype html inoremap <buffer> <localleader><CR> <br>
  " autocmd Filetype html inoremap <buffer> <localleader>1 <h1></h1><Esc>0f>a
  " autocmd Filetype html inoremap <buffer> <localleader>2 <h2></h2><Esc>0f>a
  " autocmd Filetype html inoremap <buffer> <localleader>3 <h3></h3><Esc>0f>a
  " autocmd Filetype html inoremap <buffer> <localleader>4 <h4></h4><Esc>0f>a
  " autocmd Filetype html inoremap <buffer> <localleader>5 <h5></h5><Esc>0f>a
  " autocmd Filetype html inoremap <buffer> <localleader>6 <h6></h6><Esc>0f>a
"   autocmd Filetype html iabbrev <buffer> hhead <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html><ESC>gg,f
"   autocmd Filetype html iabbrev <buffer> ulli <ul><CR><li><++></li><Esc>yypo</ul><CR><++><Esc>4kA
"   autocmd Filetype html iabbrev <buffer> olli <ol><CR><li><++></li><Esc>yypo</ol><CR><++><Esc>4kA
"   autocmd Filetype html iabbrev <buffer> stylee <style><CR></style><Esc>ko
"   autocmd Filetype html iabbrev <buffer> linksy <link rel="stylesheet" href=""><Esc>F"i
"   autocmd Filetype html inoremap <buffer> <localleader>t <title></title><Esc>0f>a
"   autocmd Filetype html inoremap <buffer> <localleader>c <p></p><Esc>0f>a
"   autocmd Filetype html inoremap <buffer> <localleader>b <strong></strong><++><Esc>F/hi
"   autocmd Filetype html inoremap <buffer> <localleader>i <em></em><++><Esc>F/hi
"   autocmd Filetype html inoremap <buffer> <localleader>d <button></button><++><Esc>F/hi
  " autocmd Filetype html inoremap <buffer> <localleader>l <a href=""><++></a><Esc>F"i
"   autocmd Filetype html inoremap <buffer> <localleader>p <img src="" alt="<++>"><Esc>0f"a
"   autocmd Filetype html inoremap <buffer> <localleader>s <script src=""></script><Esc>0f"a
"   " header section footer nav figure(figcaption) div
endif


" ---------------- "
" -----* CSS *---- "
" ---------------- "
" if !exists("jiaoshijie_css")
"   let jiaoshijie_css = 1
"   autocmd Filetype css iabbrev <buffer> mediaa @media screen and () {<CR><++><CR>}<Esc>2k0f(a
" endif


" ---------------- "
" -----* c *------ "
" ---------------- "
" if !exists("jiaoshijie_c")
"   let jiaoshijie_c = 1
"   autocmd FileType c inoremap <buffer> #ins #include <><Left>
"   autocmd FileType c inoremap <buffer> #inl #include ""<Left>
"   autocmd FileType c inoremap <buffer> #de #define 
"   autocmd FileType c iabbrev <buffer> iff if()<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   autocmd FileType c iabbrev <buffer> forr for(;<++>;<++>)<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   autocmd FileType c iabbrev <buffer> whilee while()<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   " autocmd FileType c iabbrev <buffer> funn (<++>)<cr>{<cr><tab><++><cr>}<esc>3k0f(i
" endif


" ---------------- "
" --* cplusplus *- "
" ---------------- "
" if !exists("jiaoshijie_cpp")
"   let jiaoshijie_cpp = 1
"   autocmd FileType cpp inoremap <buffer> #ins #include <><Left>
"   autocmd FileType cpp inoremap <buffer> #inl #include ""<Left>
"   autocmd FileType cpp inoremap <buffer> #de #define 
"   autocmd FileType cpp iabbrev <buffer> iff if()<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   autocmd FileType cpp iabbrev <buffer> forr for(;<++>;<++>)<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   autocmd FileType cpp iabbrev <buffer> whilee while()<cr>{<cr><tab><++><cr>}<esc>3k0f(a
"   " autocmd FileType cpp iabbrev <buffer> funn (<++>)<cr>{<cr><tab><++><cr>}<esc>3k0f(i
" endif
