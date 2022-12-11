-- sudo pacman -S treesitter
local found, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not found then
  return
end

treesitter_configs.setup({
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
