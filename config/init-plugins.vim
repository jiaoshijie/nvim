if !exists('g:bundle_group')
  let g:bundle_group = ['basic', 'coc', 'code', 'markdown']
  let g:bundle_group += ['latex', 'textobj']
endif

call plug#begin('~/.config/nvim/plugged')

  if index(g:bundle_group, 'basic') >= 0

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

  endif

  if index(g:bundle_group, 'coc') >= 0

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'jackguo380/vim-lsp-cxx-highlight'

  endif

  if index(g:bundle_group, 'code') >= 0

    " Plug 'Chiel92/vim-autoformat'
    Plug 'preservim/nerdcommenter'

    Plug 'alvan/vim-closetag'

    Plug 'liuchengxu/vista.vim'

    " Plug 'fatih/vim-go'

    Plug 'Shirk/vim-gas'
    Plug 'cespare/vim-toml'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'kovetskiy/sxhkd-vim'

  endif

  if index(g:bundle_group, 'markdown') >= 0

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'dkarter/bullets.vim'
    Plug 'vimwiki/vimwiki'

  endif

  if index(g:bundle_group, 'latex') >= 0

    Plug 'lervag/vimtex'

  endif

  if index(g:bundle_group, 'textobj') >= 0

    Plug 'gcmt/wildfire.vim'

    " saiw( --- snadwich add inner word (); for example: foo saiw( -> (foo)
    " add delete replace
    " sa sd sr {text object} {char}
    " Plug 'machakann/vim-sandwich'  " CHANGED: same to vim-surround

    " cs ds ys {text object} {char}
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    " 基础插件:提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'
    " 参数文本对象:i,/a, 包括参数或者列表元素 c cpp python
    Plug 'sgur/vim-textobj-parameter'
    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'

  endif

  Plug 'ryanoasis/vim-devicons'
call plug#end()
