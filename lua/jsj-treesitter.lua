require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "python", "lua", "go", "rust", "comment" },
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
