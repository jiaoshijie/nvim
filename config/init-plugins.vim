if !exists('g:bundle_group')
  let g:bundle_group = ['enhance', 'beautify', 'coc', 'filetypes']
  let g:bundle_group += ['search', 'git', 'markdown', 'manager', 'latex', 'textobj']
  let g:bundle_group += ['unix_sudo']
  " ['grammer', 'Debuger', 'which-key']
endif

call plug#begin('~/.config/nvim/plugged')

"----------------------------------------------------------------------
" 增强功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhance') >= 0
  " ----- * 成对替换 * ----- "
  Plug 'tpope/vim-surround'
  " ----- * 代码注释 * ----- "
  Plug 'scrooloose/nerdcommenter'
  " ----- * 括号补全 * ----- "
  Plug 'jiangmiao/auto-pairs'
  " ----- * undotree * ----- "
  Plug 'mbbill/undotree/'
  " ----- * 显示标签 * ----- "
  Plug 'kshenoy/vim-signature'
  " ----- * 调用ranger文件管理器 * ----- "
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " ----- * 多光标操作 * ----- "
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " ----- * 快速移动 * ----- "
  Plug 'easymotion/vim-easymotion'
  " ----- * 对齐代码 * ----- "
  Plug 'junegunn/vim-easy-align'

  " =======
  " nerdcommenter-config
  " =======
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCompactSexyComs = 1
  let g:NERDToggleCheckAllLines = 1
  let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
  " =======
  " nerdcommenter-keymaps
  " =======
  nmap <silent> <leader>cc <plug>NERDCommenterToggle
  vmap <silent> <leader>cc <plug>NERDCommenterToggle
  nmap <silent> <leader>ca <plug>NERDCommenterAppend
  nmap <silent> <leader>cA <plug>NERDCommenterAltDelims

  " =======
  " undotree-config
  " =======
  let g:undotree_CustomUndotreeCmd  = 'topleft vertical 40 new'
  let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
  let g:undotree_DiffAutoOpen = 1
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
  let g:undotree_HighlightChangedText = 1
  " =======
  " undotree-keymaps
  " =======
  nnoremap <silent> <leader>u :UndotreeToggle<cr>

  " =======
  " rnvimr-config
  " =======
  let g:rnvimr_ex_enable = 1
  let g:rnvimr_pick_enable = 1
  let g:rnvimr_layout = { 'relative': 'editor',
              \ 'width': &columns,
              \ 'height': &lines,
              \ 'col': 0,
              \ 'row': 0,
              \ 'style': 'minimal' }
  let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
  " =======
  " rnvimr-keymaps
  " =======
  nnoremap <silent> <leader>R :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>

  " =======
  " vim-visual-multi-config
  " =======
  let g:VM_default_mappings = 0
  let g:VM_mouse_mappings = 1
  " =======
  " vim-visual-multi-keymaps
  " =======
  let g:VM_maps = {}
  let g:VM_maps['Find Under']         = '<C-n>'
  let g:VM_maps['Find Subword Under'] = '<C-n>'
  let g:VM_maps["Undo"] = 'u'
  let g:VM_maps["Redo"] = '<C-r>'

  " =======
  " vim-easymotion-keymaps
  " =======
  nmap tf <Plug>(easymotion-overwin-f)
  nmap tF <Plug>(easymotion-overwin-f2)

  " =======
  " vim-easy-align-keymaps
  " =======
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

endif


"----------------------------------------------------------------------
" coc 代码补全, 错误检查, 代码片段, 文件管理器, etc.
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
  " ----- * coc * ----- "
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " ----- * 一些好用的代码片段 * ----- "
  Plug 'honza/vim-snippets'

  " =======
  " coc-config
  " =======
  let g:coc_global_extensions = ['coc-vimlsp', 'coc-lists', 'coc-yank','coc-json', 'coc-python',
        \ 'coc-html', 'coc-css', 'coc-tsserver', 'coc-vimtex', 'coc-snippets', 'coc-translator',
        \'coc-explorer', 'coc-stylelint', 'coc-tslint-plugin']

  " =======
  " coc-keymaps
  " =======
  inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
  inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  " 跳转到实现类而不是接口
  nmap <silent> gi <Plug>(coc-implementation)
  " Remap for rename current word
  nmap gm <Plug>(coc-rename)
  " Show documentation in preview window
  nmap <silent> gh :call CocAction('doHover')<CR>
  nmap <silent> gc :CocList diagnostics<CR>
  nmap <silent> go :CocList outline<CR>
  nmap <silent> gs :CocList -I symbols<CR>
  nmap <silent> gr <Plug>(coc-references)
  vmap <silent> gf <Plug>(coc-format-selected)

  " >>>>> coc-explorer <<<<< "
  nmap <silent> tt :CocCommand explorer<CR>

  " >>>>> coc-translator <<<<< "
  nmap <silent> ts <Plug>(coc-translator-p)

  " >>>>> coc-yank <<<<< "
  nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

  " >>>>> coc-snippets <<<<< "
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)
  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)
  " Use <C-l> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-l>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'
  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-l> <Plug>(coc-snippets-expand-jump)

endif


"----------------------------------------------------------------------
" 可视化debug
"----------------------------------------------------------------------
if index(g:bundle_group, 'Debuger') >= 0
  Plug 'puremourning/vimspector'
endif


"----------------------------------------------------------------------
" 一些美化插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'beautify') >= 0
  " ----- * 3款主题 * ----- "
  Plug 'ajmwagar/vim-deus'
  Plug 'joshdick/onedark.vim'
  Plug 'morhetz/gruvbox'
  " ----- * 状态栏 * ----- "
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " ----- * 显示图标 * ----- "
  Plug 'ryanoasis/vim-devicons'
  " ----- * 启动菜单 * ----- "
  Plug 'mhinz/vim-startify'
  " ----- * 彩虹括号 * ----- "
  Plug 'luochen1990/rainbow'
  " ----- * 高亮光标下的单词 * ----- "
  Plug 'RRethy/vim-illuminate'
  " ----- * 高亮感兴趣的单词 * ----- "
  Plug 'lfv89/vim-interestingwords'
  " ----- * 显示缩进线 * ----- "
  Plug 'Yggdroot/indentLine'
  " ----- * 简洁模式 * ----- "
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  " =======
  " vim-airline-config
  " =======
  let g:airline#extensions#tabline#enabled = 1
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline_theme='deus'

  " =======
  " vim-startify-keymaps
  " =======
  nnoremap <silent> <leader>fr :Startify<cr>

  " =======
  " rainbow-config
  " =======
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \  'separately': {
  \    '*': "default",
  \    'vimwiki': 0,
  \  }
  \}

  " =======
  " vim-illuminate-config
  " =======
  let g:Illuminate_delay = 300
  let g:Illuminate_ftwhitelist = ['vim', 'sh', 'python', 'c', 'cpp']

  " =======
  " vim-interestingwords-config
  " =======
  let g:interestingWordsRandomiseColors = 1
  " =======
  " vim-interestingwords-keymaps
  " =======
  nnoremap <silent> <leader>k :call interestingwords('n')<cr>

  " =======
  " indentLine-config
  " =======
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:indentLine_concealcursor = ''
  let g:indentLine_conceallevel = '2'
  let g:indentLine_fileType = ['c', 'cpp', 'python', 'gas']  " 默认打开

  " =======
  " goyo-config
  " =======
  let g:goyo_width = 80
  let g:goyo_height = 85
  let g:goyo_linenr = 0
  let g:limelight_conceal_ctermfg = 250
  let g:limelight_default_coefficient = 0.8
  " =======
  " goyo-keymaps
  " =======
  nnoremap <silent> <leader>gg :Goyo<cr>
  nnoremap <silent> <leader>gl :Limelight!!<cr>

endif

"----------------------------------------------------------------------
" 快速搜索, 查找
"----------------------------------------------------------------------
if index(g:bundle_group, 'search') >= 0
  " ----- * 显示tags 和 一些其他功能 * ----- "
  Plug 'liuchengxu/vista.vim'
  " ----- * 快速搜索 * ----- "
  Plug 'junegunn/fzf.vim'
  Plug 'Yggdroot/LeaderF'

  " =======
  " vista-config
  " =======
  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction
  set statusline+=%{NearestMethodOrFunction()}
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  let g:vista_fzf_preview = ['right:50%']
  " =======
  " vista-keymaps
  " =======
  nnoremap <silent> T :Vista!!<cr>
  nnoremap <silent> <c-t> :Vista finder<cr>

  " =======
  " LeaderF-config
  " =======
  " 隐藏帮助
  let g:Lf_HideHelp = 1
  " popup-mode
  let g:Lf_WindowPosition = 'popup'
  let g:Lf_PreviewInPopup = 1
  let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
  " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
  let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
  let g:Lf_WorkingDirectoryMode = 'Ac'
  let g:Lf_WindowHeight = 0.30
  let g:Lf_CacheDirectory = expand('~/.config/nvim/tmp/cache')
  " 模糊匹配忽略扩展名
  let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg', 'obj', 'bin'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]', '*.out']
        \ }
  " 最大历史文件保存
  let g:Lf_MruMaxFiles = 0
  " MRU 文件忽略扩展名
  let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
  " =======
  " LeaderF-keymaps
  " =======
  nnoremap <silent> <c-p> :Leaderf rg --smart-case<cr>
  nnoremap <silent> <leader>bb :LeaderfBuffer<cr>
  nnoremap <silent> <leader>ff :LeaderfFile $HOME<cr>
  nnoremap <silent> <leader>fg :LeaderfFile<cr>

endif

"----------------------------------------------------------------------
" vim 内使用git 功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'git') >= 0
  Plug 'tpope/vim-fugitive'
endif

"----------------------------------------------------------------------
" markdown
"----------------------------------------------------------------------
if index(g:bundle_group, 'markdown') >= 0
  " ----- * markdown预览 * ----- "
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  " ----- * 生成markdown目录 * ----- "
  Plug 'mzlogin/vim-markdown-toc'
  " ----- * 排序标签 * ----- "
  Plug 'dkarter/bullets.vim'
  " ----- * markdown语法 * ----- "
  Plug 'vimwiki/vimwiki'

  " =======
  " markdown-preview-config
  " =======
  let g:mkdp_browser = "brave"
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 1
  let g:mkdp_refresh_slow = 0
  " =======
  " markdown-preview-keymaps
  " =======
  nnoremap <silent> <leader>pp :MarkdownPreview<cr>
  nnoremap <silent> <leader>ps :MarkdownPreviewStop<cr>

  " =======
  " vim-markdown-toc-keymaps
  " =======
  nnoremap <silent> <leader>pg :GenTocGFM<cr>
  nnoremap <silent> <leader>pu :UpdateToc<cr>
  nnoremap <silent> <leader>pD :RemoveToc<cr>

  " =======
  " bullets-config
  " =======
  let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \]

  " =======
  " vimwiki-config
  " =======
  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown',
        \ '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  let g:vimwiki_list = [{'path': '~/Nutstore Files/Nutstore/MARKDOWN_NOTE/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

endif

"----------------------------------------------------------------------
" latex预览等
"----------------------------------------------------------------------
if index(g:bundle_group, 'latex') >= 0
  " ----- * latex * ----- "
  Plug 'lervag/vimtex'

  " =======
  " vimtex-config
  " =======
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-xelatex',
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

endif

"----------------------------------------------------------------------
" 编译管理
"----------------------------------------------------------------------
if index(g:bundle_group, 'manager') >= 0
  " ----- * vim运行终端命令 * ----- "
  Plug 'skywind3000/asyncrun.vim'
  " ----- * 任务管理 * ----- "
  " https://github.com/skywind3000/asynctasks.vim/blob/master/README-cn.md
  Plug 'skywind3000/asynctasks.vim'
  " ----- * 日历 * ----- "
  Plug 'itchyny/calendar.vim'

  " =======
  " asyncrun-config
  " =======
  let g:asyncrun_open = 8

endif

"----------------------------------------------------------------------
" 增强代码语法
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
  " ----- * C++ 语法高亮增强，支持 11/14/17 标准 * ----- "
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
  " ----- * python 语法文件增强 * ----- "
  Plug 'vim-python/python-syntax', { 'for': ['python'] }
  " ----- * js语法 * ----- "
  Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
  " ----- * gas语法 * ----- "
  Plug 'Shirk/vim-gas'
  " ----- * i3语法 * ----- "
  Plug 'PotatoesMaster/i3-vim-syntax'
  " ----- * sxhkd语法 * ----- "
  Plug 'kovetskiy/sxhkd-vim'
  " ----- * 显示颜色 * ----- "
  Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " =======
  " vim-hexokinase-config
  " =======
  let g:Hexokinase_highlighters = [ 'backgroundfull' ]
  let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'vimwiki', 'markdown']

endif

"----------------------------------------------------------------------
" sudo for neovim
"----------------------------------------------------------------------
if index(g:bundle_group, 'unix_sudo') >= 0
  Plug 'lambdalisue/suda.vim'
endif

"----------------------------------------------------------------------
" which-key 显示可用快捷键
"----------------------------------------------------------------------
if index(g:bundle_group, 'which-key') >= 0
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  " ----- * whichkey-config * ----- "
  let g:mapleader = "\<Space>"
  let g:maplocalleader = ','
  let g:which_key_map = {}

  " ----- * whichkey-keymaps * ----- "
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
endif

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

  " 基础插件：提供让用户方便的自定义文本对象的接口
  Plug 'kana/vim-textobj-user'
  " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  Plug 'kana/vim-textobj-indent'
  " 语法文本对象：iy/ay 基于语法的文本对象
  Plug 'kana/vim-textobj-syntax'
  " 函数文本对象：if/af 支持 c/c++/vim/java
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
  " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
  Plug 'bps/vim-textobj-python', {'for': 'python'}
  " 参数文本对象：i,/a, 包括参数或者列表元素
  Plug 'sgur/vim-textobj-parameter'
  " 提供 uri/url 的文本对象，iu/au 表示
  Plug 'jceb/vim-textobj-uri'

endif


"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
  Plug 'rhysd/vim-grammarous'
  noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
  map <space>rr <Plug>(grammarous-open-info-window)
  map <space>rv <Plug>(grammarous-move-to-info-window)
  map <space>rs <Plug>(grammarous-reset)
  map <space>rx <Plug>(grammarous-close-info-window)
  map <space>rm <Plug>(grammarous-remove-error)
  map <space>rd <Plug>(grammarous-disable-rule)
  map <space>rn <Plug>(grammarous-move-to-next-error)
  map <space>rp <Plug>(grammarous-move-to-previous-error)
endif
call plug#end()
