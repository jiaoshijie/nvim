-- sudo pacman -S tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {"c", "cpp", "python", "lua", "go"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      -- scope_incremental = "<C-m>",
      node_decremental = "<C-p>",
    },
  },
  indent = {
    enable = false,
    -- disable = {'yaml'},
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
