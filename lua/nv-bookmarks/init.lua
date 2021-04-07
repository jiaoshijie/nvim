vim.g.bookmark_no_default_key_mappings = 1
vim.cmd([[let g:bookmark_auto_save_file = $HOME.'/.cache/.vim-bookmarks']])
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1

vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160 guibg=NONE guifg=#c4221e]])
vim.cmd([[highlight BookmarkLine ctermbg=192 ctermfg=NONE guibg=NONE guifg=#c4221e]])

vim.api.nvim_set_keymap('n', 'mm', '<Plug>BookmarkToggle', { silent = true })
vim.api.nvim_set_keymap('n', 'mn', '<Plug>BookmarkNext', { silent = true })
vim.api.nvim_set_keymap('n', 'mp', '<Plug>BookmarkPrev', { silent = true })
vim.api.nvim_set_keymap('n', 'ma', '<Plug>BookmarkShowAll', { silent = true })
vim.api.nvim_set_keymap('n', 'mc', '<Plug>BookmarkClear', { silent = true })
vim.api.nvim_set_keymap('n', 'mC', '<Plug>BookmarkClearAll', { silent = true })
