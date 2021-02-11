" =======
" vista-config
" =======
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

" =======
" vista-keymaps
" =======
nnoremap <silent> <leader>ct :Vista!!<cr>
nnoremap <silent> <leader>cf :Vista finder<cr>
