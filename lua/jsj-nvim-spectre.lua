local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>rr', ":lua require('spectre').open()<CR>", opts)
map('n', '<leader>rw', ":lua require('spectre').open_visual({select_word=true})<CR>", opts)
map('n', '<leader>rl', ":lua require('spectre').open_file_search()<cr>", opts)
map('v', '<leader>r', ":lua require('spectre').open_visual()<CR>", opts)
