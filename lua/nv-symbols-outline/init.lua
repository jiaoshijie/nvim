vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  position = 'right',
  keymaps = {
    close = "<Esc>",
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-k>",
    rename_symbol = "r",
    code_actions = "a",
  },
  lsp_blacklist = {},
}

vim.api.nvim_set_keymap('n', '<leader>cT', ':SymbolsOutline<cr>', { noremap = true, silent = true })
