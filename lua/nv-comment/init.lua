require('nvim_comment').setup{
  comment_empty = false,
  create_mappings = false,
}
vim.api.nvim_buf_set_option("c", "commentstring", "// %s")

vim.api.nvim_set_keymap("n", "<leader>cc", ":CommentToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>cc", ":CommentToggle<CR>", {noremap=true, silent = true})
