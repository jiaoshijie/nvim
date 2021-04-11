-- lua << EOF

local my = function(file) require(file) end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tjdevries/colorbuddy.nvim'
  use 'DilanGMB/nightbuddy'
  use 'kyazdani42/nvim-web-devicons'
  use { 'glepnir/galaxyline.nvim', branch = 'main', config = my('nv-galaxyline') }
  use 'romgrk/barbar.nvim'

  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'

  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'

  use 'kyazdani42/nvim-tree.lua'

  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  use 'phaazon/hop.nvim'
  use 'terrortylor/nvim-comment'
  use 'norcalli/nvim-colorizer.lua'

  use 'kevinhwang91/nvim-bqf'  -- quickfix list
  use 'windwp/nvim-autopairs'
  use 'andymass/vim-matchup'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
  use 'godlygeek/tabular'
  use 'MattesGroeger/vim-bookmarks'
  use 'liuchengxu/vista.vim'
  use 'mbbill/undotree'
  use 'lfv89/vim-interestingwords'
  -- use 'metakirby5/codi.vim'  -- interactively with code

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'liuchengxu/vim-which-key'
  use 'airblade/vim-rooter'
  use 'lambdalisue/suda.vim'
  use 'kovetskiy/sxhkd-vim'
  use 'Shirk/vim-gas'
end)
