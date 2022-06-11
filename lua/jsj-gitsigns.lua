require("gitsigns").setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▶", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "▶", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  watch_gitdir = {
    interval = 1000,
  },
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 500,
    virt_text_pos = "eol",
  },
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil, -- Use default
})

vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { noremap = true, silent = true })
