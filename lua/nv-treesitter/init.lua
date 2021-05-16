-- sudo pacman -S tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>nn",
      node_incremental = "<leader>nn",
      scope_incremental = "<leader>nc",
      node_decremental = "<leader>N",
    },
  },
  autotag = {
      enable = true,
  },
  -- indent = {
  --   enable = true,
  -- },
}
