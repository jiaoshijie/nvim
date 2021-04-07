vim.g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }
vim.g.interestingWordsTermColors = { '154', '121', '211', '137', '214', '222' }
-- vim.g.interestingWordsRandomiseColors = 1
vim.g.interestingWordsDefaultMappings = 0
vim.api.nvim_set_keymap('n', '<leader>k', ":call InterestingWords('n')<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>K', ":call UncolorAllWords()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>k', ":call InterestingWords('v')<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', ":call WordNavigation(1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', ":call WordNavigation(0)<cr>", { noremap = true, silent = true })
