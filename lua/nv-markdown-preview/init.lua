vim.g.mkdp_browser = "vimb"
-- vim.g.mkdp_browser = "brave"
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0

vim.api.nvim_set_keymap('n', '<leader>pp', ':MarkdownPreview<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':MarkdownPreviewStop<cr>', { noremap = true, silent = true })
