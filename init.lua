-- https://github.com/nanotee/nvim-lua-guide

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

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
    config = require("jsj-telescope"),
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },  -- extension
      { 'liuchengxu/vista.vim' },
    },
  }
  -- }}}

  -- {{{ Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = require('jsj-treesitter'),
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground' },
    },
  }
  -- }}}

  -- {{{ Autocomplete
  use {
    'L3MON4D3/LuaSnip',
    config = require('jsj-luasnip'),
    requires = {
      { 'rafamadriz/friendly-snippets' },
    },
  }
  use {
    'hrsh7th/nvim-cmp',
    config = require('jsj-comp'),
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },

      { 'kdheepak/cmp-latex-symbols' },
      { 'saadparwaiz1/cmp_luasnip' },  -- for L3MON4D3/LuaSnip
      { 'f3fora/cmp-spell' },  -- set spell
    },
  }
  -- }}}

  -- {{{ Git
  use {
    'lewis6991/gitsigns.nvim',
    config = require('jsj-gitsigns'),
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
    'yamatsum/nvim-nonicons',  -- Need to install `nonicons.ttf` font. https://github.com/yamatsum/nonicons.git
    requires = {'kyazdani42/nvim-web-devicons'},
    opt = true,
  }
  if fn.expand('$TERM') == 'xterm-kitty' then
    vim.cmd 'packadd nvim-nonicons'
  end
  use {
    'norcalli/nvim-colorizer.lua',
    config = require('colorizer').setup()
  }
  -- }}}

  -- {{{ MapKeys
  use {
    'folke/which-key.nvim',
    config = require('jsj-which-key'),
  }
  require('init-keymaps')
  require('init-mdSnippets')
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
    'tpope/vim-surround',
    requires = { 'tpope/vim-repeat' },
  }
  -- }}}

  -- undotree
  use {
    'mbbill/undotree',
  }

  use {
    'windwp/nvim-spectre',
    config = require('jsj-nvim-spectre')
  }

end)
