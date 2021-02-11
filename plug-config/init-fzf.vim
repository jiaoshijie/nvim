" =======
" fzf-config
" =======
let g:fzf_preview_window = ''
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)
" =======
" fzf-keymaps
" =======
" 搜索当前目录下的文件
nnoremap <silent> <leader>fd :FZF<cr>
nnoremap <silent> <leader>fr :History<cr>
" 搜索目录下文件的内容
nnoremap <silent> <leader>ff :Rg<cr>
" 切换buffer
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>fl :BLines<cr>
nnoremap <silent> <leader>fa :Lines<cr>
nnoremap <silent> <leader>mM :Marks<cr>
" 搜索当前目录下git管理的文件
nnoremap <silent> <leader>fg :GitFiles<cr>
