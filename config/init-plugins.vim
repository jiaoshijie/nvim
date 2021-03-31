call plug#begin('~/.config/nvim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'

  Plug 'liuchengxu/vim-which-key'
  Plug 'lambdalisue/suda.vim'
  Plug 'mbbill/undotree/'
  " Plug 'kevinhwang91/rnvimr'
  Plug 'rhysd/clever-f.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'vim-airline/vim-airline'
  Plug 'luochen1990/rainbow'
  Plug 'lfv89/vim-interestingwords'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-rooter'

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  " Plug 'Chiel92/vim-autoformat'
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag'
  Plug 'liuchengxu/vista.vim'
  " Plug 'fatih/vim-go'
  Plug 'Shirk/vim-gas'
  Plug 'cespare/vim-toml'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'dkarter/bullets.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'lervag/vimtex'
  Plug 'gcmt/wildfire.vim'

  " sa(add) sd(delete) sr(replace) {text object} {char}
  " Plug 'machakann/vim-sandwich'  " ???!!!: same to vim-surround

  " cs(change) ds(delete) ys(add) {text object} {char}
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  " 基础插件:提供让用户方便的自定义文本对象的接口
  Plug 'kana/vim-textobj-user'
  " 参数文本对象:i,/a, 包括参数或者列表元素 c cpp python
  Plug 'sgur/vim-textobj-parameter'
  " 提供 uri/url 的文本对象，iu/au 表示
  Plug 'jceb/vim-textobj-uri'

  Plug 'ryanoasis/vim-devicons'

call plug#end()
