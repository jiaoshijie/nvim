return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'folke/trouble.nvim'
  use 'folke/lua-dev.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

  use 'lewis6991/gitsigns.nvim'  -- requires = 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use 'folke/which-key.nvim'
  use 'npxbr/glow.nvim'  -- `paru -S glow-bin` simple markdown preview in terminal

  -- Color
  use 'tjdevries/colorbuddy.nvim'
  use 'glepnir/galaxyline.nvim'
end)
