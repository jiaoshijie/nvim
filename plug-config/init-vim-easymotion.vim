" =======
" vim-easymotion
" =======

" map <leader> <Plug>(easymotion-prefix)
" <leader>ss{char} to move to {char}
map  <Leader>ss <Plug>(easymotion-bd-f)
nmap <Leader>ss <Plug>(easymotion-overwin-f)

" <leader>S{char}{char} to move to {char}{char}
nmap <leader>S <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>sl <Plug>(easymotion-bd-jk)
nmap <Leader>sl <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>sw <Plug>(easymotion-bd-w)
nmap <Leader>sw <Plug>(easymotion-overwin-w)
