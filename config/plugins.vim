call plug#begin('~/.config/nvim/plugged')

" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }


" 美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/space-vim-theme'
Plug 'ajmwagar/vim-deus'

" 代码缩进提示
Plug 'Yggdroot/indentLine'

Plug 'ryanoasis/vim-devicons'

" 查找
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'

" 高亮感兴趣的单词
Plug 'lfv89/vim-interestingwords'

" 静态检查代码
" Plug 'dense-analysis/ale'

" 括号补全插件
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" far
" Plug 'brooth/far.vim'

" for git TODO
Plug 'tpope/vim-fugitive'

" Undo Tree
Plug 'mbbill/undotree/'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dkarter/bullets.vim'
Plug 'vimwiki/vimwiki'

" latex
Plug 'lervag/vimtex'

"Bookmakrs
Plug 'kshenoy/vim-signature'

" HTML, CSS, JavaScript, JSON, etc.
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
" Plug 'mattn/emmet-vim'  " html snippets

" ranger
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" others
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular' " EXAMPLE: Tabularize /=
" Plug 'honza/vim-snippets'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'Shirk/vim-gas'
Plug 'skywind3000/asyncrun.vim'

call plug#end()


" ----- * coc * ----- "
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-vimtex', 'coc-snippets', 'coc-translator', 'coc-explorer']

" ----- * airline * ----- "
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline_theme='deus'
" let g:airline_theme='simple'

" ----- * indentLine * ----- "
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ----- * vim-interestingwords * ----- "
let g:interestingWordsRandomiseColors = 1

" ----- * Undo Tree * ----- "
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 40 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
" let g:undotree_SplitWidth = 40
let g:undotree_HighlightChangedText = 1

" ----- * Markdown * ----- "
" let g:mkdp_browser = "google-chrome-stable"
let g:mkdp_browser = "surf"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
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
let g:vista_fzf_preview = ['right:50%']

" ----- * rnvimr * ----- "
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ----- * vimviki * ----- "
let g:vimwiki_list = [{'path': '~/Nutstore Files/Nutstore/MARKDOWN_NOTE/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" ----- * goyo * ----- "
let g:goyo_width = 80
let g:goyo_height = 85
let g:goyo_linenr = 0
let g:limelight_conceal_ctermfg = 250
let g:limelight_default_coefficient = 0.8

" ----- * nerdcommenter * ----- "
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" ----- * UltiSnips * ----- "
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/']

" -----* which key *----- "
" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" let g:which_key_map = {}

" -----* vimtex *----- "
"  使用xelatex 需要在tex文件开头使用%!TEX program = xelatex
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

" -----* Async *----- "
let g:asyncrun_open = 8
