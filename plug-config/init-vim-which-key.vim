" =======
" which key
" =======
" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:which_key_sep = '→'

let g:which_key_map = {}
let g:which_key_map['='] = ["mIgg=G'ImI", 'format code']
let g:which_key_map['o'] = [':setlocal spell! spelllang=en_us', 'using spellcheck']
let g:which_key_map['u'] = [":UndotreeToggle", 'undo tree']
" let g:which_key_map['R'] = [":RnvimrToggle", 'ranger fm']
let g:which_key_map['k'] = [":call interestingwords('n')", 'interestingwords']
let g:which_key_map['S'] = ["<Plug>(easymotion-overwin-f2)", 'move to {char}{char}']

" window
let g:which_key_map.w = {
      \ 'name': '+window',
      \ 'v': [':vslit', 'window vsplit'],
      \ '-': [':split', 'window split'],
      \ '=': ['<C-w>=', 'equal window'],
      \ 'o': ['<C-w>o', 'window only'],
      \ 'd': ['<C-w>c', 'delete current window'],
      \ 'K': ['<C-w>K', 'move window to up'],
      \ 'J': ['<C-w>J', 'move window to down'],
      \ 'H': ['<C-w>H', 'move window to left'],
      \ 'L': ['<C-w>L', 'move window to right'],
      \ }

" buffer
let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ 'b': [':Buffers', 'switch buffer'],
      \ 'p': [':bprevious', 'buffer prev'],
      \ 'n': [':bnext', 'buffer next'],
      \ 'd': [':bdelete', 'delete current buffer'],
      \ }

" tab
let g:which_key_map.t = {
      \ 'name': '+tab',
      \ 'd': ['tabclose', 'delete current tab'],
      \ 'o': ['tabonly', 'tab only'],
      \ }

" code
let g:which_key_map.c = {
      \ 'name': '+code',
      \ 'c': ['<plug>NERDCommenterToggle', 'comment code'],
      \ 'a': ['<plug>NERDCommenterAppend', 'append comment'],
      \ 'A': ['<plug>NERDCommenterAltDelims', 'change the comment flag'],
      \ 't': [':Vista!!', 'show code outline'],
      \ 'f': [':Vista finder', 'search code symbol in outline'],
      \ 'T': [':call Change_theme_alpha()', 'change theme alpha'],
      \ }

" bookmark
let g:which_key_map.m = {
      \ 'name': '+bookmark',
      \ 'm': ['<Plug>BookmarkToggle', 'toggle bookmark'],
      \ 'n': ['<Plug>BookmarkNext', 'current buffer: next bookmark'],
      \ 'p': ['<Plug>BookmarkPrev', 'current buffer: prev bookmark'],
      \ 'a': ['<Plug>BookmarkShowAll', 'show all bookmark'],
      \ 'c': ['<Plug>BookmarkClear', 'clear current buffer bookmark'],
      \ 'C': ['<Plug>BookmarkClearAll', 'clear all bookmark'],
      \ 'M': [':Marks', 'show vimself bookmark'],
      \ }

let g:which_key_map.g = {
      \ 'name': '+coc keybinding',
      \ 'a': [':CocList extensions', 'Show Coc extensions'],
      \ 'p': [':CocList project', 'open Project dir'],
      \ 'c': [':CocList commands', 'using coc commands'],
      \ 'd': ['<Plug>(coc-definition)', 'Jump to definition'],
      \ 'r': ['<Plug>(coc-references)', 'Jump to references'],
      \ 'y': ['<Plug>(coc-type-definition)', 'Jump to type definition'],
      \ 'i': ['<Plug>(coc-implementation)', 'Jump to implementation'],
      \ '=': ['<Plug>(coc-format-selected)', 'Coc format code'],
      \ 'h': [':CocList -A --normal yank', 'show all yank history'],
      \ 'e': {
      \       'name': '+coding error',
      \       'e': ['<Plug>(coc-diagnostic-info)', 'Show all coding error information'],
      \       's': [':CocList diagnostics', 'Show all coding error in CocList'],
      \       'p': ['<Plug>(coc-diagnostic-prev)', 'Jump to prev error'],
      \       'n': ['<Plug>(coc-diagnostic-next)', 'Jump to next error'],
      \       },
      \ 'w': {
      \       'name': '+search and rename variables',
      \       'w': [':echo "<leader>gww"', 'search same name variables'],
      \       'r': ['<Plug>(coc-rename)', 'rename same name variables'],
      \ },
      \ }

let g:which_key_map.z = {
      \ 'name': '+foldcode',
      \ 'z': [':call ToggleFold()', "ToggleFold code"],
      \ }

let g:which_key_map.x = {
      \ 'name': '+text to hex',
      \ 'd': [':%!xxd', 'translate to hex'],
      \ 'r': [':%!xxd -r', 'come back to text'],
      \ }

" encode translate
let g:which_key_map.e = {
      \ 'name': '+encode',
      \ 'u': [':e ++enc=utf8', 'encode to utf-8'],
      \ 'g': [':e ++enc=gbk', 'encode to gbk'],
      \ }

" easymotion
let g:which_key_map.s = {
  \ 'name': '+move cursor with easymotion',
  \ 's': ['<Plug>(easymotion-overwin-f)', 'move to {char}'],
  \ 'l': ['<Plug>(easymotion-overwin-line)', 'move to line'],
  \ 'w': ['<Plug>(easymotion-overwin-w)', 'move to word'],
  \ }

" quit vim
let g:which_key_map.q = {
      \ 'name': '+exit vim',
      \ 'q': [':q', 'exit this window'],
      \ 'a': [':qall', 'exit all window'],
      \ }

" file and search
let g:which_key_map.f = {
      \ 'name': '+file-search',
      \ 's': [':w', 'save file'],
      \ 'f': [':Rg', 'fuzzyfinder search current dir all contents'],
      \ 'd': [':FZF', 'search current dir'],
      \ 'r': [':History', 'search history file'],
      \ 'l': [':BLines', 'search curent buf line'],
      \ 'a': [':Lines', 'search all buf line'],
      \ 'g': [':GitFiles', 'search git file'],
      \ }

" Markdown
let g:which_key_map.p = {
      \ 'name': "+markdown",
      \ 'p': [':MarkdownPreview', 'markdown preview'],
      \ 's': [':MarkdownPreviewStop', 'stop markdown preview'],
      \ 'g': [':GenTocGFM', 'create markdown outline'],
      \ 'u': [':UpdateToc', 'update markdown outline'],
      \ 'D': [':RemoveToc', 'remove markdown outline'],
      \ }

call which_key#register('<Space>', "g:which_key_map")
