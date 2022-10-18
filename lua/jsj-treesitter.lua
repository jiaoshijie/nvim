-- sudo pacman -S treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "comment", "cpp", "go", "python", "rust", "toml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-m>",
      node_decremental = "<C-p>",
    },
  },
  indent = {
    enable = false,
  },
})
