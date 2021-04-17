-- https://icyphox.sh/blog/nvim-lua/
-- https://github.com/nanotee/nvim-lua-guide

require('init-basic')
require('init-config')
require('init-tabsize')
require('init-plugins')
require('init-style')
require('init-keymaps')

require('lsp')
require('lsp.bash-lsp')
require('lsp.clangd-lsp')
require('lsp.css-lsp')
require('lsp.html-lsp')
require('lsp.json-lsp')
require('lsp.latex-lsp')
require('lsp.python-lsp')
require('lsp.tsserver-lsp')
require('lsp.lua-lsp')

require('nv-compe')

require('nv-telescope')

require('nv-treesitter')  -- 影响性能的插件，当打开大文件时

require('nv-nvimtree')
require('nv-gitsigns')
require('nv-autopairs')
require('nv-colorizer')
require('nv-comment')
require('nv-galaxyline')

require('nv-markdown-preview')
vim.cmd([[source ~/.config/nvim/vimscript/vim-vsnip.vim]])
vim.cmd([[source ~/.config/nvim/vimscript/vim-md-snippets.vim]])
