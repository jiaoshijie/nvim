" 插件安装和配置
call plug#begin('~/.config/nvim/plugged')

" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }


" 美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-theme'
Plug 'mhinz/vim-startify'

" 代码缩进提示
Plug 'Yggdroot/indentLine'

" 目录树
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'Shougo/defx.nvim'
" Plug 'kristijanhusak/defx-icons'

" 查找
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
" Plug 'majutsushi/tagbar'
" Plug 'Yggdroot/LeaderF'

" 高亮感兴趣的单词
Plug 'lfv89/vim-interestingwords'

" 静态检查代码 coc代替
" Plug 'dense-analysis/ale'

" 括号补全插件
Plug 'Raimondi/delimitMate'

" vim-surround
Plug 'tpope/vim-surround'

" far
Plug 'brooth/far.vim'

" Undo Tree
Plug 'mbbill/undotree/'

" 代码注释
Plug 'scrooloose/nerdcommenter'

" Markdown
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dkarter/bullets.vim'
Plug 'godlygeek/tabular' " 文本对齐
Plug 'vimwiki/vimwiki'
" Plug 'jceb/vim-orgmode'

"Bookmakrs
Plug 'kshenoy/vim-signature'

" HTML, CSS, JavaScript, JSON, etc.
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
" Plug 'mattn/emmet-vim'  " html snippets

" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" others
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
" Plug 'honza/vim-snippets'

call plug#end()


" ----- * coc * ----- "
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver']

" ----- * NERDTree * ----- "
let NERDTreeMapToggleHidden = "zh"
let NERDTreeDirArrowExpandable=">"
let NERDTreeDirArrowCollapsible="v"

" ----- * NERDTree-git * ----- "
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ----- * airline * ----- "
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline_theme='light'

" ----- * indentLine * ----- "
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ----- * vim-interestingwords * ----- "
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
" let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
" let g:interestingWordsRandomiseColors = 1

" ----- * Undo Tree * ----- "
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 40 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
" let g:undotree_SplitWidth = 40
let g:undotree_HighlightChangedText = 1

" ----- * far * ----- "
" set lazyredraw
" set regexpengine=1

" ----- * Markdown * ----- "
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 0
let g:mkdp_command_for_global = 0
let g:table_mode_corner='|'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \]

" ----- * vista * ----- "
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview = ['right:50%']

" ----- * Ranger.vim * ----- "
let g:ranger_map_keys = 0

" ----- * vimviki * ----- "
let g:vimwiki_list = [{'path': '~/Nutstore Files/Nutstore/MARKDOWN_NOTE/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" ----- * goyo * ----- "
" g:goyo_width (default: 80)
" g:goyo_height (default: 85%)
" g:goyo_linenr (default: 0)

" ----- * nerdcommenter * ----- "
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" ----- * multi_cursor * ----- "
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_normal_maps = {'@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, '!': 1, '"': 1, 'c': 1, 'd': 1, 'f': 1, 'g': 1, 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, '<': 1, '=': 1, '>': 1}
let g:multi_cursor_visual_maps = {'T': 1, 'a': 1, 't': 1, 'F': 1, 'f': 1, 'i': 1}

" ----- * UltiSnips * ----- "
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/']
