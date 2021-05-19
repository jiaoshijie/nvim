-- https://icyphox.sh/blog/nvim-lua/
-- https://github.com/nanotee/nvim-lua-guide

require('init-basic')
require('init-config')
require('init-tabsize')
require('init-plugins')
require('init-style')
require('init-keymaps')

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

require('nv-compe')

require('nv-gitsigns')
require('nv-colorizer')
require('nv-galaxyline')

vim.cmd([[source ~/.config/nvim/vimscript/vsnip.vim]])
vim.cmd([[source ~/.config/nvim/vimscript/mdSnippets.vim]])
vim.cmd([[source ~/.config/nvim/vimscript/sCommenter.vim]])
require('nv-which-key')
