-- https://github.com/nanotee/nvim-lua-guide

require('packer').startup(function(use)

  -- {{{ Installer
  use { 'wbthomason/packer.nvim' }
  -- }}}

  -- {{{ basic configs
  require('init-basic')
  require('init-config')
  require('init-tabsize')
  -- }}}

  -- {{{ Lsp
  use {
    'neovim/nvim-lspconfig',
    config = require('lsp'),
    requires = {
      { 'glepnir/lspsaga.nvim' },
      { 'folke/lua-dev.nvim' },
    },
  }
  require('lsp.bash-lsp')
  require('lsp.clangd-lsp')
  require('lsp.css-lsp')
  require('lsp.html-lsp')
  require('lsp.json-lsp')
  require('lsp.tsserver-lsp')
  require('lsp.latex-lsp')
  require('lsp.python-lsp')
  require('lsp.lua-lsp')
  require('lsp.vim-lsp')
  require('lsp.go-lsp')
  -- }}}

  -- {{{ Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = require("nv-telescope"),
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },  -- extension
    },
  }
  -- }}}

  -- {{{ Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = require('nv-treesitter'),
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground' },
    },
  }
  -- }}}

  -- {{{ Autocomplete
  use {
    'hrsh7th/nvim-compe',
    config = require('nv-compe'),
  }
  -- }}}

  -- {{{ Git
  use {
    'lewis6991/gitsigns.nvim',
    config = require('nv-gitsigns'),
    requires = {
      { 'nvim-lua/plenary.nvim' }
    },
  }
  -- }}}

  -- {{{ Themes and Colors
  use {
    'tjdevries/colorbuddy.nvim',
    config = require('init-style'),
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
    },
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = require('colorizer').setup()
  }
  -- }}}

  -- {{{ MapKeys
  use {
    'folke/which-key.nvim',
    config = require('nv-which-key'),
  }
  require('init-keymaps')
  require('mdSnippets')
  -- }}}

  -- {{{ Markdown
  use {
    'npxbr/glow.nvim',  -- `paru -S glow-bin`
  }
  use {
    'godlygeek/tabular'
  }
  -- }}}

  -- {{{ TextObject
  use {
    'tpope/vim-surround'
  }
  -- }}}

end)
