-- sudo pacman -S tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'cpp', 'bash', 'css',
    'html', 'latex', 'toml', 'typescript', 'lua',
    'json', 'yaml', 'regex', 'python', 'javascript',
    'go', 'c' },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
  -- autotag = {
  --   enable = true,
  -- },
}
