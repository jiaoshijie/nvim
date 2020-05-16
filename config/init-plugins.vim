if !exists('g:bundle_group')
  let g:bundle_group = ['enhance', 'beautify', 'coc', 'golang', 'filetypes']
  let g:bundle_group += ['search', 'git', 'markdown', 'manager', 'latex', 'textobj']
  let g:bundle_group += ['grammar', 'unix_sudo']
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
  " ----- * f,F,t,T * ----- "
  Plug 'rhysd/clever-f.vim'

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
  let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}, {'width': 0.8, 'height': 0.8}]
  " =======
  " rnvimr-keymaps
  " =======
  nnoremap <silent> <leader>R :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 1<CR>

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
  xmap ga <Plug>(LiveEasyAlign)
  nmap ga <Plug>(LiveEasyAlign)

  " =======
  " clever-f
  " =======
  let g:clever_f_not_overwrites_standard_mappings=1
  let g:clever_f_across_no_line=1
  nmap f <Plug>(clever-f-f)
  xmap f <Plug>(clever-f-f)
  omap f <Plug>(clever-f-f)
  nmap F <Plug>(clever-f-F)
  xmap F <Plug>(clever-f-F)
  omap F <Plug>(clever-f-F)
  nmap ; <Plug>(clever-f-repeat-forward)
  nmap , <Plug>(clever-f-repeat-back)

endif


"----------------------------------------------------------------------
" coc 代码补全, 错误检查, 代码片段, 文件管理器, etc.
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
  " ----- * coc * ----- "
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " ----- * c cpp 语法语义 coc-clangd需要 * ----- "
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  " =======
  " coc-config
  " =======
  let g:coc_global_extensions = ['coc-clangd', 'coc-vimlsp', 'coc-lists', 'coc-yank','coc-json', 'coc-python',
        \ 'coc-html', 'coc-css', 'coc-tsserver', 'coc-vimtex', 'coc-snippets', 'coc-translator',
        \'coc-explorer', 'coc-stylelint', 'coc-tslint-plugin', 'coc-git']

  " =======
  " coc-keymaps
  " =======
  inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
  inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  " 调到类型的定义处
  nmap <silent> gd <Plug>(coc-definition)
  " 查看变量函数使用的位置
  nmap <silent> gr <Plug>(coc-references)
  " 跳转到错误的位置(包括警告)
  nmap <silent> gep <Plug>(coc-diagnostic-prev)
  nmap <silent> gen <Plug>(coc-diagnostic-next)
  " 显示错误完整信息
  nmap <silent> gs <Plug>(coc-diagnostic-info)
  " 获取变量和函数的一些信息
  nmap <silent> gh :call CocAction('doHover')<CR>

  " >>>>> coc-explorer <<<<< "
  " 打开文件管理器
  nmap <silent> tt :CocCommand explorer<CR>

  " >>>>> coc-translator <<<<< "
  " 翻译
  nmap <silent> ts <Plug>(coc-translator-p)

  " >>>>> coc-yank <<<<< "
  " 复制历史
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

  " >>>>> coc-git <<<<< "
  " navigate chunks of current buffer
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gp <Plug>(coc-git-chunkinfo)
  " create text object for git chunks
  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

endif

"----------------------------------------------------------------------
" golang
"----------------------------------------------------------------------
if index(g:bundle_group, 'golang') >= 0
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " =======
  " vim-go config
  " =======
  let g:go_doc_popup_window = 1
  let g:go_def_mapping_enabled = 0
  let g:go_template_autocreate = 0
  let g:go_auto_type_info = 1
  let g:go_doc_keywordprg_enabled = 0
  let g:go_list_type = "quickfix"
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  let g:go_metalinter_autosave_enabled = ['golint']

endif

"----------------------------------------------------------------------
" 一些美化插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'beautify') >= 0
  " ----- * 2款主题 * ----- "
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  " ----- * 状态栏 * ----- "
  Plug 'vim-airline/vim-airline'
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

  " =======
  " vim-airline-config
  " =======
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1

  " =======
  " vim-startify-config
  " =======
  let g:startify_change_to_dir = 1
  let g:startify_custom_header =
        \ 'startify#center(startify#fortune#cowsay())'
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
  let g:indentLine_fileType = ['c', 'cpp', 'python', 'gas', 'tex']  " 默认打开

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
  let g:vista#renderer#enable_icon = 1
  " =======
  " vista-keymaps
  " =======
  nnoremap <silent> T :Vista!!<cr>
  nnoremap <silent> <c-t> :Vista finder<cr>

  " =======
  " fzf-config
  " =======
  let g:fzf_preview_window = 'right:50%'
  " =======
  " fzf-keymaps
  " =======
  " 搜索当前目录下的文件
  nnoremap <silent> <leader>ff :FZF<cr>

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
  " 清除默认快捷键
  let g:Lf_ShortcutF = ''
  let g:Lf_ShortcutB = ''
  " 搜索目录下文件的内容
  nnoremap <silent> <c-p> :Leaderf rg --smart-case<cr>
  " 切换buffer
  nnoremap <silent> <leader>bb :LeaderfBuffer<cr>
  " 搜索当前目录下git管理的文件
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
      \ 'vimwiki'
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

  " =======
  " asyncrun-config
  " =======
  let g:asyncrun_open = 8

endif

"----------------------------------------------------------------------
" 增强代码语法
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
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
if index(g:bundle_group, 'grammar') >= 0
  Plug 'rhysd/vim-grammarous'
  nnoremap <leader>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
  nmap <leader>rr <Plug>(grammarous-open-info-window)
  nmap <leader>rv <Plug>(grammarous-move-to-info-window)
  nmap <leader>rs <Plug>(grammarous-reset)
  nmap <leader>rx <Plug>(grammarous-close-info-window)
  nmap <leader>rm <Plug>(grammarous-remove-error)
  nmap <leader>rd <Plug>(grammarous-disable-rule)
  nmap <leader>rn <Plug>(grammarous-move-to-next-error)
  nmap <leader>rp <Plug>(grammarous-move-to-previous-error)
endif
call plug#end()
