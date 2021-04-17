-- lua << EOF
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use 'p00f/nvim-ts-rainbow'
  use "windwp/nvim-ts-autotag"

  -- Eplorer
  use 'kyazdani42/nvim-tree.lua'

  use 'lewis6991/gitsigns.nvim'  -- requires = 'nvim-lua/plenary.nvim'
  use 'terrortylor/nvim-comment'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'  -- quickfix list

  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
  use 'lambdalisue/suda.vim'
  use 'godlygeek/tabular'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Color
  use 'tjdevries/colorbuddy.nvim'
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

end)
