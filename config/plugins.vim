call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'dense-analysis/ale'

" Debuger
" Plug 'puremourning/vimspector'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/space-vim-theme'
Plug 'ajmwagar/vim-deus'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'gko/vim-coloresque'

Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'

Plug 'RRethy/vim-illuminate'
Plug 'lfv89/vim-interestingwords'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

" for git
Plug 'tpope/vim-fugitive'

" Undo Tree
Plug 'mbbill/undotree/'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mzlogin/vim-markdown-toc'
Plug 'dkarter/bullets.vim'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

" latex
Plug 'lervag/vimtex'

"Bookmakrs
Plug 'kshenoy/vim-signature'

" ranger
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/asyncrun.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'fatih/vim-go'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim'

" Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'Shirk/vim-gas'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'kovetskiy/sxhkd-vim'

" sudo for neovim
Plug 'lambdalisue/suda.vim'

" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()


" ----- * coc * ----- "
let g:coc_global_extensions = ['coc-vimlsp', 'coc-lists', 'coc-yank','coc-json', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-vimtex', 'coc-snippets', 'coc-translator', 'coc-explorer', 'coc-stylelint', 'coc-tslint-plugin']
" , 'coc-pairs'

" ----- * airline * ----- "
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" ----- * indentLine * ----- "
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_enabled = 0
" let g:indentLine_fileType = ['c', 'cpp']    " 默认打开
" let g:indentLine_fileTypeExclude = []       " 默认关闭
" let g:indentLine_bufTypeExclude = []
" let g:indentLine_bufNameExclude = []
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = '2'

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
let g:mkdp_browser = "brave"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
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
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
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
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }

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

" -----* Rainbow *----- "
let g:rainbow_active = 1
let g:rainbow_conf = {
\  'separately': {
\    '*': "default",
\    'vimwiki': 0,
\  }
\}

" -----* illuminate *----- "
let g:Illuminate_delay = 300
let g:Illuminate_ftwhitelist = ['vim', 'sh', 'python', 'c', 'cpp']

" -----* vim-visual-multi *----- "
let g:VM_default_mappings = 0
let g:VM_mouse_mappings = 1
