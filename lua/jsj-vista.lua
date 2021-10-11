local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>vt', ':Vista!!<cr>', opts)
map('n', '<leader>vn', ':Vista nvim_lsp<cr>', opts)
map('n', '<leader>vl', ':Vista finder<cr>', opts)
map('n', '<leader>vv', ':Vista finder!<cr>', opts)
