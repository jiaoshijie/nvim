-- https://icyphox.sh/blog/nvim-lua/
-- https://github.com/nanotee/nvim-lua-guide

require('init-basic')
require('init-config')
require('init-tabsize')
require('init-plugins')
require('init-style')
require('init-keymaps')
require('mdSnippets')

require('lsp')
require('nv-lsp-trouble')
require('nv-telescope')
require('nv-treesitter')

require('lsp.bash-lsp')
require('lsp.clangd-lsp')
require('lsp.css-lsp')
require('lsp.html-lsp')
require('lsp.json-lsp')
require('lsp.latex-lsp')
require('lsp.python-lsp')
require('lsp.tsserver-lsp')
require('lsp.lua-lsp')
require('lsp.vim-lsp')

require('nv-compe')

require('nv-gitsigns')
require('nv-colorizer')
require('nv-galaxyline')
require('nv-which-key')
