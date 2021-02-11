" =======
" vim bookmark
" =======
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = $HOME.'/.cache/.vim-bookmarks'
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '⚑'
let g:bookmark_highlight_lines = 1
nmap <leader>mm <Plug>BookmarkToggle
nmap <leader>mn <Plug>BookmarkNext
nmap <leader>mp <Plug>BookmarkPrev
nmap <leader>ma <Plug>BookmarkShowAll
nmap <leader>mc <Plug>BookmarkClear
nmap <leader>mC <Plug>BookmarkClearAll
