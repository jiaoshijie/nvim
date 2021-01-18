if !exists('g:bundle_group')
  let g:bundle_group = ['enhance', 'beautify', 'coc', 'golang', 'web', 'filetypes']
  let g:bundle_group += ['search', 'git', 'markdown', 'latex', 'textobj']
  let g:bundle_group += ['unix_sudo']

endif

if !exists('g:coc_global_extensions')
  " for coc
  let g:coc_global_extensions = []
endif

call plug#begin('~/.config/nvim/plugged')

"----------------------------------------------------------------------
" 增强功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhance') >= 0
  " ----- * 成对 * ----- "
  " saiw( --- snadwich add inner word (); for example: foo saiw( -> (foo)
  " sa sd sr add delete replace
  Plug 'machakann/vim-sandwich'
  " ----- * 代码注释 * ----- "
  Plug 'preservim/nerdcommenter'
  " ----- * undotree * ----- "
  Plug 'mbbill/undotree/'
  " ----- * 调用ranger文件管理器 * ----- "
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " ----- * 多光标操作 * ----- "
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " ----- * f,F,t,T * ----- "
  Plug 'rhysd/clever-f.vim'
  " ----- * vim bookmark * ----- "
  Plug 'MattesGroeger/vim-bookmarks'
  " ----- * vim auto-pairs * ----- "
  Plug 'jiangmiao/auto-pairs'

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
  nnoremap <silent> <leader>R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 1<CR>

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

  " =======
  " vim bookmark
  " =======
  let g:bookmark_no_default_key_mappings = 1
  let g:bookmark_auto_save_file = $HOME.'/.cache/.vim-bookmarks'
  highlight BookmarkSign ctermbg=NONE ctermfg=160
  highlight BookmarkLine ctermbg=194 ctermfg=NONE
  let g:bookmark_sign = '⚑'
  let g:bookmark_highlight_lines = 1
  nmap mm <Plug>BookmarkToggle
  nmap mn <Plug>BookmarkNext
  nmap mp <Plug>BookmarkPrev
  nmap ma <Plug>BookmarkShowall
  nmap mc <Plug>BookmarkClear
  nmap mC <Plug>BookmarkClearAll

  " =======
  " vim auto-pairs
  " =======
  let g:AutoPairsFlyMode = 1
  let g:AutoPairsShortcutBackInsert = '<M-b>'

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
  " coc-misc-config
  " =======
  let g:coc_global_extensions += ['coc-actions', 'coc-json', 'coc-vimlsp', 'coc-lists',
        \ 'coc-yank', 'coc-translator', 'coc-explorer', 'coc-snippets', 'coc-yaml',
        \ 'coc-project', 'coc-marketplace', 'coc-tabnine', 'coc-highlight']


  " =======
  " coc-C Cpp-config
  " =======
  let g:coc_global_extensions += ['coc-clangd']

  " =======
  " coc-Python-config
  " =======
  let g:coc_global_extensions += ['coc-python']

  " =======
  " coc-keymaps
  " =======
  " Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " inoremap <silent><expr> <cr>
  "       \ pumvisible() ? coc#_select_confirm()
  "       \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " 调到类型的定义处
  nmap <silent> gd <Plug>(coc-definition)
  " 查看变量函数使用的位置
  nmap <silent> gr <Plug>(coc-references)
  " 跳转到错误的位置(包括警告)
  nnoremap <silent><nowait> <space>gee  :<C-u>CocList diagnostics<cr>
  nmap <silent> gep <Plug>(coc-diagnostic-prev)
  nmap <silent> gen <Plug>(coc-diagnostic-next)
  " 显示错误完整信息
  nmap <silent> gs <Plug>(coc-diagnostic-info)
  " GoTo code navigation.
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  augroup jsj_Fileobject
    autocmd!
    autocmd FileType javascript,typescript xmap if <Plug>(coc-funcobj-i)
    autocmd FileType javascript,typescript omap if <Plug>(coc-funcobj-i)
    autocmd FileType javascript,typescript xmap af <Plug>(coc-funcobj-a)
    autocmd FileType javascript,typescript omap af <Plug>(coc-funcobj-a)
    autocmd FileType javascript,typescript xmap ic <Plug>(coc-classobj-i)
    autocmd FileType javascript,typescript omap ic <Plug>(coc-classobj-i)
    autocmd FileType javascript,typescript xmap ac <Plug>(coc-classobj-a)
    autocmd FileType javascript,typescript omap ac <Plug>(coc-classobj-a)
  augroup END

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
  nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

  " Formatting selected code.
  xmap <leader>g=  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


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
  " vmap <C-j> <Plug>(coc-snippets-select)
  " Use <C-l> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-l>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'
  " Use <C-l> for both expand and jump (make expand higher priority.)
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

  " >>>>> coc-actions <<<<< "
  " Remap for do codeAction of selected region
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

endif

"----------------------------------------------------------------------
" golang
"----------------------------------------------------------------------
if index(g:bundle_group, 'golang') >= 0
  Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

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
" web
"----------------------------------------------------------------------
if index(g:bundle_group, 'web')

  if index(g:bundle_group, 'coc')
    let g:coc_global_extensions += ['coc-html', 'coc-css', 'coc-tsserver',
          \ 'coc-tslint-plugin', 'coc-stylelint', 'coc-style-helper']
  endif

  " ----- * vim-close * ----- "
  Plug 'alvan/vim-closetag'

  " =======
  " close-config
  " =======
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
  let g:closetag_filetypes = 'html,xhtml,phtml'
  let g:closetag_xhtml_filetypes = 'xhtml,jsx'
  let g:closetag_emptyTags_caseSensitive = 1
  let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ }
  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'
  let g:closetag_close_shortcut = '<localleader>>'

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
  " ----- * 彩虹括号 * ----- "
  Plug 'luochen1990/rainbow'
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
  let g:indentLine_fileType = ['c', 'cpp', 'python', 'gas', 'tex', 'javascript', 'html', 'css']  " 默认打开

endif

"----------------------------------------------------------------------
" 快速搜索, 查找
"----------------------------------------------------------------------
if index(g:bundle_group, 'search') >= 0
  " ----- * 显示tags 和 一些其他功能 * ----- "
  Plug 'liuchengxu/vista.vim'
  " ----- * 快速搜索 * ----- "
  Plug 'junegunn/fzf.vim'

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
  let g:fzf_preview_window = ''
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
        \   fzf#vim#with_preview(), <bang>0)
  " =======
  " fzf-keymaps
  " =======
  " 搜索当前目录下的文件
  nnoremap <silent> <leader>ff :FZF<cr>
  nnoremap <silent> <leader>fr :History<cr>
  " 搜索目录下文件的内容
  nnoremap <silent> <c-p> :Rg<cr>
  " 切换buffer
  nnoremap <silent> <leader>bb :Buffers<cr>
  " 搜索当前目录下git管理的文件
  nnoremap <silent> <leader>fg :GitFiles<cr>
  nnoremap <silent> <leader>ll :BLines<cr>
  nnoremap <silent> <leader>lb :Lines<cr>
  nnoremap <silent> <leader>mm :Marks<cr>

endif

"----------------------------------------------------------------------
" vim 内使用git 功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'git') >= 0

  if index(g:bundle_group, 'coc')
    let g:coc_global_extensions += ['coc-git']
  endif

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
  let g:mkdp_auto_close = 0
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

  if index(g:bundle_group, 'coc')
    let g:coc_global_extensions += ['coc-vimtex']
  endif

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
  let g:tex_flavor = 'latex'

endif

"----------------------------------------------------------------------
" 增强代码语法
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

  " ----- * gas语法 * ----- "
  Plug 'Shirk/vim-gas'
  " ----- * toml syntax * ----- "
  Plug 'cespare/vim-toml'
  " ----- * i3语法 * ----- "
  Plug 'PotatoesMaster/i3-vim-syntax'
  " ----- * sxhkd语法 * ----- "
  Plug 'kovetskiy/sxhkd-vim'

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

  " 快速选择
  Plug 'gcmt/wildfire.vim'

  " 基础插件：提供让用户方便的自定义文本对象的接口
  Plug 'kana/vim-textobj-user'
  " 函数文本对象：if/af 支持 c/c++/vim/java
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
  " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
  Plug 'bps/vim-textobj-python', {'for': 'python'}
  " 参数文本对象：i,/a, 包括参数或者列表元素 c cpp python
  Plug 'sgur/vim-textobj-parameter'
  " 提供html tag 中参数文本对象, ix/ax表示
  Plug 'whatyouhide/vim-textobj-xmlattr'
  " 提供 uri/url 的文本对象，iu/au 表示
  Plug 'jceb/vim-textobj-uri'

  " =======
  " wildfire-keymaps
  " =======
  " This selects the next closest text object.
  map <C-l> <Plug>(wildfire-fuel)
  " This selects the previous closest text object.
  vmap <C-k> <Plug>(wildfire-water)

endif

call plug#end()
