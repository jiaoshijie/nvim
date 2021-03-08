if !exists('g:bundle_group')
  let g:bundle_group = ['basic', 'coc', 'code', 'markdown']
  let g:bundle_group += ['latex', 'textobj']
endif

call plug#begin('~/.config/nvim/plugged')

  if index(g:bundle_group, 'basic') >= 0

    " ----- * which key * ----- "
    Plug 'liuchengxu/vim-which-key'
    Plug 'lambdalisue/suda.vim'
    " ----- * undotree * ----- "
    Plug 'mbbill/undotree/'
    " ----- * 调用ranger文件管理器 * ----- "
    " Plug 'kevinhwang91/rnvimr'
    " ----- * move * ----- "
    Plug 'rhysd/clever-f.vim'
    Plug 'easymotion/vim-easymotion'
    " ----- * vim bookmark * ----- "
    Plug 'MattesGroeger/vim-bookmarks'
    " ----- * 2款主题 * ----- "
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    " ----- * 状态栏 * ----- "
    Plug 'vim-airline/vim-airline'
    " ----- * 彩虹括号 * ----- "
    Plug 'luochen1990/rainbow'
    " ----- * 高亮感兴趣的单词 * ----- "
    Plug 'lfv89/vim-interestingwords'
    " ----- * 显示缩进线 * ----- "
    Plug 'Yggdroot/indentLine'
    " ----- * 快速搜索 * ----- "
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'

  endif

  if index(g:bundle_group, 'coc') >= 0

    " ----- * coc * ----- "
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " ----- * c cpp 语法语义 coc-clangd需要 * ----- "
    Plug 'jackguo380/vim-lsp-cxx-highlight'

  endif

  if index(g:bundle_group, 'code') >= 0

    " ----- * autoformat * ----- "
    Plug 'Chiel92/vim-autoformat'
    " ----- * 代码注释 * ----- "
    Plug 'preservim/nerdcommenter'

    " ----- * vim-closetag * ----- "
    Plug 'alvan/vim-closetag'

    " ----- * 显示code-tags * ----- "
    Plug 'liuchengxu/vista.vim'

    " ----- * vim-go * ----- "
    " Plug 'fatih/vim-go'

    " ----- * gas语法 * ----- "
    Plug 'Shirk/vim-gas'
    " ----- * toml syntax * ----- "
    Plug 'cespare/vim-toml'
    " ----- * i3语法 * ----- "
    Plug 'PotatoesMaster/i3-vim-syntax'
    " ----- * sxhkd语法 * ----- "
    Plug 'kovetskiy/sxhkd-vim'

  endif

  if index(g:bundle_group, 'markdown') >= 0

    " ----- * markdown预览 * ----- "
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    " ----- * 生成markdown目录 * ----- "
    Plug 'mzlogin/vim-markdown-toc'
    " ----- * 排序标签 * ----- "
    Plug 'dkarter/bullets.vim'
    " ----- * markdown语法 * ----- "
    Plug 'vimwiki/vimwiki'

  endif

  if index(g:bundle_group, 'latex') >= 0

    " ----- * latex * ----- "
    Plug 'lervag/vimtex'

  endif

  if index(g:bundle_group, 'textobj') >= 0

    " 快速选择
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
