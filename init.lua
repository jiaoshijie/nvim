--             _                                  __ _
--  _ ____   _(_)_ __ ___         ___ ___  _ __  / _(_) __ _
-- | '_ \ \ / / | '_ ` _ \ _____ / __/ _ \| '_ \| |_| |/ _` |
-- | | | \ V /| | | | | | |_____| (_| (_) | | | |  _| | (_| |
-- |_| |_|\_/ |_|_| |_| |_|      \___\___/|_| |_|_| |_|\__, |
--                                                     |___/

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float{ border = "rounded" }
    end
  }
}

packer.startup(function(use)

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
    config = function()
      require('lsp')
      require('lsp.null-ls')
    end,
    requires = {
      { 'jose-elias-alvarez/null-ls.nvim' },
    },
  }
  -- }}}

  -- {{{ Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require("jsj-telescope") end,
    requires = {
      {
        'nvim-lua/plenary.nvim',
        config = function()
          vim.keymap.set('n', '<leader>T', '<Plug>PlenaryTestFile', {noremap=true, silent=true})
        end,
      },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  }
  -- }}}

  -- {{{ Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('jsj-treesitter') end,
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
  }
  -- }}}

  -- {{{ Autocomplete
  use {
    'L3MON4D3/LuaSnip',
    config = function() require('jsj-luasnip') end,
  }
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   config = function() require('jsj-cmp') end,
  --   requires = {
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'hrsh7th/cmp-path' },
  --     { 'hrsh7th/cmp-buffer' },

  --     { 'tzachar/cmp-tabnine', run='./install.sh' },
  --     { 'uga-rosa/cmp-dictionary' },  -- pacman -S words
  --   },
  -- }
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
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
    },
  }
  require('init-style')
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
  }
  -- use {
  --   'rcarriga/nvim-notify',
  --   config = function() require("jsj-notify") end,
  -- }
  -- }}}

  -- {{{ MapKeys
  use {
    'folke/which-key.nvim',
    config = function() require('jsj-which-key') end,
  }
  require('init-keymaps')
  require('init-mdSnippets')
  -- }}}

  use {
    'nvim-pack/nvim-spectre',
    config = function() require('jsj-nvim-spectre') end,
  }

  use {
    'tpope/vim-surround',
    requires = { 'tpope/vim-repeat' },
  }
  use {
    'godlygeek/tabular'
  }

end)
