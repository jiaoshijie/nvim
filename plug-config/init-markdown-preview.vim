" =======
" markdown-preview-config
" =======
let g:mkdp_browser = "brave"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0

" =======
" markdown-preview-keymaps
" =======
nnoremap <silent> <leader>pp :MarkdownPreview<cr>
nnoremap <silent> <leader>ps :MarkdownPreviewStop<cr>
