" 插件安装和配置
call plug#begin('~/.config/nvim/plugged')

" 代码补全插件
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-clangx'
" Plug 'zchee/deoplete-jedi'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'Shougo/echodoc.vim'


" 美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-theme'
Plug 'taigacute/gruvbox9'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'  " 图标

" 代码缩进提示
Plug 'Yggdroot/indentLine'

" 目录树
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 代码跳转
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'jsfaint/gen_tags.vim'

" 查看代码定义
" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

" 高亮感兴趣的单词
Plug 'lfv89/vim-interestingwords'

" 格式化代码
Plug 'sbdchd/neoformat'

" 静态检查代码，显示错误
Plug 'w0rp/ale'

" 括号补全插件
Plug 'Raimondi/delimitMate'

" vim-surround
Plug 'tpope/vim-surround'

" 模糊查找
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

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

"Bookmakrs
Plug 'kshenoy/vim-signature'

" HTML, CSS, JavaScript, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" others
" Plug 'gcmt/wildfire.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'

call plug#end()


" ----- * ncm2 * ----- "
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 2
let g:ncm2#matcher = "substrfuzzy"
let g:ncm2#match_highlight = 'bold'
let g:ncm2_jedi#python_version=3
set shortmess+=c
set notimeout

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

" ----- * ale * ----- "
let g:ale_linters = {'c': ['gcc'],
      \ 'cpp': ['g++'],
      \ 'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

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

" ----- * vim-multiple-cursor * ----- "
let g:multi_cursor_use_default_mapping=0

" ----- * tabular * ----- "
"nnoremap <Leader>a= :Tabularize /=<CR>

" ----- * vista * ----- "
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
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
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" ----- * echodoc.vim * ----- "
" set cmdheight = 2
let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'virtual'
let g:echodoc#type = 'floating'
let g:echodoc#events = ['CompleteDone']
let g:echodoc#highlight_identifier = "Identifier"
let g:echodoc#highlight_arguments = "Special"
let g:echodoc#highlight_trailing = "Type"
