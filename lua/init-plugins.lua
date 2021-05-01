return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use 'p00f/nvim-ts-rainbow'
  use "windwp/nvim-ts-autotag"

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

  use 'lewis6991/gitsigns.nvim'  -- requires = 'nvim-lua/plenary.nvim'
  use 'terrortylor/nvim-comment'
  use 'norcalli/nvim-colorizer.lua'
  use 'kevinhwang91/nvim-bqf'  -- quickfix list

  use 'folke/which-key.nvim'

  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Color
  use 'tjdevries/colorbuddy.nvim'
  use 'glepnir/galaxyline.nvim'

end)
