" =======
" rnvimr-config
" =======
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 50

let g:rnvimr_layout = {
      \ 'relative': 'editor',
      \ 'width': &columns,
      \ 'height': &lines,
      \ 'col': 0,
      \ 'row': 0,
      \ 'style': 'minimal'
      \ }

" Map Rnvimr action
let g:rnvimr_action = {
      \ '<cr>': 'NvimEdit edit',
      \ '<C-t>': 'NvimEdit tabedit',
      \ '<C-x>': 'NvimEdit split',
      \ '<C-v>': 'NvimEdit vsplit',
      \ }

let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}, {'width': 0.8, 'height': 0.8}]

" =======
" rnvimr-keymaps
" =======
nnoremap <silent> <leader>R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 1<CR>
