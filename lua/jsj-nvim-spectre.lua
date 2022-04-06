local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>rr', function() require('spectre').open() end, opts)
map('n', '<leader>rw', function() require('spectre').open_visual({select_word=true}) end, opts)
map('n', '<leader>rl', function() require('spectre').open_file_search() end, opts)
map('v', '<leader>r', function() require('spectre').open_visual() end, opts)
