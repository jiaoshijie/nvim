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
    config = function() require('lsp') end,
    requires = {
      { 'kosayoda/nvim-lightbulb' },
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
    config = function() require("jsj-telescope") end,
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
    config = function() require('jsj-treesitter') end,
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground' },
    },
  }
  -- }}}

  -- {{{ Autocomplete
  use {
    'L3MON4D3/LuaSnip',
    config = function() require('jsj-luasnip') end,
    requires = {
      { 'rafamadriz/friendly-snippets' },
    },
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('jsj-comp') end,
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },

      { 'kdheepak/cmp-latex-symbols' },
      { 'saadparwaiz1/cmp_luasnip' },  -- for L3MON4D3/LuaSnip
      { 'f3fora/cmp-spell' },  -- set spell
      { 'tzachar/cmp-tabnine', run='./install.sh' },
    },
  }
  -- }}}

  -- {{{ Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('jsj-gitsigns') end,
    requires = {
      { 'nvim-lua/plenary.nvim' }
    },
  }
  -- }}}

  -- {{{ Themes and Colors
  use {
    'tjdevries/colorbuddy.nvim',
    config = function() require('init-style') end,
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
    config = function() require('colorizer').setup() end,
  }
  -- }}}

  -- {{{ MapKeys
  use {
    'folke/which-key.nvim',
    config = function() require('jsj-which-key') end,
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
    config = function() require('jsj-nvim-spectre') end,
  }

end)
