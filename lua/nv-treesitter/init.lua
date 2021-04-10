-- sudo pacman -S tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gnn",
  --     node_incremental = "grn",
  --     scope_incremental = "grc",
  --     node_decremental = "grm",
  --   },
  -- },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
  -- matchup = {
  --   enable = true,
  -- },
  -- indent = {
  --   enable = false,
  -- },
  -- vim.api.nvim_exec([[
  --   set foldmethod=expr
  --   set foldexpr=nvim_treesitter#foldexpr()
  -- ]], false)

  -- autotag = {
    --   enable = true,
    -- },
}
