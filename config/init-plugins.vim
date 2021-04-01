call plug#begin('~/.config/nvim/plugged')

  " Plug 'gruvbox-community/gruvbox'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'luochen1990/rainbow'
  " Plug 'Yggdroot/indentLine'

  Plug 'liuchengxu/vim-which-key'
  Plug 'lambdalisue/suda.vim'

  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'easymotion/vim-easymotion'
  Plug 'lfv89/vim-interestingwords'
  Plug 'mbbill/undotree/'
  Plug 'rhysd/clever-f.vim'
  Plug 'MattesGroeger/vim-bookmarks'
  " Plug 'kevinhwang91/rnvimr'

  Plug 'gcmt/wildfire.vim'
  Plug 'tpope/vim-surround'  " cs(change) ds(delete) ys(add) {text object} {char}

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'vimwiki/vimwiki'
  Plug 'lervag/vimtex'
  Plug 'tpope/vim-fugitive'
  " Plug 'fatih/vim-go'

  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag'
  Plug 'liuchengxu/vista.vim'
  " Plug 'dkarter/bullets.vim'

  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'cespare/vim-toml'
  Plug 'Shirk/vim-gas'

  Plug 'ryanoasis/vim-devicons'

call plug#end()
